#!/bin/bash -l

#SBATCH --time 10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=5



#################################################################
## shrink the dataset, to reduce time reading in
#################################################################

# tissue=Adipose_Subcutaneous
# cd /scratch0/battle-fs1/heyuan/long_range/SNP_gene/${tissue}/


# for fn in *filtered.txt
# do
#     echo $fn
#     head -n1 ${fn} > temp
#     awk '{if($6<0.1) print $0}' ${fn} >> temp
#     awk '{if($6>0.9995) print $0}' ${fn} >> temp
#     mv temp ${fn%.txt}_subset.txt
# done
    



#################################################################
## making the positive sets and negative sets
#################################################################

for i in {13..22}
do
    echo ${i}
    ~/R-3.2.0/bin/Rscript makingSets.R Adipose_Subcutaneous chr${i}
done
