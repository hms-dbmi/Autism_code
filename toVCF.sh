#!/bin/bash
SNP_file=1Mv1_scidb/*.txt
for f in $SNP_file
do
		NAME=$f
		echo "$f"
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 3 > tmp1
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 4 > tmp2
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 3 | sed 's/.*/./g' > tmp3
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 5 > tmp4
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 6 > tmp5
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 3 | sed 's/.*/./g' > tmp6
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 3 | sed 's/.*/./g' > tmp7
		sed 's/_/\t/g' ${SNP_file} | sed 's/\//\t/g' | cut -f 3 | sed 's/.*/./g' > tmp8
		paste tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 > tmp9
		sed -i -e "1i#COROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO" tmp9		
		cat tmp9 > result/$f.vcf
		rm tmp*
done




