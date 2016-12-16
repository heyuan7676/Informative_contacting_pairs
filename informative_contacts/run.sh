#!/bin/bash -l

#SBATCH --time 25:00:00
#SBATCH --nodes=2
#SBATCH --ntasks=15

SCRIPTDIR=/home/yhe23/project_informative_looping
cd ${SCRIPTDIR}



#### !!! Please include the following lines to ~/.bash_profile 
#
# PATH=$PATH:/scratch0/battle-fs1/heyuan/HOMER/./    
# PATH=$PATH:/scratch0/battle-fs1/heyuan/HOMER/./bin/
# PATH=$PATH:/scratch1/battle-fs1/heyuan/anaconda/bin/






################################################################### 
### 1. download and process data from ENCODE 
###################################################################

### ATAC-seq
# bash seqdata_pipeline_fa.sh



### CTCF ChIP-seq
# bash seqdata_pipeline_bam.sh




################################################################### 
### 2. annotate the matrixeQTL results with features and
###    extract the positive and negative sets
###################################################################

bash makingSets.sh



################################################################### 
### 3. run exploratory analysis and machine learning model
###################################################################

/scratch1/battle-fs1/heyuan/anaconda/bin/python train_model.py






