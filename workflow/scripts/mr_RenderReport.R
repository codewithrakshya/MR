# Render hmtl_report.Rmd to generate html report of output
## Input script for rule html_Report

if(any(grepl("conda", .libPaths(), fixed = TRUE))){
  message("Setting libPaths")
  df = .libPaths()
  conda_i = which(grepl("conda", df, fixed = TRUE))
  .libPaths(c(df[conda_i], df[-conda_i]))
}

# log_path = snakemake@log[[1]]
#
# ## Logging messages
# con <- file(log_path, open = "wt")
# sink(con, type = "message")

rmarkdown::render(
  input = snakemake@input[["markdown"]],
  clean = TRUE,
  intermediates_dir = snakemake@params[["output_dir"]],
  output_file = snakemake@output[["outfile"]],
  output_dir = snakemake@params[["output_dir"]],
  output_format = "all",
  params = list(
    rwd = snakemake@params[["rwd"]],
    Rlib = snakemake@params[["Rlib"]],
    exposure.snps = snakemake@input[["ExposureSnps"]],
    outcome.snps = snakemake@input[["OutcomeSnps"]],
    proxy.snps = snakemake@input[["ProxySnps"]],
    harmonized.dat = snakemake@input[["HarmonizedDat"]],
    mrpresso_global = snakemake@input[["mrpresso_global"]],
    power = snakemake@input[["power"]],
    outcome.code = snakemake@params[["OutcomeCode"]],
    exposure.code = snakemake@params[["ExposureCode"]],
    Outcome = snakemake@params[["Outcome"]],
    Exposure = snakemake@params[["Exposure"]],
    p.threshold = snakemake@params[["Pthreshold"]],
    r2.threshold = snakemake@params[["r2threshold"]],
    kb.threshold = snakemake@params[["kbthreshold"]],
    out = snakemake@params[["output_name"]])
)
