# Informative_contacts


Chromosome folding has been observed for a long time. People have shown that chromatin contacts in the 3-dimensional space play important roles in the genomic regulatory network. Enhancer - promoter interaction is one important type of long range interaction, that has been proved to be crucial in controlling gene expression levels. Also it has been shown that disruption of chromatin architecture would change gene expression levels. However, it is unclear yet how to distinguish between the contacting pairs involved in genetic regulation versus the contacting pairs of structural purpose. This question is very important in terms of understanding the role of folding in the genetic regulation network, and the mechanism behind chromatin architecture. 

From previous research work, it was observed that long range eQTL pairs are enriched of contacting shown by non-zero HiC values. However, I found it very hard to leverage the contacting information to increase the power of identifying long range eQTL. One possible reason is that chromosomes fold for a variety of reasons, including performing genetic control. Thus the long range eQTL data provides a good dataset for assessing the regulation potential between two contacting regions. 



### To process fastq files for ATAC-seq data, and bam files for ChIP-seq data, the following two scripts were run


ATAC-seq:
bash seqdata_pipeline_fa.sh


CTCF ChIP-seq:
bash seqdata_pipeline_bam.sh


### To annotate the matrixeQTL results with features and extract the positive and negative sets

bash makingSets.sh



###  Run exploratory analysis and machine learning model

python train_model.py

features.txt: features to put in the model 
chrlist.txt: chromosomes that provide the data
