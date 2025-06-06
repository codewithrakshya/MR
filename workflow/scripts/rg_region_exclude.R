#!/usr/bin/Rscript
if(any(grepl("conda", .libPaths(), fixed = TRUE))){
  message("Setting libPaths")
  df = .libPaths()
  conda_i = which(grepl("conda", df, fixed = TRUE))
  .libPaths(c(df[conda_i], df[-conda_i]))
}
.libPaths(c(.libPaths(), "/hpc/users/harern01/miniconda3/envs/py38/lib/R/library"))
library(tidyr)
library(readr)
library(dplyr)
library(plyr)
library(glue)
#suppressMessages(library(tidyverse))
#suppressMessages(library(glue))

infile_gwas = snakemake@input[["ss"]]
outfile = snakemake@output[["out"]]
## Regions for exclusion
regions_chrm = snakemake@params[["regions_chrm"]]
regions_start = snakemake@params[["regions_start"]]
regions_stop = snakemake@params[["regions_stop"]]

trait.gwas <- suppressMessages(read_tsv(infile_gwas, comment = '#', guess_max = 11000000))


if(is.null(regions_chrm)){

  message("No genomic regions to exclude")

} else {

  for(i in 1:length(regions_chrm)){
    message(glue("Excluding regions: ", regions_chrm[i], ":", regions_start[i], "-", regions_stop[i]))
    trait.gwas <- trait.gwas %>%
      filter(!(CHROM == regions_chrm[i] & between(POS, regions_start[i], regions_stop[i])))
  }
}

write_tsv(trait.gwas , gzfile(outfile))
