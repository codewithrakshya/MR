---
title: "Mendelian Randomization Analysis"
author: "Dr. Shea Andrews"
date: "2021-02-19"
output:
  html_document:
    df_print: paged
    keep_md: true
    toc: true
    number_sections: false
    toc_depth: 4
    toc_float:
      collapsed: false
      smooth_scroll: false
params:
  rwd: NA
  exposure.code: NA
  Exposure: NA
  exposure.snps: NA
  outcome.code: NA
  Outcome: NA
  outcome.snps: NA
  proxy.snps: NA
  harmonized.dat: NA
  p.threshold: NA
  r2.threshold: NA
  kb.threshold: NA
  mrpresso_global: NA
  mrpresso_global_wo_outliers: NA
  power: NA
  out: NA
editor_options:
  chunk_output_type: console
---






## Instrumental Variables
**SNP Inclusion:** SNPS associated with at a p-value threshold of p < 5e-8 were included in this analysis.
<br>

**LD Clumping:** For standard two sample MR it is important to ensure that the instruments for the exposure are independent. LD clumping was performed in PLINK using the EUR samples from the 1000 Genomes Project to estimate LD between SNPs, and, amongst SNPs that have an LD above a given threshold, retain only the SNP with the lowest p-value. A clumping window of 10^{4}, r2 of 0.001 and significance level of 1 was used for the index and secondary SNPs.
<br>

**Proxy SNPs:** Where SNPs were not available in the outcome GWAS, the EUR thousand genomes was queried to identify potential proxy SNPs that are in linkage disequilibrium (r2 > 0.8) of the missing SNP.
<br>

### Exposure: ADHD
`#r exposure.blurb`
<br>

