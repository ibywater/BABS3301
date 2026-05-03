

### NORMALISE ###

# H3K9ac - only DFT
awk 'BEGIN{OFS="\t"} {$4=$4*0.877412636; print}' DFT_H3K9ac_narrow_treat_pileup.bdg > ~/TD/bigwig/DFT_H3K9ac_narrow_normalised.bdg

# H3K9me3 - only DFT
awk 'BEGIN{OFS="\t"} {$4=$4*0.932838643; print}' DFT_H3K9me3_broad_treat_pileup.bdg > ~/TD/bigwig/H3K9me3/DFT_H3K9me3_broad_normalised.bdg
awk 'BEGIN{OFS="\t"} {$4=$4*0.932838643; print}' DFT_H3K9me3_narrow_treat_pileup.bdg > ~/TD/bigwig/H3K9me3/DFT_H3K9me3_narrow_normalised.bdg

# H3K4me3 - only female
awk 'BEGIN{OFS="\t"} {$4=$4*0.743757131; print}' F_TD_H3K4me3_broad_treat_pileup.bdg > ~/TD/bigwig/H3K4me3/F_H3K4me3_broad_normalised.bdg
awk 'BEGIN{OFS="\t"} {$4=$4*0.743757131; print}' F_TD_H3K4me3_narrow_treat_pileup.bdg > ~/TD/bigwig/H3K4me3/F_H3K4me3_narrow_normalised.bdg

# H4K20me3 - only DFT
awk 'BEGIN{OFS="\t"} {$4=$4*0.798738808; print}' DFT_H4K20me3_broad_treat_pileup.bdg > ~/TD/bigwig/H4K20me3/DFT_H4K20me3_broad_normalised.bdg
awk 'BEGIN{OFS="\t"} {$4=$4*0.798738808; print}' DFT_H4K20me3_narrow_treat_pileup.bdg > ~/TD/bigwig/H4K20me3/DFT_H4K20me3_narrow_normalised.bdg


###### convert to bigWig ######

# H3K9ac
bedGraphToBigWig DFT_H3K9ac_narrow_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_H3K9ac_narrow_normalised.bw   #done

bedGraphToBigWig F_TD_H3K9ac_narrow_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H3K9ac_narrow.bw

# H3K9me3
bedGraphToBigWig DFT_H3K9me3_broad_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_H3K9me3_broad_normalised.bw
bedGraphToBigWig DFT_H3K9me3_narrow_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_H3K9me3_narrow_normalised.bw

bedGraphToBigWig F_TD_H3K9me3_broad_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H3K9me3_broad.bw
bedGraphToBigWig F_TD_H3K9me3_narrow_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H3K9me3_narrow.bw

# H3K4me3
bedGraphToBigWig DFT_TD_H3K4me3_broad_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_H3K4me3_broad.bw
bedGraphToBigWig DFT_TD_H3K4me3_narrow_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_TD_H3K4me3_narrow.bw

bedGraphToBigWig F_H3K4me3_broad_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H3K4me3_broad_normalised.bw
bedGraphToBigWig F_H3K4me3_narrow_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H3K4me3_narrow_normalised.bw

# H4K20e3
bedGraphToBigWig DFT_H4K20me3_broad_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_H4K20me3_broad_normalised.bw
bedGraphToBigWig DFT_H4K20me3_narrow_normalised.bdg ~/TD/genome/fasta_file/genome.chrom.sizes DFT_H4K20me3_narrow_normalised.bw

bedGraphToBigWig F_TD_H4K20me3_broad_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H4K20me3_broad.bw
bedGraphToBigWig F_TD_H4K20me3_narrow_treat_pileup.bdg ~/TD/genome/fasta_file/genome.chrom.sizes F_H4K20me3_narrow.bw
