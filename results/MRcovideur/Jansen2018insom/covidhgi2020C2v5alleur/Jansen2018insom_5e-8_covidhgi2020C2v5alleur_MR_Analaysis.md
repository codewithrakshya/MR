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

### Exposure: Insomnia
`#r exposure.blurb`
<br>

**Table 1:** Independent SNPs associated with Insomnia
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["CHROM"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["POS"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["REF"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ALT"],"name":[5],"type":["chr"],"align":["left"]},{"label":["AF"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["BETA"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["SE"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Z"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["P"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["N"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["TRAIT"],"name":[12],"type":["chr"],"align":["left"]}],"data":[{"1":"rs77217059","2":"2","3":"58989880","4":"G","5":"A","6":"0.123004","7":"-0.04165568","8":"0.007246","9":"-5.748782","10":"8.756e-09","11":"379343","12":"Insomnia_Symptoms"},{"1":"rs11693221","2":"2","3":"66799986","4":"C","5":"T","6":"0.052374","7":"0.12310220","8":"0.012650","9":"9.731399","10":"3.141e-22","11":"377330","12":"Insomnia_Symptoms"},{"1":"rs55683518","2":"2","3":"147484316","4":"T","5":"G","6":"0.417241","7":"-0.02932583","8":"0.005322","9":"-5.510302","10":"3.551e-08","11":"381157","12":"Insomnia_Symptoms"},{"1":"rs1456193","2":"3","3":"117637697","4":"T","5":"C","6":"0.821908","7":"0.03739040","8":"0.006676","9":"5.600720","10":"2.130e-08","11":"383816","12":"Insomnia_Symptoms"},{"1":"rs77960","2":"5","3":"103964585","4":"G","5":"A","6":"0.321624","7":"0.03246719","8":"0.005429","9":"5.980326","10":"1.658e-09","11":"382586","12":"Insomnia_Symptoms"},{"1":"rs6938026","2":"6","3":"43185733","4":"A","5":"G","6":"0.200836","7":"0.03729578","8":"0.006239","9":"5.977847","10":"2.718e-09","11":"385182","12":"Insomnia_Symptoms"},{"1":"rs370771","2":"6","3":"105398086","4":"G","5":"T","6":"0.548299","7":"0.03459140","8":"0.005121","9":"6.754820","10":"1.475e-11","11":"385316","12":"Insomnia_Symptoms"},{"1":"rs6984111","2":"8","3":"10211788","4":"C","5":"T","6":"0.810301","7":"-0.04305950","8":"0.007393","9":"-5.824360","10":"4.254e-09","11":"386533","12":"Insomnia_Symptoms"},{"1":"rs4073582","2":"11","3":"66050712","4":"G","5":"A","6":"0.301567","7":"-0.03118112","8":"0.005319","9":"-5.862214","10":"4.667e-09","11":"385580","12":"Insomnia_Symptoms"},{"1":"rs9576155","2":"13","3":"37600284","4":"G","5":"A","6":"0.342852","7":"0.03052921","8":"0.005384","9":"5.670358","10":"9.264e-09","11":"383032","12":"Insomnia_Symptoms"},{"1":"rs6561715","2":"13","3":"53888526","4":"T","5":"A","6":"0.633527","7":"-0.03729580","8":"0.005302","9":"-7.034290","10":"1.709e-12","11":"381541","12":"Insomnia_Symptoms"},{"1":"rs4986172","2":"17","3":"43216281","4":"C","5":"T","6":"0.338305","7":"0.03729578","8":"0.005357","9":"6.962065","10":"5.204e-12","11":"386533","12":"Insomnia_Symptoms"},{"1":"rs7228159","2":"18","3":"53104253","4":"A","5":"T","6":"0.728296","7":"-0.02955880","8":"0.005354","9":"-5.520880","10":"4.081e-08","11":"385746","12":"Insomnia_Symptoms"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

### Outcome: COVID: C2
`#r outcome.blurb`
<br>

**Table 2:** SNPs associated with Insomnia avaliable in COVID: C2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["CHROM"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["POS"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["REF"],"name":[4],"type":["chr"],"align":["left"]},{"label":["ALT"],"name":[5],"type":["chr"],"align":["left"]},{"label":["AF"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["BETA"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["SE"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["Z"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["P"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["N"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["TRAIT"],"name":[12],"type":["chr"],"align":["left"]}],"data":[{"1":"rs77217059","2":"2","3":"58989880","4":"G","5":"A","6":"0.14570","7":"-5.7733e-03","8":"0.0117210","9":"-0.492560362","10":"0.62230","11":"1673713","12":"COVID_C2__EUR"},{"1":"rs11693221","2":"2","3":"66799986","4":"C","5":"T","6":"0.05393","7":"-8.2823e-03","8":"0.0202500","9":"-0.409002469","10":"0.68250","11":"1673713","12":"COVID_C2__EUR"},{"1":"rs55683518","2":"2","3":"147484316","4":"T","5":"G","6":"0.37680","7":"-9.3684e-03","8":"0.0084732","9":"-1.105650758","10":"0.26890","11":"1673352","12":"COVID_C2__EUR"},{"1":"rs1456193","2":"3","3":"117637697","4":"T","5":"C","6":"0.80310","7":"-1.0453e-03","8":"0.0104900","9":"-0.099647283","10":"0.92060","11":"1683105","12":"COVID_C2__EUR"},{"1":"rs77960","2":"5","3":"103964585","4":"G","5":"A","6":"0.31630","7":"-1.5184e-02","8":"0.0087592","9":"-1.733491643","10":"0.08301","11":"1673985","12":"COVID_C2__EUR"},{"1":"rs6938026","2":"6","3":"43185733","4":"A","5":"G","6":"0.20270","7":"1.4410e-02","8":"0.0099860","9":"1.443020228","10":"0.14900","11":"1683410","12":"COVID_C2__EUR"},{"1":"rs370771","2":"6","3":"105398086","4":"G","5":"T","6":"0.54630","7":"-2.0165e-02","8":"0.0080613","9":"-2.501457581","10":"0.01237","11":"1683769","12":"COVID_C2__EUR"},{"1":"rs6984111","2":"8","3":"10211788","4":"C","5":"T","6":"0.83360","7":"-2.6495e-03","8":"0.0109220","9":"-0.242583776","10":"0.80830","11":"1683769","12":"COVID_C2__EUR"},{"1":"rs4073582","2":"11","3":"66050712","4":"G","5":"A","6":"0.33910","7":"-6.0782e-03","8":"0.0084903","9":"-0.715899320","10":"0.47410","11":"1612654","12":"COVID_C2__EUR"},{"1":"rs9576155","2":"13","3":"37600284","4":"G","5":"A","6":"0.33860","7":"7.9371e-05","8":"0.0084832","9":"0.009356257","10":"0.99250","11":"1682500","12":"COVID_C2__EUR"},{"1":"rs6561715","2":"13","3":"53888526","4":"T","5":"A","6":"0.62430","7":"-1.5823e-02","8":"0.0084964","9":"-1.862318158","10":"0.06256","11":"1602598","12":"COVID_C2__EUR"},{"1":"rs4986172","2":"17","3":"43216281","4":"C","5":"T","6":"0.34820","7":"1.3900e-02","8":"0.0083942","9":"1.655905268","10":"0.09775","11":"1613013","12":"COVID_C2__EUR"},{"1":"rs7228159","2":"18","3":"53104253","4":"A","5":"T","6":"0.68170","7":"-1.1531e-02","8":"0.0085215","9":"-1.353165523","10":"0.17600","11":"1683769","12":"COVID_C2__EUR"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

**Table 3:** Proxy SNPs for COVID: C2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["proxy.outcome"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["target_snp"],"name":[2],"type":["lgl"],"align":["right"]},{"label":["proxy_snp"],"name":[3],"type":["lgl"],"align":["right"]},{"label":["ld.r2"],"name":[4],"type":["lgl"],"align":["right"]},{"label":["Dprime"],"name":[5],"type":["lgl"],"align":["right"]},{"label":["ref.proxy"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["alt.proxy"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["CHROM"],"name":[8],"type":["lgl"],"align":["right"]},{"label":["POS"],"name":[9],"type":["lgl"],"align":["right"]},{"label":["ALT.proxy"],"name":[10],"type":["lgl"],"align":["right"]},{"label":["REF.proxy"],"name":[11],"type":["lgl"],"align":["right"]},{"label":["AF"],"name":[12],"type":["lgl"],"align":["right"]},{"label":["BETA"],"name":[13],"type":["lgl"],"align":["right"]},{"label":["SE"],"name":[14],"type":["lgl"],"align":["right"]},{"label":["P"],"name":[15],"type":["lgl"],"align":["right"]},{"label":["N"],"name":[16],"type":["lgl"],"align":["right"]},{"label":["ref"],"name":[17],"type":["lgl"],"align":["right"]},{"label":["alt"],"name":[18],"type":["lgl"],"align":["right"]},{"label":["ALT"],"name":[19],"type":["lgl"],"align":["right"]},{"label":["REF"],"name":[20],"type":["lgl"],"align":["right"]},{"label":["PHASE"],"name":[21],"type":["lgl"],"align":["right"]}],"data":[{"1":"NA","2":"NA","3":"NA","4":"NA","5":"NA","6":"NA","7":"NA","8":"NA","9":"NA","10":"NA","11":"NA","12":"NA","13":"NA","14":"NA","15":"NA","16":"NA","17":"NA","18":"NA","19":"NA","20":"NA","21":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

## Data harmonization
Harmonize the exposure and outcome datasets so that the effect of a SNP on the exposure and the effect of that SNP on the outcome correspond to the same allele. The harmonise_data function from the TwoSampleMR package can be used to perform the harmonization step, by default it try's to infer the forward strand alleles using allele frequency information.
<br>

**Table 4:** Harmonized Insomnia and COVID: C2 datasets
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["SNP"],"name":[1],"type":["chr"],"align":["left"]},{"label":["effect_allele.exposure"],"name":[2],"type":["chr"],"align":["left"]},{"label":["other_allele.exposure"],"name":[3],"type":["chr"],"align":["left"]},{"label":["effect_allele.outcome"],"name":[4],"type":["chr"],"align":["left"]},{"label":["other_allele.outcome"],"name":[5],"type":["chr"],"align":["left"]},{"label":["beta.exposure"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["beta.outcome"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["eaf.exposure"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["eaf.outcome"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["remove"],"name":[10],"type":["lgl"],"align":["right"]},{"label":["palindromic"],"name":[11],"type":["lgl"],"align":["right"]},{"label":["ambiguous"],"name":[12],"type":["lgl"],"align":["right"]},{"label":["id.outcome"],"name":[13],"type":["chr"],"align":["left"]},{"label":["chr.outcome"],"name":[14],"type":["dbl"],"align":["right"]},{"label":["pos.outcome"],"name":[15],"type":["dbl"],"align":["right"]},{"label":["se.outcome"],"name":[16],"type":["dbl"],"align":["right"]},{"label":["z.outcome"],"name":[17],"type":["dbl"],"align":["right"]},{"label":["pval.outcome"],"name":[18],"type":["dbl"],"align":["right"]},{"label":["samplesize.outcome"],"name":[19],"type":["dbl"],"align":["right"]},{"label":["outcome"],"name":[20],"type":["chr"],"align":["left"]},{"label":["mr_keep.outcome"],"name":[21],"type":["lgl"],"align":["right"]},{"label":["pval_origin.outcome"],"name":[22],"type":["chr"],"align":["left"]},{"label":["chr.exposure"],"name":[23],"type":["dbl"],"align":["right"]},{"label":["pos.exposure"],"name":[24],"type":["dbl"],"align":["right"]},{"label":["se.exposure"],"name":[25],"type":["dbl"],"align":["right"]},{"label":["z.exposure"],"name":[26],"type":["dbl"],"align":["right"]},{"label":["pval.exposure"],"name":[27],"type":["dbl"],"align":["right"]},{"label":["samplesize.exposure"],"name":[28],"type":["dbl"],"align":["right"]},{"label":["exposure"],"name":[29],"type":["chr"],"align":["left"]},{"label":["mr_keep.exposure"],"name":[30],"type":["lgl"],"align":["right"]},{"label":["pval_origin.exposure"],"name":[31],"type":["chr"],"align":["left"]},{"label":["id.exposure"],"name":[32],"type":["chr"],"align":["left"]},{"label":["action"],"name":[33],"type":["dbl"],"align":["right"]},{"label":["mr_keep"],"name":[34],"type":["lgl"],"align":["right"]},{"label":["pt"],"name":[35],"type":["dbl"],"align":["right"]},{"label":["pleitropy_keep"],"name":[36],"type":["lgl"],"align":["right"]},{"label":["mrpresso_RSSobs"],"name":[37],"type":["lgl"],"align":["right"]},{"label":["mrpresso_pval"],"name":[38],"type":["lgl"],"align":["right"]},{"label":["mrpresso_keep"],"name":[39],"type":["lgl"],"align":["right"]}],"data":[{"1":"rs11693221","2":"T","3":"C","4":"T","5":"C","6":"0.12310220","7":"-8.2823e-03","8":"0.052374","9":"0.05393","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"2","15":"66799986","16":"0.0202500","17":"-0.409002469","18":"0.68250","19":"1673713","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"2","24":"66799986","25":"0.012650","26":"9.731399","27":"3.141e-22","28":"377330","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs1456193","2":"C","3":"T","4":"C","5":"T","6":"0.03739040","7":"-1.0453e-03","8":"0.821908","9":"0.80310","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"3","15":"117637697","16":"0.0104900","17":"-0.099647283","18":"0.92060","19":"1683105","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"3","24":"117637697","25":"0.006676","26":"5.600720","27":"2.130e-08","28":"383816","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs370771","2":"T","3":"G","4":"T","5":"G","6":"0.03459140","7":"-2.0165e-02","8":"0.548299","9":"0.54630","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"6","15":"105398086","16":"0.0080613","17":"-2.501457581","18":"0.01237","19":"1683769","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"6","24":"105398086","25":"0.005121","26":"6.754820","27":"1.475e-11","28":"385316","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs4073582","2":"A","3":"G","4":"A","5":"G","6":"-0.03118112","7":"-6.0782e-03","8":"0.301567","9":"0.33910","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"11","15":"66050712","16":"0.0084903","17":"-0.715899320","18":"0.47410","19":"1612654","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"11","24":"66050712","25":"0.005319","26":"-5.862214","27":"4.667e-09","28":"385580","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs4986172","2":"T","3":"C","4":"T","5":"C","6":"0.03729578","7":"1.3900e-02","8":"0.338305","9":"0.34820","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"17","15":"43216281","16":"0.0083942","17":"1.655905268","18":"0.09775","19":"1613013","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"17","24":"43216281","25":"0.005357","26":"6.962065","27":"5.204e-12","28":"386533","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs55683518","2":"G","3":"T","4":"G","5":"T","6":"-0.02932583","7":"-9.3684e-03","8":"0.417241","9":"0.37680","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"2","15":"147484316","16":"0.0084732","17":"-1.105650758","18":"0.26890","19":"1673352","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"2","24":"147484316","25":"0.005322","26":"-5.510302","27":"3.551e-08","28":"381157","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs6561715","2":"A","3":"T","4":"A","5":"T","6":"-0.03729580","7":"-1.5823e-02","8":"0.633527","9":"0.62430","10":"FALSE","11":"TRUE","12":"FALSE","13":"Utlw90","14":"13","15":"53888526","16":"0.0084964","17":"-1.862318158","18":"0.06256","19":"1602598","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"13","24":"53888526","25":"0.005302","26":"-7.034290","27":"1.709e-12","28":"381541","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs6938026","2":"G","3":"A","4":"G","5":"A","6":"0.03729578","7":"1.4410e-02","8":"0.200836","9":"0.20270","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"6","15":"43185733","16":"0.0099860","17":"1.443020228","18":"0.14900","19":"1683410","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"6","24":"43185733","25":"0.006239","26":"5.977847","27":"2.718e-09","28":"385182","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs6984111","2":"T","3":"C","4":"T","5":"C","6":"-0.04305950","7":"-2.6495e-03","8":"0.810301","9":"0.83360","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"8","15":"10211788","16":"0.0109220","17":"-0.242583776","18":"0.80830","19":"1683769","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"8","24":"10211788","25":"0.007393","26":"-5.824360","27":"4.254e-09","28":"386533","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs7228159","2":"T","3":"A","4":"T","5":"A","6":"-0.02955880","7":"-1.1531e-02","8":"0.728296","9":"0.68170","10":"FALSE","11":"TRUE","12":"FALSE","13":"Utlw90","14":"18","15":"53104253","16":"0.0085215","17":"-1.353165523","18":"0.17600","19":"1683769","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"18","24":"53104253","25":"0.005354","26":"-5.520880","27":"4.081e-08","28":"385746","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs77217059","2":"A","3":"G","4":"A","5":"G","6":"-0.04165568","7":"-5.7733e-03","8":"0.123004","9":"0.14570","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"2","15":"58989880","16":"0.0117210","17":"-0.492560362","18":"0.62230","19":"1673713","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"2","24":"58989880","25":"0.007246","26":"-5.748782","27":"8.756e-09","28":"379343","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs77960","2":"A","3":"G","4":"A","5":"G","6":"0.03246719","7":"-1.5184e-02","8":"0.321624","9":"0.31630","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"5","15":"103964585","16":"0.0087592","17":"-1.733491643","18":"0.08301","19":"1673985","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"5","24":"103964585","25":"0.005429","26":"5.980326","27":"1.658e-09","28":"382586","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"},{"1":"rs9576155","2":"A","3":"G","4":"A","5":"G","6":"0.03052921","7":"7.9371e-05","8":"0.342852","9":"0.33860","10":"FALSE","11":"FALSE","12":"FALSE","13":"Utlw90","14":"13","15":"37600284","16":"0.0084832","17":"0.009356257","18":"0.99250","19":"1682500","20":"covidhgi2020C2v5alleur","21":"TRUE","22":"reported","23":"13","24":"37600284","25":"0.005384","26":"5.670358","27":"9.264e-09","28":"383032","29":"Jansen2018insom","30":"TRUE","31":"reported","32":"d4jpEH","33":"2","34":"TRUE","35":"5e-08","36":"TRUE","37":"NA","38":"NA","39":"TRUE"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

SNPs that genome-wide significant in the outcome GWAS are likely pleitorpic and should be removed from analysis. Additionaly remove variants within the APOE locus by exclude variants 1MB either side of APOE e4 (rs429358 = 19:45411941, GRCh37.p13)
<br>


**Table 5:** SNPs that were genome-wide significant in the COVID: C2 GWAS
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
{"columns":[{"label":["outliers_removed"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["pve.exposure"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["F"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["Alpha"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["NCP"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["Power"],"name":[6],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"0.001383626","3":"41.19529","4":"0.05","5":"1.720259","6":"0.2589052"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

The I2_GX statistic can be used to quantify the strength of the NOME violation for MR-Egger regression and should be used to evalute potential bias in the MR-Egger causal estimate, with values less then 90% indicating that causal estimated should interpreted with caution due to regression diluation.

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["outliers_removed"],"name":[1],"type":["lgl"],"align":["right"]},{"label":["Isq_gx"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"FALSE","2":"0.2347982"},{"1":"TRUE","2":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


## MR Results
To obtain an overall estimate of causal effect, the SNP-exposure and SNP-outcome coefficients were combined in 1) a fixed-effects meta-analysis using an inverse-variance weighted approach (IVW); 2) a Weighted Median approach; 3) Weighted Mode approach and 4) Egger Regression.


[**IVW**](https://doi.org/10.1002/gepi.21758) is equivalent to a weighted regression of the SNP-outcome coefficients on the SNP-exposure coefficients with the intercept constrained to zero. This method assumes that all variants are valid instrumental variables based on the Mendelian randomization assumptions. The causal estimate of the IVW analysis expresses the causal increase in the outcome (or log odds of the outcome for a binary outcome) per unit change in the exposure. [**Weighted median MR**](https://doi.org/10.1002/gepi.21965) allows for 50% of the instrumental variables to be invalid. [**MR-Egger regression**](https://doi.org/10.1093/ije/dyw220) allows all the instrumental variables to be subject to direct effects (i.e. horizontal pleiotropy), with the intercept representing bias in the causal estimate due to pleiotropy and the slope representing the causal estimate. [**Weighted Mode**](https://doi.org/10.1093/ije/dyx102) gives consistent estimates as the sample size increases if a plurality (or weighted plurality) of the genetic variants are valid instruments.
<br>



Table 6 presents the MR causal estimates of genetically predicted Insomnia on COVID: C2.
<br>

**Table 6** MR causaul estimates for Insomnia on COVID: C2
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["nsnp"],"name":[6],"type":["int"],"align":["right"]},{"label":["b"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"Inverse variance weighted (fixed effects)","6":"13","7":"0.06940611","8":"0.06845562","9":"0.3106377"},{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"Weighted median","6":"13","7":"0.08118491","8":"0.10314661","9":"0.4312334"},{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"Weighted mode","6":"13","7":"0.07869274","8":"0.17974537","9":"0.6693068"},{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"MR Egger","6":"13","7":"-0.08272909","8":"0.29195534","9":"0.7821612"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Figure 1 illustrates the SNP-specific associations with Insomnia versus the association in COVID: C2 and the corresponding MR estimates.
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Jansen2018insom/covidhgi2020C2v5alleur/Jansen2018insom_5e-8_covidhgi2020C2v5alleur_MR_Analaysis_files/figure-html/scatter_plot-1.png" alt="Fig. 1: Scatterplot of SNP effects for the association of the Exposure on the Outcome"  />
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
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Q"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["Q_df"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["Q_pval"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"MR Egger","6":"20.02246","7":"11","8":"0.04503362"},{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"Inverse variance weighted","6":"20.57167","7":"12","8":"0.05701556"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Figure 2 shows a funnel plot displaying the MR estimates of individual genetic variants against their precession. Aysmmetry in the funnel plot may arrise due to some genetic variants having unusally strong effects on the outcome, which is indicative of directional pleiotropy.
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Jansen2018insom/covidhgi2020C2v5alleur/Jansen2018insom_5e-8_covidhgi2020C2v5alleur_MR_Analaysis_files/figure-html/funnel_plot-1.png" alt="Fig. 2: Funnel plot of the MR causal estimates against their precession"  />
<p class="caption">Fig. 2: Funnel plot of the MR causal estimates against their precession</p>
</div>
<br>

Figure 3 shows a [Radial Plots](https://github.com/WSpiller/RadialMR) can be used to visualize influential data points with large contributions to Cochran's Q Statistic that may bias causal effect estimates.




```
## [1] "No significant Outliers"
```

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Jansen2018insom/covidhgi2020C2v5alleur/Jansen2018insom_5e-8_covidhgi2020C2v5alleur_MR_Analaysis_files/figure-html/Radial_Plot-1.png" alt="Fig. 4: Radial Plot showing influential data points using Radial IVW"  />
<p class="caption">Fig. 4: Radial Plot showing influential data points using Radial IVW</p>
</div>
<br>

The intercept of the MR-Egger Regression model captures the average pleitropic affect across all genetic variants (Table 8).
<br>

**Table 8:** MR Egger test for directional pleitropy
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["egger_intercept"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[7],"type":["dbl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"0.006066024","6":"0.0110432","7":"0.5937755"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

Pleiotropy was also assesed using Mendelian Randomization Pleiotropy RESidual Sum and Outlier [(MR-PRESSO)](https://doi.org/10.1038/s41588-018-0099-7), that allows for the evlation of evaluation of horizontal pleiotropy in a standared MR model (Table 9). MR-PRESSO performs a global test for detection of horizontal pleiotropy and correction of pleiotropy via outlier removal (Table 10).
<br>

**Table 9:** MR-PRESSO Global Test for pleitropy
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["pt"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["outliers_removed"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["n_outliers"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["RSSobs"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["dbl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"5e-08","6":"FALSE","7":"0","8":"24.40792","9":"0.0624"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>


**Table 10:** MR Estimates after MR-PRESSO outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["nsnp"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["b"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["se"],"name":[8],"type":["lgl"],"align":["right"]},{"label":["pval"],"name":[9],"type":["lgl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"mrpresso","6":"NA","7":"NA","8":"NA","9":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

<div class="figure" style="text-align: center">
<img src="/sc/arion/projects/LOAD/shea/Projects/MRcovid/results/MRcovideur/Jansen2018insom/covidhgi2020C2v5alleur/Jansen2018insom_5e-8_covidhgi2020C2v5alleur_MR_Analaysis_files/figure-html/scatter_plot_outlier-1.png" alt="Fig. 5: Scatterplot of SNP effects for the association of the Exposure on the Outcome after outlier removal"  />
<p class="caption">Fig. 5: Scatterplot of SNP effects for the association of the Exposure on the Outcome after outlier removal</p>
</div>
<br>

**Table 11:** Heterogenity Tests after outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["Q"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["Q_df"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["Q_pval"],"name":[8],"type":["lgl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"mrpresso","6":"NA","7":"NA","8":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>

**Table 12:** MR Egger test for directional pleitropy after outlier removal
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id.exposure"],"name":[1],"type":["chr"],"align":["left"]},{"label":["id.outcome"],"name":[2],"type":["chr"],"align":["left"]},{"label":["outcome"],"name":[3],"type":["chr"],"align":["left"]},{"label":["exposure"],"name":[4],"type":["chr"],"align":["left"]},{"label":["method"],"name":[5],"type":["chr"],"align":["left"]},{"label":["egger_intercept"],"name":[6],"type":["lgl"],"align":["right"]},{"label":["se"],"name":[7],"type":["lgl"],"align":["right"]},{"label":["pval"],"name":[8],"type":["lgl"],"align":["right"]}],"data":[{"1":"d4jpEH","2":"Utlw90","3":"covidhgi2020C2v5alleur","4":"Jansen2018insom","5":"mrpresso","6":"NA","7":"NA","8":"NA"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>
<br>
