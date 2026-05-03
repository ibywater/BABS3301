################################
######## trimming reads ########
################################


# DFT1

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/DFT1/trimmed \
DFT_input_S10_L001_R1_001.fastq.gz \
DFT_input_S10_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/DFT1/trimmed \
DFT_H3K4me3_S2_L001_R1_001.fastq.gz \
DFT_H3K4me3_S2_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/DFT1/trimmed \
DFT_TD_H3K9ac_LIS12208A9_S9_L001_R1_001.fastq.gz \
DFT_TD_H3K9ac_LIS12208A9_S9_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/DFT1/trimmed \
DFT_TD_H3K9me3_LIS12208A10_S10_L001_R1_001.fastq.gz \
DFT_TD_H3K9me3_LIS12208A10_S10_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/DFT1/trimmed \
DFT_TD_H4K20me3_LIS12208A11_S6_L001_R1_001.fastq.gz \
DFT_TD_H4K20me3_LIS12208A11_S6_L001_R2_001.fastq.gz



# fibroblasts

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/F_TD/trimmed \
female_TD_input_S3_L001_R1_001.fastq.gz \
female_TD_input_S3_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/F_TD/trimmed \
fem_TD_H3K4me3_S11_L001_R1_001.fastq.gz \
fem_TD_H3K4me3_S11_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/F_TD/trimmed \
F_TD_H3K9ac_LIS12208A1_S1_L001_R1_001.fastq.gz \
F_TD_H3K9ac_LIS12208A1_S1_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/F_TD/trimmed \
F_TD_H3K9me3_LIS12208A2_S11_L001_R1_001.fastq.gz \
F_TD_H3K9me3_LIS12208A2_S11_L001_R2_001.fastq.gz

trim_galore --paired --2colour 20 --length 25 --cores 4 --fastqc \
--output_dir ~/TD/data/F_TD/trimmed \
F_TD_H4K20me3_LIS12208A3_S5_L001_R1_001.fastq.gz \
F_TD_H4K20me3_LIS12208A3_S5_L001_R2_001.fastq.gz
