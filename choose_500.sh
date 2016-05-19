#!/bin/bash
SNP_file=1Mv1_fbat/*.txt
for f in $SNP_file
do
		NAME=$f
		echo "$f"
		
		# choose the SNP column
                head -500 $f > result_fbat/$f
                

done
		  
		




