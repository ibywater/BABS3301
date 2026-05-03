##########################
### sorting alignments ###
##########################


# DFT1
samtools sort DFT_TD_input_trimmed.bam  -o sorted/DFT_TD_input_sorted.bam
samtools sort DFT_TD_H3K4me3_trimmed.bam -o sorted/DFT_TD_H3K4me3_sorted.bam
samtools sort DFT_TD_H3K9ac_trimmed.bam -o sorted/DFT_TD_H3K9ac_sorted.bam
samtools sort DFT_TD_H3K9me3_trimmed.bam -o sorted/DFT_TD_H3K9me3_sorted.bam
samtools sort DFT_TD_H4K20me3_trimmed.bam -o sorted/DFT_TD_H4K20me3_sorted.bam

# Fibroblasts
samtools sort F_TD_input_trimmed.bam -o sorted/F_TD_input_sorted.b
samtools sort F_TD_H3K4me3_trimmed.bam -o sorted/F_TD_H3K4me3_sorted.bam
samtools sort F_TD_H3K9ac_trimmed.bam -o sorted/F_TD_H3K9ac_sorted.bam
samtools sort F_TD_H3K9me3_trimmed.bam -o sorted/F_TD_H3K9me3_sorted.bam
samtools sort F_TD_H4K20me3_trimmed.bam -o sorted/F_TD_H4K20me3_sorted.bam
