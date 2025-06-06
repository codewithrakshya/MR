#!/usr/bin/Rscript
## ========================================================================== ##
## Extract exposure instruments from outcome gwas
## ========================================================================== ##

if(any(grepl("conda", .libPaths(), fixed = TRUE))){
  message("Setting libPaths")
  df = .libPaths()
  conda_i = which(grepl("conda", df, fixed = TRUE))
  .libPaths(c(df[conda_i], df[-conda_i]))
}

### ===== Command Line Arguments ===== ##
exposure.summary = snakemake@input[["ExposureSummary"]] # Exposure summary statistics
outcome.summary = snakemake@input[["OutcomeSummary"]] # Outcome Summary statistics
out = snakemake@params[["Outcome"]]

### ===== Load packages ===== ###
library(tidyverse)## For data wrangling
library(dplyr)
library(readr)
#suppressMessages(library(Hmisc))       ## Contains miscillaneous funtions

### ===== READ IN SNPs ===== ###
message("READING IN EXPOSURE \n")
exposure.dat <- read_tsv(exposure.summary)

message("\n READING IN OUTCOME \n")
outcome.dat.raw <- read_tsv(outcome.summary, comment = '##', guess_max = 15000000)

### ===== EXTACT SNPS ===== ###
message("\n EXTRACTING SNP EFFECTS FROM OUTCOME GWAS  \n")
outcome.dat <- outcome.dat.raw %>%
  right_join(select(exposure.dat, SNP), by = 'SNP')


### ===== MISSING SNPS SNPS ===== ###

outcome.dat %>%
  filter(is.na(CHROM)) %>%
  select(SNP) %>%
  write_tsv(paste0(out, '_MissingSNPs.txt'), col_names = F)

message("\n EXPORTING \n")
## Write out outcomes SNPs
write_tsv(outcome.dat, paste0(out, '_SNPs.txt'))
