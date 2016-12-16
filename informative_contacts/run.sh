#!/bin/bash -l

#SBATCH --time 25:00:00
#SBATCH --nodes=2
#SBATCH --ntasks=15

BASEDIR=/scratch1/battle-fs1/heyuan/project_informative_looping
FROM_BEGINNING=false

mkdir ${BASEDIR}/plots
mkdir ${BASEDIR}/data
mkdir ${BASEDIR}/features



SCRIPTDIR=/home/yhe23/project_informative_looping
cd ${SCRIPTDIR}




################################################################### 
### 1. download and process data from ENCODE 
###################################################################

if ${FROM_BEGINNING}
then 
    bash seqdata_pipeline_fa.sh ${BASEDIR}  ## ATAC-seq
    bash seqdata_pipeline_bam.sh ${BASEDIR} ## CTCF ChIP-seq
    cp /scratch1/battle-fs1/heyuan/project_informative_looping/features/GSE63525_GM12878* ${BASEDIR}/features
    cp /scratch1/battle-fs1/heyuan/project_informative_looping/features/segments_Adipose_Subcutaneous.bed ${BASEDIR}/features
else
    echo "Not run"
    cp /scratch1/battle-fs1/heyuan/project_informative_looping/features/* ${BASEDIR}/features
fi



################################################################### 
### 2. annotate the matrixeQTL results with features and
###    extract the positive and negative sets
###################################################################

# bash makingSets.sh ${BASEDIR}



################################################################### 
### 3. run exploratory analysis and machine learning model
###################################################################

python train_model.py ${BASEDIR} 






