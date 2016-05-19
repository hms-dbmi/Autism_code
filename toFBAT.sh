#!/bin/bash
SNP_file=1Mv1_fbat_500/*.txt
for f in $SNP_file
do
		NAME=$f
		echo "$f"
		
		# choose the SNP column
                sed 's/_/\t/g' $f | sed 's/\//\t/g'| cut -f 5,6,8,9 > tmp.regs
                

		while read reg1;
		do
			  				
			column1=`echo ${reg1} | awk '{print $1}'`
			column2=`echo ${reg1} | awk '{print $2}'`
			column3=`echo ${reg1} | awk '{print $3}'`
			column4=`echo ${reg1} | awk '{print $4}'`
			
			#echo "${column3}"
			#echo "${column4}"
			if [ ${column3} -eq 0 ]; 
			then
				column5=`echo 0`
			elif [ ${column3} -eq 1 ]; 
			then  
				column5=`echo ${column1}`
			fi


			if [ ${column4} -eq "0" ];        
                        then 
                                column6=`echo 0`                     
                        elif [ ${column4} -eq "1" ];
                        then
                                column6=`echo ${column2}`            
                        fi
		echo -e "${column1}\t${column2}\t${column3}\t${column4}\t${column5}\t${column6}" >> tmp1
		done < tmp.regs
		

		
		# column to line
		cut -f 5,6 tmp1  > tmp11
		rm tmp1
		paste -sd " " tmp11 | sed 's/\t/ /g'  > tmp2
		
		# ATGC to number:1234
		cat tmp2 | sed 's/A/1/g' | sed 's/T/2/g' | sed 's/G/3/g' | sed 's/C/4/g' > tmp3 

		# add the file name for the first field  
		FILENAME=`basename ${NAME}`
		NAMESHORT=`echo ${FILENAME} | sed 's/_/\t/g' | cut -f 1`
		echo "${NAMESHORT}"
		sed -i -e "1i${NAMESHORT}" tmp3 
		

		paste -sd " " tmp3 > result_fbat/$f.ped
		rm tmp*
done
		  
		




