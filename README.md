# Bioinformatics Pipeline for CUT&RUN and RNA-seq data #
<p align="center">
  <img width="392" height="801" alt="bioinformatics_pipeline drawio (3)" src="https://github.com/user-attachments/assets/c8df5575-9e61-4cb9-9d20-7906b89e2555" />
</p>

*Input sequencing data*

Raw CUT&RUN data for H3K4me3, H3K9ac, H3K9me3, and H4K20me3 for female and DFT1 cells, and RNA-seq data that was up to the normalisation step in Figure 4 were obtained from experimentation performed by a previous postdoc and honours student.

*Quality control of Sequencing Data*

Each of the samples underwent quality control using FastQC (v0.12.1). Analysing the per base sequence quality and per base sequence content, as well as overrepresented sequences allowed for determining where to trim the reads. Trimming was done using Trim Galore (v0.6.10). FastQC and MultiQC (v1.18) verified the trimmed reads were sufficient quality for downstream processes.

*Alignment to Genome*

The reads were aligned to the Tasmanian devil genome (mSarHar1.11) using Subread (v2.1.1). The resultant .bam file was sorted using Samtools (v1.19.2) to organise it by chromosomal location.

*Identification of enriched regions*

The sorted and aligned file was used to identify regions of significant enrichment using Macs3 callpeak (v3.0.4). The resultant bedgraph files were then normalised using normalisation factors calculated from the number of mapped reads from the alignment step, and then converted to bigwig files for downstream bioinformatics.

*RPKM expression analysis*

Reads Per Kilobase Million (RPKM) was calculated for all the genes in the RNA-seq data in RStudio using the following packages: [edgeR (v3.23), reshape2 (v1.4.5), Tidyverse (v2.0.0), gridextra (v2.3), dplyr (v1.2.1), limma (v3.23), GenomicFeatures (v3.23), txdbmaker (v3.23)]. The genes were then organised into quantiles based on the RPKM values. Quantile 1 were the genes with zero expression. The remaining genes were split evenly into quantiles 2, 3, and 4, corresponding to low, medium, and high expression respectively. The dataframes for each quantile were then exported as BED files containing the chromosome, genomic start and end locations, and gene name for each gene.

*Intersection of RNA-seq and CUT&RUN data*

Using the deepTools (v3.5.6) function computeMatrix, histone modification enrichment was computed for each sample. These scores were computed around the transcription start site (TSS) for each of the four quantiles separately and resulted in a numeric signal value for 50bp increments 10kb either side of the TSS for each quantile. The plotProfile function in deepTools was used to export the data into a tsv file to be visualised in R (v4.5.3).

*Visualisation of plots*

Combined TSS-quantile plots were generated in RStudio (v2026.01.1) using the following package: [Tidyverse (v2.0.0)].
