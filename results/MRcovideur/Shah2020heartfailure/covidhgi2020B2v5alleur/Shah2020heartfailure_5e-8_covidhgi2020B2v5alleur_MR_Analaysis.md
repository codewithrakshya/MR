---
title: "Mendelian Randomization Analysis"
author: "Dr. Shea Andrews"
date: "2021-02-17"
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

### Exposure: Heart Failure
`#r exposure.blurb`
<br>

**Table 1:** Independent SNPs associated with Heart Failure
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["CHROM"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["POS"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["REF"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ALT"],"name":[5],"type":["chr"],"align":["left"]},{"label":["AF"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["BETA"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["SE"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Z"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["P"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["N"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["TRAIT"],"name":[12],"type":["chr"],"align":["left"]}],"data":[{"1":"rs660240","2":"1","3":"109817838","4":"T","5":"C","6":"0.7872","7":"0.0611","8":"0.0097","9":"6.298970","10":"3.251e-10","11":"950670","12":"Heart_Failure"},{"1":"rs17042102","2":"4","3":"111668626","4":"G","5":"A","6":"0.1150","7":"0.1103","8":"0.0121","9":"9.115702","10":"5.705e-20","11":"960978","12":"Heart_Failure"},{"1":"rs11745324","2":"5","3":"137012171","4":"G","5":"A","6":"0.2277","7":"-0.0528","8":"0.0095","9":"-5.557895","10":"2.345e-08","11":"953416","12":"Heart_Failure"},{"1":"rs4135240","2":"6","3":"36647680","4":"T","5":"C","6":"0.3411","7":"-0.0486","8":"0.0084","9":"-5.785710","10":"6.838e-09","11":"953252","12":"Heart_Failure"},{"1":"rs55730499","2":"6","3":"161005610","4":"C","5":"T","6":"0.0694","7":"0.1058","8":"0.0157","9":"6.738854","10":"1.830e-11","11":"953746","12":"Heart_Failure"},{"1":"rs140570886","2":"6","3":"161013013","4":"T","5":"C","6":"0.0158","7":"0.2136","8":"0.0328","9":"6.512200","10":"7.687e-11","11":"925310","12":"Heart_Failure"},{"1":"rs1556516","2":"9","3":"22100176","4":"G","5":"C","6":"0.4845","7":"0.0622","8":"0.0078","9":"7.974359","10":"1.569e-15","11":"964027","12":"Heart_Failure"},{"1":"rs600038","2":"9","3":"136151806","4":"T","5":"C","6":"0.2091","7":"0.0569","8":"0.0096","9":"5.927080","10":"3.677e-09","11":"958809","12":"Heart_Failure"},{"1":"rs4746140","2":"10","3":"75417249","4":"G","5":"C","6":"0.1540","7":"-0.0666","8":"0.0109","9":"-6.110092","10":"1.104e-09","11":"958813","12":"Heart_Failure"},{"1":"rs17617337","2":"10","3":"121426884","4":"C","5":"T","6":"0.2208","7":"-0.0561","8":"0.0095","9":"-5.905263","10":"3.654e-09","11":"964025","12":"Heart_Failure"},{"1":"rs4766578","2":"12","3":"111904371","4":"T","5":"A","6":"0.5287","7":"-0.0433","8":"0.0079","9":"-5.481013","10":"4.899e-08","11":"956729","12":"Heart_Failure"},{"1":"rs56094641","2":"16","3":"53806453","4":"A","5":"G","6":"0.4158","7":"0.0454","8":"0.0080","9":"5.675000","10":"1.208e-08","11":"956726","12":"Heart_Failure"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

### Outcome: COVID: B2
`#r outcome.blurb`
<br>

**Table 2:** SNPs associated with Heart Failure avaliable in COVID: B2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["CHROM"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["POS"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["REF"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ALT"],"name":[5],"type":["chr"],"align":["left"]},{"label":["AF"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["BETA"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["SE"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Z"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["P"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["N"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["TRAIT"],"name":[12],"type":["chr"],"align":["left"]}],"data":[{"1":"rs660240","2":"1","3":"109817838","4":"T","5":"C","6":"0.78530","7":"-0.0368610","8":"0.023422","9":"-1.5737768","10":"1.155e-01","11":"1877602","12":"COVID_B2__EUR"},{"1":"rs17042102","2":"4","3":"111668626","4":"G","5":"A","6":"0.12270","7":"-0.0277260","8":"0.026319","9":"-1.0534595","10":"2.921e-01","11":"1887658","12":"COVID_B2__EUR"},{"1":"rs11745324","2":"5","3":"137012171","4":"G","5":"A","6":"0.23500","7":"0.0123950","8":"0.022517","9":"0.5504730","10":"5.820e-01","11":"1877602","12":"COVID_B2__EUR"},{"1":"rs4135240","2":"6","3":"36647680","4":"T","5":"C","6":"0.34650","7":"0.0319510","8":"0.019829","9":"1.6113268","10":"1.071e-01","11":"1877602","12":"COVID_B2__EUR"},{"1":"rs55730499","2":"6","3":"161005610","4":"C","5":"T","6":"0.06591","7":"-0.0170190","8":"0.035186","9":"-0.4836867","10":"6.286e-01","11":"1887658","12":"COVID_B2__EUR"},{"1":"rs140570886","2":"6","3":"161013013","4":"T","5":"C","6":"0.01449","7":"0.0156980","8":"0.082869","9":"0.1894315","10":"8.498e-01","11":"1873174","12":"COVID_B2__EUR"},{"1":"rs1556516","2":"9","3":"22100176","4":"G","5":"C","6":"0.48510","7":"0.0067075","8":"0.017664","9":"0.3797271","10":"7.041e-01","11":"1691229","12":"COVID_B2__EUR"},{"1":"rs600038","2":"9","3":"136151806","4":"T","5":"C","6":"0.20980","7":"0.1141700","8":"0.022812","9":"5.0048200","10":"5.589e-07","11":"1876989","12":"COVID_B2__EUR"},{"1":"rs4746140","2":"10","3":"75417249","4":"G","5":"C","6":"0.15840","7":"0.0189410","8":"0.023951","9":"0.7908229","10":"4.291e-01","11":"1887658","12":"COVID_B2__EUR"},{"1":"rs17617337","2":"10","3":"121426884","4":"C","5":"T","6":"0.21580","7":"-0.0416180","8":"0.021492","9":"-1.9364415","10":"5.282e-02","11":"1887658","12":"COVID_B2__EUR"},{"1":"rs4766578","2":"12","3":"111904371","4":"T","5":"A","6":"0.52680","7":"0.0308950","8":"0.019167","9":"1.6118850","10":"1.070e-01","11":"1877602","12":"COVID_B2__EUR"},{"1":"rs56094641","2":"16","3":"53806453","4":"A","5":"G","6":"0.41670","7":"0.0135450","8":"0.017627","9":"0.7684234","10":"4.422e-01","11":"1887658","12":"COVID_B2__EUR"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

**Table 3:** Proxy SNPs for COVID: B2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["proxy.outcome"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["target_snp"],"name":[2],"type":["lgl"],"align":["right"]},{"label":["proxy_snp"],"name":[3],"type":["lgl"],"align":["right"]},{"label":["ld.r2"],"name":[4],"type":["lgl"],"align":["right"]},{"label":["Dprime"],"name":[5],"type":["lgl"],"align":["right"]},{"label":["ref.proxy"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["alt.proxy"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["CHROM"],"name":[8],"type":["lgl"],"align":["right"]},{"label":["POS"],"name":[9],"type":["lgl"],"align":["right"]},{"label":["ALT.proxy"],"name":[10],"type":["lgl"],"align":["right"]},{"label":["REF.proxy"],"name":[11],"type":["lgl"],"align":["right"]},{"label":["AF"],"name":[12],"type":["lgl"],"align":["right"]},{"label":["BETA"],"name":[13],"type":["lgl"],"align":["right"]},{"label":["SE"],"name":[14],"type":["lgl"],"align":["right"]},{"label":["P"],"name":[15],"type":["lgl"],"align":["right"]},{"label":["N"],"name":[16],"type":["lgl"],"align":["right"]},{"label":["ref"],"name":[17],"type":["lgl"],"align":["right"]},{"label":["alt"],"name":[18],"type":["lgl"],"align":["right"]},{"label":["ALT"],"name":[19],"type":["lgl"],"align":["right"]},{"label":["REF"],"name":[20],"type":["lgl"],"align":["right"]},{"label":["PHASE"],"name":[21],"type":["lgl"],"align":["right"]}],"data":[{"1":"NA","2":"NA","3":"NA","4":"NA","5":"NA","6":"NA","7":"NA","8":"NA","9":"NA","10":"NA","11":"NA","12":"NA","13":"NA","14":"NA","15":"NA","16":"NA","17":"NA","18":"NA","19":"NA","20":"NA","21":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

## Data harmonization
Harmonize the exposure and outcome datasets so that the effect of a SNP on the exposure and the effect of that SNP on the outcome correspond to the same allele. The harmonise_data function from the TwoSampleMR package can be used to perform the harmonization step, by default it try's to infer the forward strand alleles using allele frequency information.
<br>

**Table 4:** Harmonized Heart Failure and COVID: B2 datasets
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["effect_allele.exposure"],"name":[2],"type":["chr"],"align":["left"]},{"label":["other_allele.exposure"],"name":[3],"type":["chr"],"align":["left"]},{"label":["effect_allele.outcome"],"name":[4],"type":["chr"],"align":["left"]},{"label":["other_allele.outcome"],"name":[5],"type":["chr"],"align":["left"]},{"label":["beta.exposure"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["beta.outcome"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["eaf.exposure"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["eaf.outcome"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["remove"],"name":[10],"type":["lgl"],"align":["right"]},{"label":["palindromic"],"name":[11],"type":["lgl"],"align":["right"]},{"label":["ambiguous"],"name":[12],"type":["lgl"],"align":["right"]},{"label":["id.outcome"],"name":[13],"type":["chr"],"align":["left"]},{"label":["chr.outcome"],"name":[14],"type":["dbl"],"align":["right"]},{"label":["pos.outcome"],"name":[15],"type":["dbl"],"align":["right"]},{"label":["se.outcome"],"name":[16],"type":["dbl"],"align":["right"]},{"label":["z.outcome"],"name":[17],"type":["dbl"],"align":["right"]},{"label":["pval.outcome"],"name":[18],"type":["dbl"],"align":["right"]},{"label":["samplesize.outcome"],"name":[19],"type":["dbl"],"align":["right"]},{"label":["outcome"],"name":[20],"type":["chr"],"align":["left"]},{"label":["mr_keep.outcome"],"name":[21],"type":["lgl"],"align":["right"]},{"label":["pval_origin.outcome"],"name":[22],"type":["chr"],"align":["left"]},{"label":["chr.exposure"],"name":[23],"type":["dbl"],"align":["right"]},{"label":["pos.exposure"],"name":[24],"type":["dbl"],"align":["right"]},{"label":["se.exposure"],"name":[25],"type":["dbl"],"align":["right"]},{"label":["z.exposure"],"name":[26],"type":["dbl"],"align":["right"]},{"label":["pval.exposure"],"name":[27],"type":["dbl"],"align":["right"]},{"label":["samplesize.exposure"],"name":[28],"type":["dbl"],"align":["right"]},{"label":["exposure"],"name":[29],"type":["chr"],"align":["left"]},{"label":["mr_keep.exposure"],"name":[30],"type":["lgl"],"align":["right"]},{"label":["pval_origin.exposure"],"name":[31],"type":["chr"],"align":["left"]},{"label":["id.exposure"],"name":[32],"type":["chr"],"align":["left"]},{"label":["action"],"name":[33],"type":["dbl"],"align":["right"]},{"label":["mr_keep"],"name":[34],"type":["lgl"],"align":["right"]},{"label":["pt"],"name":[35],"type":["dbl"],"align":["right"]},{"label":["pleitropy_keep"],"name":[36],"type":["lgl"],"align":["right"]},{"label":["mrpresso_RSSobs"],"name":[37],"type":["dbl"],"align":["right"]},{"label":["mrpresso_pval"],"name":[38],"type":["chr"],"align":["left"]},{"label":["mrpresso_keep"],"name":[39],"type":["lgl"],"align":["right"]}],"data":[{"1":"rs11745324","2":"A","3":"G","4":"A","5":"G","6":"-0.0528","7":"0.0123950","8":"0.2277","9":"0.23500","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"5","15":"137012171","16":"0.022517","17":"0.5504730","18":"5.820e-01","19":"1877602","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"5","24":"137012171","25":"0.0095","26":"-5.557895","27":"2.345e-08","28":"953416","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"2.306000e-04","38":"1","39":"TRUE"},{"1":"rs140570886","2":"C","3":"T","4":"C","5":"T","6":"0.2136","7":"0.0156980","8":"0.0158","9":"0.01449","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"6","15":"161013013","16":"0.082869","17":"0.1894315","18":"8.498e-01","19":"1873174","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"6","24":"161013013","25":"0.0328","26":"6.512200","27":"7.687e-11","28":"925310","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"8.996721e-05","38":"1","39":"TRUE"},{"1":"rs1556516","2":"C","3":"G","4":"C","5":"G","6":"0.0622","7":"0.0067075","8":"0.4845","9":"0.48510","10":"FALSE","11":"TRUE","12":"TRUE","13":"JYp0Ae","14":"9","15":"22100176","16":"0.017664","17":"0.3797271","18":"7.041e-01","19":"1691229","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"9","24":"22100176","25":"0.0078","26":"7.974359","27":"1.569e-15","28":"964027","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"FALSE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"NA"},{"1":"rs17042102","2":"A","3":"G","4":"A","5":"G","6":"0.1103","7":"-0.0277260","8":"0.1150","9":"0.12270","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"4","15":"111668626","16":"0.026319","17":"-1.0534595","18":"2.921e-01","19":"1887658","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"4","24":"111668626","25":"0.0121","26":"9.115702","27":"5.705e-20","28":"960978","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"1.625178e-03","38":"1","39":"TRUE"},{"1":"rs17617337","2":"T","3":"C","4":"T","5":"C","6":"-0.0561","7":"-0.0416180","8":"0.2208","9":"0.21580","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"10","15":"121426884","16":"0.021492","17":"-1.9364415","18":"5.282e-02","19":"1887658","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"10","24":"121426884","25":"0.0095","26":"-5.905263","27":"3.654e-09","28":"964025","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"1.895133e-03","38":"0.397","39":"TRUE"},{"1":"rs4135240","2":"C","3":"T","4":"C","5":"T","6":"-0.0486","7":"0.0319510","8":"0.3411","9":"0.34650","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"6","15":"36647680","16":"0.019829","17":"1.6113268","18":"1.071e-01","19":"1877602","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"6","24":"36647680","25":"0.0084","26":"-5.785710","27":"6.838e-09","28":"953252","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"1.318306e-03","38":"0.671","39":"TRUE"},{"1":"rs4746140","2":"C","3":"G","4":"C","5":"G","6":"-0.0666","7":"0.0189410","8":"0.1540","9":"0.15840","10":"FALSE","11":"TRUE","12":"FALSE","13":"JYp0Ae","14":"10","15":"75417249","16":"0.023951","17":"0.7908229","18":"4.291e-01","19":"1887658","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"10","24":"75417249","25":"0.0109","26":"-6.110092","27":"1.104e-09","28":"958813","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"5.485173e-04","38":"1","39":"TRUE"},{"1":"rs4766578","2":"A","3":"T","4":"A","5":"T","6":"-0.0433","7":"0.0308950","8":"0.5287","9":"0.52680","10":"FALSE","11":"TRUE","12":"TRUE","13":"JYp0Ae","14":"12","15":"111904371","16":"0.019167","17":"1.6118850","18":"1.070e-01","19":"1877602","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"12","24":"111904371","25":"0.0079","26":"-5.481013","27":"4.899e-08","28":"956729","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"FALSE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"NA"},{"1":"rs55730499","2":"T","3":"C","4":"T","5":"C","6":"0.1058","7":"-0.0170190","8":"0.0694","9":"0.06591","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"6","15":"161005610","16":"0.035186","17":"-0.4836867","18":"6.286e-01","19":"1887658","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"6","24":"161005610","25":"0.0157","26":"6.738854","27":"1.830e-11","28":"953746","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"5.355276e-04","38":"1","39":"TRUE"},{"1":"rs56094641","2":"G","3":"A","4":"G","5":"A","6":"0.0454","7":"0.0135450","8":"0.4158","9":"0.41670","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"16","15":"53806453","16":"0.017627","17":"0.7684234","18":"4.422e-01","19":"1887658","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"16","24":"53806453","25":"0.0080","26":"5.675000","27":"1.208e-08","28":"956726","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"1.731984e-04","38":"1","39":"TRUE"},{"1":"rs600038","2":"C","3":"T","4":"C","5":"T","6":"0.0569","7":"0.1141700","8":"0.2091","9":"0.20980","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"9","15":"136151806","16":"0.022812","17":"5.0048200","18":"5.589e-07","19":"1876989","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"9","24":"136151806","25":"0.0096","26":"5.927080","27":"3.677e-09","28":"958809","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"1.486153e-02","38":"<0.001","39":"FALSE"},{"1":"rs660240","2":"C","3":"T","4":"C","5":"T","6":"0.0611","7":"-0.0368610","8":"0.7872","9":"0.78530","10":"FALSE","11":"FALSE","12":"FALSE","13":"JYp0Ae","14":"1","15":"109817838","16":"0.023422","17":"-1.5737768","18":"1.155e-01","19":"1877602","20":"covidhgi2020B2v5alleur","21":"TRUE","22":"reported","23":"1","24":"109817838","25":"0.0097","26":"6.298970","27":"3.251e-10","28":"950670","29":"Shah2020heartfailure","30":"TRUE","31":"reported","32":"BzKCxD","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"1.808975e-03","38":"0.713","39":"TRUE"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

SNPs that genome-wide significant in the outcome GWAS are likely pleitorpic and should be removed from analysis. Additionaly remove variants within the APOE locus by exclude variants 1MB either side of APOE e4 (rs429358 = 19:45411941, GRCh37.p13)
<br>


**Table 5:** SNPs that were genome-wide significant in the COVID: B2 GWAS
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
{"columns":[{"label":["outliers_removed"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["pve.exposure"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["Alpha"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["NCP"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["Power"],"name":[6],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"0.0004236844","3":"41.42473","4":"0.05","5":"0.1753928","6":"0.07032376"},{"1":"TRUE","2":"0.0003878625","3":"42.13446","4":"0.05","5":"1.0513562","6":"0.17641174"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

The I2_GX statistic can be used to quantify the strength of the NOME violation for MR-Egger regression and should be used to evalute potential bias in the MR-Egger causal estimate, with values less then 90% indicating that causal estimated should interpreted with caution due to regression diluation.

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["outliers_removed"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["Isq_gx"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"0.3517318"},{"1":"TRUE","2":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


## MR Results
To obtain an overall estimate of causal effect, the SNP-exposure and SNP-outcome coefficients were combined in 1) a fixed-effects meta-analysis using an inverse-variance weighted approach (IVW); 2) a Weighted Median approach; 3) Weighted Mode approach and 4) Egger Regression.


[**IVW**](https://doi.org/10.1002/gepi.21758) is equivalent to a weighted regression of the SNP-outcome coefficients on the SNP-exposure coefficients with the intercept constrained to zero. This method assumes that all variants are valid instrumental variables based on the Mendelian randomization assumptions. The causal estimate of the IVW analysis expresses the causal increase in the outcome (or log odds of the outcome for a binary outcome) per unit change in the exposure. [**Weighted median MR**](https://doi.org/10.1002/gepi.21965) allows for 50% of the instrumental variables to be invalid. [**MR-Egger regression**](https://doi.org/10.1093/ije/dyw220) allows all the instrumental variables to be subject to direct effects (i.e. horizontal pleiotropy), with the intercept representing bias in the causal estimate due to pleiotropy and the slope representing the causal estimate. [**Weighted Mode**](https://doi.org/10.1093/ije/dyx102) gives consistent estimates as the sample size increases if a plurality (or weighted plurality) of the genetic variants are valid instruments.
<br>



Table 6 presents the MR causal estimates of genetically predicted Heart Failure on COVID: B2.
<br>

**Table 6** MR causaul estimates for Heart Failure on COVID: B2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["nsnp"],"name":[6],"type":["int"],"align":["right"]},{"label":["b"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Inverse variance weighted (fixed effects)","6":"10","7":"0.03282296","8":"0.1125370","9":"0.7705437"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Weighted median","6":"10","7":"-0.23839056","8":"0.1579902","9":"0.1313257"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Weighted mode","6":"10","7":"-0.23692407","8":"0.1757211","9":"0.2105128"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"MR Egger","6":"10","7":"-0.33907642","8":"0.6646064","9":"0.6236925"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Figure 1 illustrates the SNP-specific associations with Heart Failure versus the association in COVID: B2 and the corresponding MR estimates.
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Shah2020heartfailure/covidhgi2020B2v5alleur/Shah2020heartfailure_5e-8_covidhgi2020B2v5alleur_MR_Analaysis_files/figure-html/scatter_plot-1.png" alt="Fig. 1: Scatterplot of SNP effects for the association of the Exposure on the Outcome"  />
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
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Q"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["Q_df"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["Q_pval"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"MR Egger","6":"35.11245","7":"8","8":"2.550632e-05"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Inverse variance weighted","6":"36.68464","7":"9","8":"2.995598e-05"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Figure 2 shows a funnel plot displaying the MR estimates of individual genetic variants against their precession. Aysmmetry in the funnel plot may arrise due to some genetic variants having unusally strong effects on the outcome, which is indicative of directional pleiotropy.
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Shah2020heartfailure/covidhgi2020B2v5alleur/Shah2020heartfailure_5e-8_covidhgi2020B2v5alleur_MR_Analaysis_files/figure-html/funnel_plot-1.png" alt="Fig. 2: Funnel plot of the MR causal estimates against their precession"  />
<p class="caption">Fig. 2: Funnel plot of the MR causal estimates against their precession</p>
</div>
<br>

Figure 3 shows a [Radial Plots](https://github.com/WSpiller/RadialMR) can be used to visualize influential data points with large contributions to Cochran's Q Statistic that may bias causal effect estimates.



<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Shah2020heartfailure/covidhgi2020B2v5alleur/Shah2020heartfailure_5e-8_covidhgi2020B2v5alleur_MR_Analaysis_files/figure-html/Radial_Plot-1.png" alt="Fig. 4: Radial Plot showing influential data points using Radial IVW"  />
<p class="caption">Fig. 4: Radial Plot showing influential data points using Radial IVW</p>
</div>
<br>

The intercept of the MR-Egger Regression model captures the average pleitropic affect across all genetic variants (Table 8).
<br>

**Table 8:** MR Egger test for directional pleitropy
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["egger_intercept"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"0.0265048","6":"0.04428515","7":"0.5660601"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Pleiotropy was also assesed using Mendelian Randomization Pleiotropy RESidual Sum and Outlier [(MR-PRESSO)](https://doi.org/10.1038/s41588-018-0099-7), that allows for the evlation of evaluation of horizontal pleiotropy in a standared MR model (Table 9). MR-PRESSO performs a global test for detection of horizontal pleiotropy and correction of pleiotropy via outlier removal (Table 10).
<br>

**Table 9:** MR-PRESSO Global Test for pleitropy
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["pt"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["outliers_removed"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["n_outliers"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["RSSobs"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"5e-08","6":"FALSE","7":"1","8":"44.07207","9":"1e-04"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>


**Table 10:** MR Estimates after MR-PRESSO outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["nsnp"],"name":[6],"type":["int"],"align":["right"]},{"label":["b"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Inverse variance weighted (fixed effects)","6":"9","7":"-0.1359908","8":"0.1172510","9":"0.2461196"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Weighted median","6":"9","7":"-0.2410399","8":"0.1640221","9":"0.1416816"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Weighted mode","6":"9","7":"-0.2353478","8":"0.1981137","9":"0.2689253"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"MR Egger","6":"9","7":"-0.2130510","8":"0.3861920","9":"0.5983351"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Shah2020heartfailure/covidhgi2020B2v5alleur/Shah2020heartfailure_5e-8_covidhgi2020B2v5alleur_MR_Analaysis_files/figure-html/scatter_plot_outlier-1.png" alt="Fig. 5: Scatterplot of SNP effects for the association of the Exposure on the Outcome after outlier removal"  />
<p class="caption">Fig. 5: Scatterplot of SNP effects for the association of the Exposure on the Outcome after outlier removal</p>
</div>
<br>

**Table 11:** Heterogenity Tests after outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Q"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["Q_df"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["Q_pval"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"MR Egger","6":"10.30842","7":"7","8":"0.1717587"},{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"Inverse variance weighted","6":"10.37627","7":"8","8":"0.2396035"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

**Table 12:** MR Egger test for directional pleitropy after outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["egger_intercept"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"BzKCxD","2":"JYp0Ae","3":"covidhgi2020B2v5alleur","4":"Shah2020heartfailure","5":"0.005613224","6":"0.02615211","7":"0.8361689"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>
