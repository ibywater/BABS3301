##############################
### aligns reads to genome ###
##############################

################## DFT1 ##################

#H3K9ac

subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r DFT_TD_H3K9ac_LIS12208A9_S9_L001_R1_001_val_1.fq.gz \
-R DFT_TD_H3K9ac_LIS12208A9_S9_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/DFT_TD_H3K9ac_trimmed.bam

#H3K9me3

subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r DFT_TD_H3K9me3_LIS12208A10_S10_L001_R1_001_val_1.fq.gz \
-R DFT_TD_H3K9me3_LIS12208A10_S10_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/DFT_TD_H3K9me3_trimmed.bam

#H4K20me3

subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r DFT_TD_H4K20me3_LIS12208A11_S6_L001_R1_001_val_1.fq.gz \
-R DFT_TD_H4K20me3_LIS12208A11_S6_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/DFT_TD_H4K20me3_trimmed.bam

#input
subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r DFT_input_S10_L001_R1_001_val_1.fq.gz \
-R DFT_input_S10_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/DFT_TD_input_trimmed.bam

#H3K4me3
subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r DFT_H3K4me3_S2_L001_R1_001_val_1.fq.gz \
-R DFT_H3K4me3_S2_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/DFT_TD_H3K4me3_trimmed.bam


############## Fibroblasts ###############

#H3K9ac

subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r F_TD_H3K9ac_LIS12208A1_S1_L001_R1_001_val_1.fq.gz \
-R F_TD_H3K9ac_LIS12208A1_S1_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/F_TD_H3K9ac_trimmed.bam

#H3K9me3

subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r F_TD_H3K9me3_LIS12208A2_S11_L001_R1_001_val_1.fq.gz \
-R F_TD_H3K9me3_LIS12208A2_S11_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/F_TD_H3K9me3_trimmed.bam

#H4K20me3

subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r F_TD_H4K20me3_LIS12208A3_S5_L001_R1_001_val_1.fq.gz \
-R F_TD_H4K20me3_LIS12208A3_S5_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/F_TD_H4K20me3_trimmed.bam

#input
subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r female_TD_input_S3_L001_R1_001_val_1.fq.gz \
-R female_TD_input_S3_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/F_TD_input_trimmed.bam

#H3K4me3
subread-align -t 1 -i ~/TD/genome/index_new/mSarHar1.11_genomic_SubreadIndex \
-r fem_TD_H3K4me3_S11_L001_R1_001_val_1.fq.gz \
-R fem_TD_H3K4me3_S11_L001_R2_001_val_2.fq.gz \
-o ~/TD/subread/F_TD_H3K4me3_trimmed.bam

