#!/bin/bash
cd result_snp/1Mv1_fbat/
cat *.ped >> tmp1
cat /n/data1/hms/dbmi/avillach/yuri-files/genotype_files/global_files/fbat_Genotypes.ped | cut -f 1,2,3,4 -d " " > tmp2_col1234
cat /n/data1/hms/dbmi/avillach/yuri-files/genotype_files/global_files/fbat_Genotypes.ped | cut -f 6 -d " " | sed 's/iq/0/g' > tmp2_6

head -2000 tmp2_6 | sed 's/0/2/g' > tmp2_6_1
tail -1927 tmp2_6 | sed 's/0/1/g' > tmp2_6_2
rm tmp2_6
cat tmp2_6_1 tmp2_6_2 >> tmp2_6
 

#grep -v "remove" /n/data1/hms/dbmi/avillach/yuri-files/genotype_files/global_files/mappings.txt > mappings_rmv_raw.txt
#cat mappings_rmv_raw.txt | sed 's///g'

# random choose half = affected, half= unaffected



paste tmp2_col1234 tmp2_6 > tmp2_col12346

cat /n/data1/hms/dbmi/avillach/yuri-files/genotype_files/global_files/mappings.txt | cut -f 2,7 | sed 's/female/2/g' | sed 's/male/1/g'| sed 's/\t/ /g'| sort -k 1,1 > tmp2_sex
join -1 2 -2 1 tmp2_col12346 tmp2_sex > tmp2_merge
awk '{print($2,$1,$3,$4,$5,$6)}' tmp2_merge > tmp2

wc tmp1
wc tmp2



join -1 1 -2 2 tmp1 tmp2 > tmp3
#cut -f 1 -d " " tmp3 > tmp41
#cut -f 2-1940746 -d " " tmp3 > tmp42
#cut -f 1940747 -d " " tmp3 > tmp43
#cut -f 1940748-1940751 -d " " tmp3 > tmp44

cut -f 1 -d " " tmp3 > tmp41
cut -f 2-1001 -d " " tmp3 > tmp42
cut -f 1002 -d " " tmp3 > tmp43
cut -f 1003-1006 -d " " tmp3 > tmp44




paste tmp43 tmp41 tmp44 tmp42 > tmp4
sed 's/\t/ /g' tmp4 > input.ped

cut -f 2 /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/For_TranSMART_Upload/ArrayData_For_Upload_no_NAs/1Mv1/12071.s1_4262850004_A_1Mv1_FinalReport.txt_format_for_upload.txt>header_raw
paste -sd " " header_raw > header


# do a small part with 500 snps
cut -f 1-500 -d " " header > header_500
cat header_500 | sed 's/\//_/g' > header_500_v2
cut -f 1-1006 -d " " input.ped > input500_belowpart.ped
cat header_500 input500_belowpart.ped >> input500.ped

grep ".s1" input500.ped > yao1
grep ".p1" input500.ped > yao2
cat header_500_v2 yao1 yao2 > yao.ped


# make header 
for i in `seq 1 500`;do
echo $i >> header_500_numb 
done

paste -sd " " header_500_numb > header_500_numb_v2







