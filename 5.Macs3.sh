###################################
###### Macs3 Peak enrichment ######
###################################

#DFT H3K9me3
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K9me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n DFT_H3K9me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K9me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_H3K9me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#DFT H3K9ac
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K9ac_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_H3K9ac_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#DFT H4K20me3
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H4K20me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n DFT_H4K20me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H4K20me3_sorted.bam \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_H4K20me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H3K4me3
macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n DFT_TD_H3K4me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/DFT_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/DFT_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n DFT_TD_H3K4me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01



#female TD

#TD H3K9ac
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K9ac_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H3K9ac_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H3K9me3
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K9me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n F_TD_H3K9me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K9me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H3K9me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H4K20me3
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H4K20me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n F_TD_H4K20me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H4K20me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H4K20me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01

#TD H3K4me3
macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
--broad \
-g 3.1e9 \
-n F_TD_H3K4me3_broad \
-B \
--outdir ~/TD/macs3
-q 0.01

macs3 callpeak \
-t ~/TD/subread/sorted/F_TD_H3K4me3_sorted.bam  \
-c ~/TD/subread/sorted/F_TD_input_sorted.bam \
-f BAMPE \
-g 3.1e9 \
-n F_TD_H3K4me3_narrow \
-B \
--outdir ~/TD/macs3
-q 0.01