**Table 1:** Independent SNPs associated with ADHD
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["CHROM"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["POS"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["REF"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ALT"],"name":[5],"type":["chr"],"align":["left"]},{"label":["AF"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["BETA"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["SE"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Z"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["P"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["N"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["TRAIT"],"name":[12],"type":["chr"],"align":["left"]}],"data":[{"1":"rs17531412","2":"1","3":"44182244","4":"A","5":"G","6":"0.29498400","7":"-0.10539600","8":"0.0148","9":"-7.121320","10":"1.072e-12","11":"53293","12":"ADHD"},{"1":"rs1222063","2":"1","3":"96602440","4":"G","5":"A","6":"0.52673100","7":"0.09620069","8":"0.0174","9":"5.528775","10":"3.068e-08","11":"53293","12":"ADHD"},{"1":"rs4858241","2":"3","3":"20669071","4":"T","5":"G","6":"0.37391000","7":"-0.08219730","8":"0.0143","9":"-5.748060","10":"8.172e-09","11":"53293","12":"ADHD"},{"1":"rs28411770","2":"4","3":"31151456","4":"T","5":"C","6":"0.00641711","7":"-0.08610430","8":"0.0151","9":"-5.702270","10":"1.152e-08","11":"53293","12":"ADHD"},{"1":"rs4916723","2":"5","3":"87854395","4":"A","5":"C","6":"0.44136900","7":"0.07779940","8":"0.0138","9":"5.637640","10":"1.807e-08","11":"53293","12":"ADHD"},{"1":"rs10262192","2":"7","3":"114091753","4":"G","5":"A","6":"0.42545500","7":"0.07409583","8":"0.0135","9":"5.488580","10":"3.655e-08","11":"53293","12":"ADHD"},{"1":"rs74760947","2":"8","3":"34352610","4":"A","5":"G","6":"0.03478260","7":"0.17960500","8":"0.0317","9":"5.665780","10":"1.393e-08","11":"53293","12":"ADHD"},{"1":"rs11591402","2":"10","3":"106747354","4":"T","5":"A","6":"0.20769800","7":"-0.09240042","8":"0.0164","9":"-5.634172","10":"1.760e-08","11":"53293","12":"ADHD"},{"1":"rs1427829","2":"12","3":"89760744","4":"A","5":"G","6":"0.53397500","7":"-0.08219730","8":"0.0136","9":"-6.043920","10":"1.349e-09","11":"53293","12":"ADHD"},{"1":"rs8039398","2":"15","3":"47730870","4":"T","5":"C","6":"0.38590100","7":"0.07999600","8":"0.0135","9":"5.925630","10":"2.986e-09","11":"53293","12":"ADHD"},{"1":"rs212178","2":"16","3":"72578131","4":"G","5":"A","6":"0.92571000","7":"-0.11709577","8":"0.0205","9":"-5.711989","10":"1.198e-08","11":"53293","12":"ADHD"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

### Outcome: COVID: A2
`#r outcome.blurb`
<br>

**Table 2:** SNPs associated with ADHD avaliable in COVID: A2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["CHROM"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["POS"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["REF"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ALT"],"name":[5],"type":["chr"],"align":["left"]},{"label":["AF"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["BETA"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["SE"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Z"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["P"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["N"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["TRAIT"],"name":[12],"type":["chr"],"align":["left"]}],"data":[{"1":"rs17531412","2":"1","3":"44182244","4":"A","5":"G","6":"0.30690","7":"-0.07197600","8":"0.028421","9":"-2.53249358","10":"0.01133","11":"1059456","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs4858241","2":"3","3":"20669071","4":"T","5":"G","6":"0.35470","7":"0.05446100","8":"0.033494","9":"1.62599272","10":"0.10400","11":"1049400","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs4916723","2":"5","3":"87854395","4":"A","5":"C","6":"0.41980","7":"-0.04548700","8":"0.034419","9":"-1.32156658","10":"0.18630","11":"1049400","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs10262192","2":"7","3":"114091753","4":"G","5":"A","6":"0.43490","7":"-0.01960500","8":"0.032843","9":"-0.59693085","10":"0.55060","11":"1049400","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs74760947","2":"8","3":"34352610","4":"A","5":"G","6":"0.04843","7":"0.03490400","8":"0.066600","9":"0.52408408","10":"0.60020","11":"1059456","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs11591402","2":"10","3":"106747354","4":"T","5":"A","6":"0.22450","7":"-0.00034117","8":"0.030161","9":"-0.01131163","10":"0.99100","11":"1059456","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs1427829","2":"12","3":"89760744","4":"A","5":"G","6":"0.55020","7":"-0.05591500","8":"0.025870","9":"-2.16138384","10":"0.03066","11":"1059456","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs8039398","2":"15","3":"47730870","4":"T","5":"C","6":"0.44850","7":"-0.00096444","8":"0.025693","9":"-0.03753707","10":"0.97010","11":"1059456","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs212178","2":"16","3":"72578131","4":"G","5":"A","6":"0.89480","7":"0.02579300","8":"0.054579","9":"0.47258103","10":"0.63650","11":"1046645","12":"COVID_A2__EUR_w/o_UKBB"},{"1":"rs1222063","2":"NA","3":"NA","4":"NA","5":"NA","6":"NA","7":"NA","8":"NA","9":"NA","10":"NA","11":"NA","12":"NA"},{"1":"rs28411770","2":"NA","3":"NA","4":"NA","5":"NA","6":"NA","7":"NA","8":"NA","9":"NA","10":"NA","11":"NA","12":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

**Table 3:** Proxy SNPs for COVID: A2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["proxy.outcome"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["target_snp"],"name":[2],"type":["chr"],"align":["left"]},{"label":["proxy_snp"],"name":[3],"type":["lgl"],"align":["right"]},{"label":["ld.r2"],"name":[4],"type":["lgl"],"align":["right"]},{"label":["Dprime"],"name":[5],"type":["lgl"],"align":["right"]},{"label":["ref.proxy"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["alt.proxy"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["CHROM"],"name":[8],"type":["lgl"],"align":["right"]},{"label":["POS"],"name":[9],"type":["lgl"],"align":["right"]},{"label":["ALT.proxy"],"name":[10],"type":["lgl"],"align":["right"]},{"label":["REF.proxy"],"name":[11],"type":["lgl"],"align":["right"]},{"label":["AF"],"name":[12],"type":["lgl"],"align":["right"]},{"label":["BETA"],"name":[13],"type":["lgl"],"align":["right"]},{"label":["SE"],"name":[14],"type":["lgl"],"align":["right"]},{"label":["P"],"name":[15],"type":["lgl"],"align":["right"]},{"label":["N"],"name":[16],"type":["lgl"],"align":["right"]},{"label":["ref"],"name":[17],"type":["lgl"],"align":["right"]},{"label":["alt"],"name":[18],"type":["lgl"],"align":["right"]},{"label":["ALT"],"name":[19],"type":["lgl"],"align":["right"]},{"label":["REF"],"name":[20],"type":["lgl"],"align":["right"]},{"label":["PHASE"],"name":[21],"type":["lgl"],"align":["right"]}],"data":[{"1":"NA","2":"rs1222063","3":"NA","4":"NA","5":"NA","6":"NA","7":"NA","8":"NA","9":"NA","10":"NA","11":"NA","12":"NA","13":"NA","14":"NA","15":"NA","16":"NA","17":"NA","18":"NA","19":"NA","20":"NA","21":"NA"},{"1":"NA","2":"rs28411770","3":"NA","4":"NA","5":"NA","6":"NA","7":"NA","8":"NA","9":"NA","10":"NA","11":"NA","12":"NA","13":"NA","14":"NA","15":"NA","16":"NA","17":"NA","18":"NA","19":"NA","20":"NA","21":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

## Data harmonization
Harmonize the exposure and outcome datasets so that the effect of a SNP on the exposure and the effect of that SNP on the outcome correspond to the same allele. The harmonise_data function from the TwoSampleMR package can be used to perform the harmonization step, by default it try's to infer the forward strand alleles using allele frequency information.
<br>

**Table 4:** Harmonized ADHD and COVID: A2 datasets
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["effect_allele.exposure"],"name":[2],"type":["chr"],"align":["left"]},{"label":["other_allele.exposure"],"name":[3],"type":["chr"],"align":["left"]},{"label":["effect_allele.outcome"],"name":[4],"type":["chr"],"align":["left"]},{"label":["other_allele.outcome"],"name":[5],"type":["chr"],"align":["left"]},{"label":["beta.exposure"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["beta.outcome"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["eaf.exposure"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["eaf.outcome"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["remove"],"name":[10],"type":["lgl"],"align":["right"]},{"label":["palindromic"],"name":[11],"type":["lgl"],"align":["right"]},{"label":["ambiguous"],"name":[12],"type":["lgl"],"align":["right"]},{"label":["id.outcome"],"name":[13],"type":["chr"],"align":["left"]},{"label":["chr.outcome"],"name":[14],"type":["dbl"],"align":["right"]},{"label":["pos.outcome"],"name":[15],"type":["dbl"],"align":["right"]},{"label":["se.outcome"],"name":[16],"type":["dbl"],"align":["right"]},{"label":["z.outcome"],"name":[17],"type":["dbl"],"align":["right"]},{"label":["pval.outcome"],"name":[18],"type":["dbl"],"align":["right"]},{"label":["samplesize.outcome"],"name":[19],"type":["dbl"],"align":["right"]},{"label":["outcome"],"name":[20],"type":["chr"],"align":["left"]},{"label":["mr_keep.outcome"],"name":[21],"type":["lgl"],"align":["right"]},{"label":["pval_origin.outcome"],"name":[22],"type":["chr"],"align":["left"]},{"label":["chr.exposure"],"name":[23],"type":["dbl"],"align":["right"]},{"label":["pos.exposure"],"name":[24],"type":["dbl"],"align":["right"]},{"label":["se.exposure"],"name":[25],"type":["dbl"],"align":["right"]},{"label":["z.exposure"],"name":[26],"type":["dbl"],"align":["right"]},{"label":["pval.exposure"],"name":[27],"type":["dbl"],"align":["right"]},{"label":["samplesize.exposure"],"name":[28],"type":["dbl"],"align":["right"]},{"label":["exposure"],"name":[29],"type":["chr"],"align":["left"]},{"label":["mr_keep.exposure"],"name":[30],"type":["lgl"],"align":["right"]},{"label":["pval_origin.exposure"],"name":[31],"type":["chr"],"align":["left"]},{"label":["id.exposure"],"name":[32],"type":["chr"],"align":["left"]},{"label":["action"],"name":[33],"type":["dbl"],"align":["right"]},{"label":["mr_keep"],"name":[34],"type":["lgl"],"align":["right"]},{"label":["pt"],"name":[35],"type":["dbl"],"align":["right"]},{"label":["pleitropy_keep"],"name":[36],"type":["lgl"],"align":["right"]},{"label":["mrpresso_RSSobs"],"name":[37],"type":["lgl"],"align":["right"]},{"label":["mrpresso_pval"],"name":[38],"type":["lgl"],"align":["right"]},{"label":["mrpresso_keep"],"name":[39],"type":["lgl"],"align":["right"]}],"data":[{"1":"rs10262192","2":"A","3":"G","4":"A","5":"G","6":"0.07409583","7":"-0.01960500","8":"0.4254550","9":"0.43490","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"7","15":"114091753","16":"0.032843","17":"-0.59693085","18":"0.55060","19":"1049400","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"7","24":"114091753","25":"0.0135","26":"5.488580","27":"3.655e-08","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs11591402","2":"A","3":"T","4":"A","5":"T","6":"-0.09240042","7":"-0.00034117","8":"0.2076980","9":"0.22450","10":"FALSE","11":"TRUE","12":"FALSE","13":"Gp5a4Y","14":"10","15":"106747354","16":"0.030161","17":"-0.01131163","18":"0.99100","19":"1059456","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"10","24":"106747354","25":"0.0164","26":"-5.634172","27":"1.760e-08","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs1427829","2":"G","3":"A","4":"G","5":"A","6":"-0.08219730","7":"-0.05591500","8":"0.5339750","9":"0.55020","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"12","15":"89760744","16":"0.025870","17":"-2.16138384","18":"0.03066","19":"1059456","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"12","24":"89760744","25":"0.0136","26":"-6.043920","27":"1.349e-09","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs17531412","2":"G","3":"A","4":"G","5":"A","6":"-0.10539600","7":"-0.07197600","8":"0.2949840","9":"0.30690","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"1","15":"44182244","16":"0.028421","17":"-2.53249358","18":"0.01133","19":"1059456","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"1","24":"44182244","25":"0.0148","26":"-7.121320","27":"1.072e-12","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs212178","2":"A","3":"G","4":"A","5":"G","6":"-0.11709577","7":"0.02579300","8":"0.9257100","9":"0.89480","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"16","15":"72578131","16":"0.054579","17":"0.47258103","18":"0.63650","19":"1046645","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"16","24":"72578131","25":"0.0205","26":"-5.711989","27":"1.198e-08","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs4858241","2":"G","3":"T","4":"G","5":"T","6":"-0.08219730","7":"0.05446100","8":"0.3739100","9":"0.35470","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"3","15":"20669071","16":"0.033494","17":"1.62599272","18":"0.10400","19":"1049400","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"3","24":"20669071","25":"0.0143","26":"-5.748060","27":"8.172e-09","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs4916723","2":"C","3":"A","4":"C","5":"A","6":"0.07779940","7":"-0.04548700","8":"0.4413690","9":"0.41980","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"5","15":"87854395","16":"0.034419","17":"-1.32156658","18":"0.18630","19":"1049400","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"5","24":"87854395","25":"0.0138","26":"5.637640","27":"1.807e-08","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs74760947","2":"G","3":"A","4":"G","5":"A","6":"0.17960500","7":"0.03490400","8":"0.0347826","9":"0.04843","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"8","15":"34352610","16":"0.066600","17":"0.52408408","18":"0.60020","19":"1059456","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"8","24":"34352610","25":"0.0317","26":"5.665780","27":"1.393e-08","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs8039398","2":"C","3":"T","4":"C","5":"T","6":"0.07999600","7":"-0.00096444","8":"0.3859010","9":"0.44850","10":"FALSE","11":"FALSE","12":"FALSE","13":"Gp5a4Y","14":"15","15":"47730870","16":"0.025693","17":"-0.03753707","18":"0.97010","19":"1059456","20":"covidhgi2020A2v5alleurLeaveUKBB","21":"TRUE","22":"reported","23":"15","24":"47730870","25":"0.0135","26":"5.925630","27":"2.986e-09","28":"53293","29":"Demontis2018adhd","30":"TRUE","31":"reported","32":"xu8WDm","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

SNPs that genome-wide significant in the outcome GWAS are likely pleitorpic and should be removed from analysis. Additionaly remove variants within the APOE locus by exclude variants 1MB either side of APOE e4 (rs429358 = 19:45411941, GRCh37.p13)
<br>


**Table 5:** SNPs that were genome-wide significant in the COVID: A2 GWAS
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["chr.outcome"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["pos.outcome"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["pval.exposure"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["pval.outcome"],"name":[5],"type":["dbl"],"align":["right"]}],"data":[],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>


## Instrument Strength
To ensure that the first assumption of MR is not violated (Non-zero effect assumption), the genetic variants selected should be robustly associated with the exposure. Weak instruments, where the variance in the exposure explained by the the instruments is a small portion of the total variance, may result in poor precission and accuracy of the causal effect estiamte. The strength of an instrument can be evaluated using the F statistic, if F is less than 10, this is an indication of weak instrument.


```
## 
## -- Column specification --------------------------------------------------------
## cols(
##   .default = col_double(),
##   exposure = col_character(),
##   outcome = col_character(),
##   method = col_character(),
##   outliers_removed = col_logical(),
##   logistic = col_logical(),
##   beta = col_logical()
## )
## i Use `spec()` for the full column specifications.
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["outliers_removed"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["pve.exposure"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["Alpha"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["NCP"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["Power"],"name":[6],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"0.005910282","3":"35.19888","4":"0.05","5":"2.028213","6":"0.2964018"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

The I2_GX statistic can be used to quantify the strength of the NOME violation for MR-Egger regression and should be used to evalute potential bias in the MR-Egger causal estimate, with values less then 90% indicating that causal estimated should interpreted with caution due to regression diluation.

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["outliers_removed"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["Isq_gx"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"0.229232"},{"1":"TRUE","2":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


## MR Results
To obtain an overall estimate of causal effect, the SNP-exposure and SNP-outcome coefficients were combined in 1) a fixed-effects meta-analysis using an inverse-variance weighted approach (IVW); 2) a Weighted Median approach; 3) Weighted Mode approach and 4) Egger Regression.


[**IVW**](https://doi.org/10.1002/gepi.21758) is equivalent to a weighted regression of the SNP-outcome coefficients on the SNP-exposure coefficients with the intercept constrained to zero. This method assumes that all variants are valid instrumental variables based on the Mendelian randomization assumptions. The causal estimate of the IVW analysis expresses the causal increase in the outcome (or log odds of the outcome for a binary outcome) per unit change in the exposure. [**Weighted median MR**](https://doi.org/10.1002/gepi.21965) allows for 50% of the instrumental variables to be invalid. [**MR-Egger regression**](https://doi.org/10.1093/ije/dyw220) allows all the instrumental variables to be subject to direct effects (i.e. horizontal pleiotropy), with the intercept representing bias in the causal estimate due to pleiotropy and the slope representing the causal estimate. [**Weighted Mode**](https://doi.org/10.1093/ije/dyx102) gives consistent estimates as the sample size increases if a plurality (or weighted plurality) of the genetic variants are valid instruments.
<br>



Table 6 presents the MR causal estimates of genetically predicted ADHD on COVID: A2.
<br>

**Table 6** MR causaul estimates for ADHD on COVID: A2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["nsnp"],"name":[6],"type":["int"],"align":["right"]},{"label":["b"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"Inverse variance weighted (fixed effects)","6":"9","7":"0.116183465","8":"0.1186580","9":"0.3275080"},{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"Weighted median","6":"9","7":"0.002581868","8":"0.1822336","9":"0.9886960"},{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"Weighted mode","6":"9","7":"-0.023513967","8":"0.3015217","9":"0.9397558"},{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"MR Egger","6":"9","7":"0.799058658","8":"0.8129831","9":"0.3584135"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Figure 1 illustrates the SNP-specific associations with ADHD versus the association in COVID: A2 and the corresponding MR estimates.
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideurwoukbb/Demontis2018adhd/covidhgi2020A2v5alleurLeaveUKBB/Demontis2018adhd_5e-8_covidhgi2020A2v5alleurLeaveUKBB_MR_Analaysis_files/figure-html/scatter_plot-1.png" alt="Fig. 1: Scatterplot of SNP effects for the association of the Exposure on the Outcome"  />
<p class="caption">Fig. 1: Scatterplot of SNP effects for the association of the Exposure on the Outcome</p>
</div>
<br>


## Pleiotropy
A Cochrans Q heterogeneity test can be used to formaly assesse for the presence of heterogenity (Table 7), with excessive heterogeneity indicating that there is a meaningful violation of at least one of the MR assumptions.
these assumptions..
<br>

**Table 7:** Heterogenity Tests
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Q"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["Q_df"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["Q_pval"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"MR Egger","6":"13.90879","7":"7","8":"0.05282764"},{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"Inverse variance weighted","6":"15.37263","7":"8","8":"0.05229227"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Figure 2 shows a funnel plot displaying the MR estimates of individual genetic variants against their precession. Aysmmetry in the funnel plot may arrise due to some genetic variants having unusally strong effects on the outcome, which is indicative of directional pleiotropy.
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideurwoukbb/Demontis2018adhd/covidhgi2020A2v5alleurLeaveUKBB/Demontis2018adhd_5e-8_covidhgi2020A2v5alleurLeaveUKBB_MR_Analaysis_files/figure-html/funnel_plot-1.png" alt="Fig. 2: Funnel plot of the MR causal estimates against their precession"  />
<p class="caption">Fig. 2: Funnel plot of the MR causal estimates against their precession</p>
</div>
<br>

Figure 3 shows a [Radial Plots](https://github.com/WSpiller/RadialMR) can be used to visualize influential data points with large contributions to Cochran's Q Statistic that may bias causal effect estimates.




```
## [1] "No significant Outliers"
```

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideurwoukbb/Demontis2018adhd/covidhgi2020A2v5alleurLeaveUKBB/Demontis2018adhd_5e-8_covidhgi2020A2v5alleurLeaveUKBB_MR_Analaysis_files/figure-html/Radial_Plot-1.png" alt="Fig. 4: Radial Plot showing influential data points using Radial IVW"  />
<p class="caption">Fig. 4: Radial Plot showing influential data points using Radial IVW</p>
</div>
<br>

The intercept of the MR-Egger Regression model captures the average pleitropic affect across all genetic variants (Table 8).
<br>

**Table 8:** MR Egger test for directional pleitropy
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["egger_intercept"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"-0.06352489","6":"0.07401038","7":"0.4191302"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Pleiotropy was also assesed using Mendelian Randomization Pleiotropy RESidual Sum and Outlier [(MR-PRESSO)](https://doi.org/10.1038/s41588-018-0099-7), that allows for the evlation of evaluation of horizontal pleiotropy in a standared MR model (Table 9). MR-PRESSO performs a global test for detection of horizontal pleiotropy and correction of pleiotropy via outlier removal (Table 10).
<br>

**Table 9:** MR-PRESSO Global Test for pleitropy
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["pt"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["outliers_removed"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["n_outliers"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["RSSobs"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"5e-08","6":"FALSE","7":"0","8":"20.31043","9":"0.0578"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>


**Table 10:** MR Estimates after MR-PRESSO outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["nsnp"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["b"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["se"],"name":[8],"type":["lgl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["lgl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"mrpresso","6":"NA","7":"NA","8":"NA","9":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideurwoukbb/Demontis2018adhd/covidhgi2020A2v5alleurLeaveUKBB/Demontis2018adhd_5e-8_covidhgi2020A2v5alleurLeaveUKBB_MR_Analaysis_files/figure-html/scatter_plot_outlier-1.png" alt="Fig. 5: Scatterplot of SNP effects for the association of the Exposure on the Outcome after outlier removal"  />
<p class="caption">Fig. 5: Scatterplot of SNP effects for the association of the Exposure on the Outcome after outlier removal</p>
</div>
<br>

**Table 11:** Heterogenity Tests after outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Q"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["Q_df"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["Q_pval"],"name":[8],"type":["lgl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"mrpresso","6":"NA","7":"NA","8":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

**Table 12:** MR Egger test for directional pleitropy after outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["egger_intercept"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["se"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["pval"],"name":[8],"type":["lgl"],"align":["right"]}],"data":[{"1":"xu8WDm","2":"Gp5a4Y","3":"covidhgi2020A2v5alleurLeaveUKBB","4":"Demontis2018adhd","5":"mrpresso","6":"NA","7":"NA","8":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>
