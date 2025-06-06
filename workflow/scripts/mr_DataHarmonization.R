#!/usr/bin/Rscript
## ========================================================================== ##
## Use TwoSampleMR to harmonize exposure and outcome datasets
## ========================================================================== ##

if(any(grepl("conda", .libPaths(), fixed = TRUE))){
  message("Setting libPaths")
  df = .libPaths()
  conda_i = which(grepl("conda", df, fixed = TRUE))
  .libPaths(c(df[conda_i], df[-conda_i]))
}

message("Begining Harmonization \n")
### ===== Command Line Arguments ===== ##
## Infiles
exposure.summary= snakemake@input[["ExposureSummary"]]
outcome.summary = snakemake@input[["OutcomeSummary"]]
proxy.snps = snakemake@input[["ProxySNPs"]]
## Outfile
out.harmonized = snakemake@output[["Harmonized"]]
## Params for output
pt = as.numeric(snakemake@params[["Pthreshold"]])
ExposureCode = snakemake@params[["excposurecode"]]
OutcomeCode = snakemake@params[["outcomecode"]]
## Regions for exclusion
regions_chrm = snakemake@params[["regions_chrm"]]
regions_start = snakemake@params[["regions_start"]]
regions_stop = snakemake@params[["regions_stop"]]


### ===== Load packages ===== ###
message("Loading packages  \n")
library(tidyr)
library(glue)
library(readr)
library(dplyr)
library(TwoSampleMR) ## For conducting MR https://mrcieu.github.io/TwoSampleMR/


### ===== Read In Data ===== ###
message("READING IN EXPOSURE \n")
exposure.dat <- read_tsv(exposure.summary)

message("READING IN OUTCOME \n")
outcome.dat <- read_tsv(outcome.summary)

message("READING IN PROXY SNPs \n")
proxy.dat <- read_csv(proxy.snps) %>%
  filter(proxy.outcome == TRUE) %>%
  select(proxy.outcome, target_snp, proxy_snp, ALT, REF, ALT.proxy, REF.proxy) %>%
  mutate(SNP = target_snp) %>%
  rename(target_snp.outcome = target_snp, proxy_snp.outcome = proxy_snp, target_a1.outcome = ALT, target_a2.outcome = REF, proxy_a1.outcome = ALT.proxy, proxy_a2.outcome = REF.proxy)


### ===== Harmonization ===== ###
message("Formating Exposure and Outcome \n")
# Format Exposure
mr_exposure.dat <- format_data(exposure.dat, type = 'exposure',
                            snp_col = 'SNP',
                            chr_col = 'CHROM',
                            pos_col = 'POS',
                            beta_col = "BETA",
                            se_col = "SE",
                            eaf_col = "AF",
                            effect_allele_col = "ALT",
                            other_allele_col = "REF",
                            pval_col = "P",
                            z_col = "Z",
                            samplesize_col = "N",
                            phenotype_col = 'TRAIT')
mr_exposure.dat$exposure =  ExposureCode

# Format Outcome
mr_outcome.dat <- format_data(outcome.dat, type = 'outcome',
                                 snp_col = 'SNP',
                                 chr_col = 'CHROM',
                                 pos_col = 'POS',
                                 beta_col = "BETA",
                                 se_col = "SE",
                                 eaf_col = "AF",
                                 effect_allele_col = "ALT",
                                 other_allele_col = "REF",
                                 pval_col = "P",
                                z_col = "Z",
                                samplesize_col = "N",
                                phenotype_col = 'TRAIT')
mr_outcome.dat$outcome =  OutcomeCode

# Harmonize Datasets
# Remove Plietropic variatns
## Exclude variants that are significant for outcome at a given Pt
## Exclude variants within genomic regions

# gws_pt = 5e-8
gws_pt = 5e-300

if(is.null(regions_chrm)){
  message("Harmonizing data \n")
  harmonized.MRdat <- harmonise_data(mr_exposure.dat, mr_outcome.dat) %>%
    as_tibble() %>%
    mutate(pt = pt,
      pleitropy_keep = case_when(pval.outcome <= gws_pt ~ FALSE,
                                  TRUE ~ TRUE))
} else {
  harmonized.MRdat <- harmonise_data(mr_exposure.dat, mr_outcome.dat) %>%
    as_tibble() %>%
    mutate(pt = pt,
      pleitropy_keep = case_when(pval.outcome <= gws_pt ~ FALSE, TRUE ~ TRUE))

  for(i in 1:length(regions_chrm)){
  message(glue("Harmonizing data and excluding regions: ", regions_chrm[i], ":", regions_start[i], "-", regions_stop[i]))
   harmonized.MRdat <- harmonized.MRdat %>%
    mutate(pleitropy_keep = case_when(
      pleitropy_keep == FALSE ~ FALSE,
      chr.exposure == regions_chrm[i] & between(pos.exposure, regions_start[i], regions_stop[i]) ~ FALSE,
      TRUE ~ TRUE))
    }
  }

print(filter(harmonized.MRdat, pleitropy_keep == FALSE) %>%
select(SNP, chr.exposure, pos.exposure, pval.exposure, pval.outcome))
print(count(harmonized.MRdat, pleitropy_keep) )
## Write out Harmonized data
message("Exporting Data to ", out.harmonized, "\n")
write_csv(harmonized.MRdat, out.harmonized)
