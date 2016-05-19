#!/bin/bash

curl -s "http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/snp144.txt.gz" | gunzip -c | cut -d ' ' -f 2,3,4,5 > snppos_rsname
cat snppos_rsname | sed 's/\s+/\t/g' | cut -f 2 | sed 's/chr//g' > part1
cat snppos_rsname | sed 's/\s+/\t/g' | cut -f 3 > part2
paste -d "_" part1 part2 > part12

#cat snppos_rsname | sed 's/\s+/\t/g' | cut -f 4,5 > part3
paste part12 part3 > part123


# change SNP position name to gene name
cut -f 2 /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/For_TranSMART_Upload/ArrayData_For_Upload_no_NAs/1Mv1/12071.s1_4262850004_A_1Mv1_FinalReport.txt_format_for_upload.txt | sed s'/_[a-zA-Z]\/[a-zA-Z]//g' > snppos
 
cat snppos | sort > tmp11
cat part123 | sort -k 1,1 > tmp12
join tmp11 tmp12 > tmp13

