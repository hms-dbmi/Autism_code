#!/bin/bash

# 1. Choose subgroups
# test the whole samples to select significant SNP
# Here, subgroup = whole sample


# 2. copy *** files (the number depand on how many samples in the subgroup) to file fold subgroup_input
#cp SSC52* demo_input/
cp /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/PUB/Final_report/SSC54_FullFinalReport50.txt /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/PUB/Final_report/subgroup_gcta_input/
#cp /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/PUB/Final_report/SSC53* /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/PUB/Final_report/subgroup_gcta_input/



# 3. For each file in the fold, change the format for "GCTA tool" 
cd /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/PUB/Final_report/subgroup_gcta_input
cp /home/ll272/SNPtoPlink/input_files/header_colname .

SNP_file=*.txt
for f in $SNP_file
do
                NAME=$f
                echo "$f"
		head $f > header_top
		sed '1,11d' $f > tmp
		awk -F '\t' '{print $2, $1, $1, $18, $12, $13, $5, $6, $14, $15, $16, $17, $7, $8, $24, $25, $26, $27, $28, $9, $10}' tmp > tmp1
		sed 's///g' tmp1 > tmp2
		sed 's/ /\t/g' tmp2 > tmp3
		cat header_top header_colname tmp3 >> $f.txt
		echo /n/data1/hms/dbmi/avillach/autism-data/Simons_SSC_SNP/PUB/Final_report/subgroup_gcta_input/"$f".txt >> /home/ll272/SNPtoPlink/input_files/raw_geno_filenames.txt
		rm tmp*
done


# 4. Run GCTA for each sample:  raw file to ped file
# put all the ped files together in the raw_geno_filenames.txt
cd /home/ll272/SNPtoPlink/gcta_1-3 
./gcta64  --raw-files ../input_files/raw_geno_filenames.txt  --raw-summary ../input_files/SNP_summary_table.txt  --out test_1





# 5. Put all the samples together and change the first 6 columns of ped file
#The PED file is is a white-space (space or tab) delimited file: the first six columns are mandatory:
#     Family ID
#     Individual ID
#     Paternal ID
#     Maternal ID
#     Sex (1=male; 2=female; other=unknown)
#     Phenotype. 

# creat the 6 colum 
# mapping file: /n/data1/hms/dbmi/avillach/yuri-files/genotype_files/global_files/mappings.txt
cd /home/ll272/SNPtoPlink/input_files
cp /n/data1/hms/dbmi/avillach/yuri-files/genotype_files/global_files/mappings.txt .











 















