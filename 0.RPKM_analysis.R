install.packages("BiocManager")
BiocManager::install("edgeR")
BiocManager::install("limma")
BiocManager::install("GenomicFeatures")
BiocManager::install("txdbmaker")

library("edgeR")
library("reshape2")
library("tidyverse")
library("gridExtra")
library("dplyr")

setwd("~/Uni/2026/BABS3301/Data")

f <- read.delim("TD_Female_htseq.txt", header = F, sep = "\t")
dft1 <- read.delim("TD_DFT_htseq.txt", header = F, sep = "\t")

#joins female and dft1 RNA-seq data
tags <- left_join(f,dft1, by="V1")

colnames(tags) = c("gene", "female", "dft1")

#adds row names for genes and gets rid of vector with gene names
row.names(tags) <- tags$gene
tags <- tags[, 2:3]

# gets rid of no feature, ambiguous, too low aQual, not aligned, 
# and alignment not unique
tags <- head(tags, -5)

group <- c(1,2)

# creates digital gene expression list and "calculate normalization 
# factors that scale raw library sizes to account for compositional 
# biases in RNA-seq data"
y <- DGEList(counts = tags, group = group)
y <- calcNormFactors(y)

nc <- cpm(y, normalized.lib.sizes = TRUE)

nc <- as.data.frame(nc)


###match genes expression values to genome location

genes <- read.delim("genomic.gtf", header = F, sep = "\t")

#only keeps rows where feature type is gene
genes <- genes[which(genes[,3] == "gene"),] 

#only includes rows where the chromosome name starts with NC_04 (i.e. no mitochondrial etc.)
genes <- subset(genes, grepl("NC_04*", V1))

#split column v9 into 6 new columns
genes[,9:14] <- colsplit(genes$V9, ";", c("1","2","3","4","5", "6")) #change chromosome number here?


#gets rid of word "gene" in column "5"
# e.g. instead of saying "gene LOC100919053", it says "LOC100919053"
genes$"5"=gsub(paste("gene ",collapse='|'),"",genes$"5")
colnames(genes)[13]  <- "Gene" 

#converts the row name into a column (used to have row names as genes)
nc1 <- tibble::rownames_to_column(nc, "Gene")

keep <- genes[c(1,4,5,7,13)]

genes2 <- keep[order(keep$Gene), ]
genes3 <- as.data.frame(apply(genes2,
                              2,
                              function(x) gsub("\\s+", "", x)))
str(genes3)

#combines GTF data with the RNA-seq data!!
data <- merge(x = genes3, y = nc1, by = "Gene")

#colnames(data) <- c("Gene","Chr","Start","End","Strand","Male", "Female", "DFT")
colnames(data) <- c("Gene","Chr","Start","End","Strand","Female", "DFT1")



# Adding gene length into nc to calculate RPKM

library("GenomicFeatures")

## makes text file of gene lengths
#txdb <- txdbmaker::makeTxDbFromGFF("genomic.gtf", format="gtf")
#exons.list.per.gene <- exonsBy(txdb,by="gene")
#exonic.gene.sizes <- sum(width(reduce(exons.list.per.gene)))
#unlist_geneLength<-unlist(exonic.gene.sizes)
#write.table(unlist_geneLength,"geneLength2.txt")

#alternative method for gene length?
#gene_length <- transcriptLengths(txdb)
#gene_length_unique <- gene_length[!duplicated(gene_length$gene_id), ]

gene_length <- read.table("geneLength2.txt", header = T)
gene_length <- tibble::rownames_to_column(gene_length, "Gene") #i added this line in
colnames(gene_length) <- c("Gene", "Length")
counts <- left_join(data,gene_length, by="Gene")

RPKM <- rpkm(counts[c(6:7)],gene.length = counts$Length)
RPKM <- as.data.frame(RPKM)
RPKM <- cbind(data[c(1:5)], RPKM)

### Separate female, DFT then remove zero counts

RPKM_Counts_Female <- RPKM[,c(1,2,6)]
RPKM_Counts_Female <- RPKM_Counts_Female %>%
  filter(Female > 0)

RPKM_Counts_DFT <- RPKM[,c(1,2,7)]
RPKM_Counts_DFT <- RPKM_Counts_DFT %>%
  filter(DFT1 > 0)

RPKM_Counts_Female_zero <- RPKM[,c(1,2,6)] %>%
  filter(Female == 0)

RPKM_Counts_DFT_zero <- RPKM[,c(1,2,7)] %>%
  filter(DFT1 == 0)


#Rank expression values so quantiles will accept ties 

RPKM_Counts_Female$RankExp <- rank(RPKM_Counts_Female$Female, ties.method = "first")

RPKM_Counts_DFT$RankExp <- rank(RPKM_Counts_DFT$DFT, ties.method = "first")


#Calculate quartiles
library(fabricatr)

RPKM_Counts_Female$Fquart <- split_quantile(x=RPKM_Counts_Female$RankExp, type=3)

RPKM_Counts_DFT$DFTquart <- split_quantile(x=RPKM_Counts_DFT$RankExp, type=3)

#add difference to counts df

FemaleDiff <- RPKM_Counts_Female_zero[!(RPKM_Counts_Female_zero$Gene %in% RPKM_Counts_Female$Gene),]

FemaleDiff$RankExp = NA
FemaleDiff$Fquart = NA

RPKM_Counts_Female <- rbind(RPKM_Counts_Female, FemaleDiff)
RPKM_Counts_Female$Fquart <- as.numeric(RPKM_Counts_Female$Fquart)

RPKM_Counts_Female[is.na(RPKM_Counts_Female)] <- 0
str(RPKM_Counts_Female)

DFTDiff <- RPKM_Counts_DFT_zero[!(RPKM_Counts_DFT_zero$Gene %in% RPKM_Counts_DFT$Gene),]

DFTDiff$RankExp = NA
DFTDiff$DFTquart = NA

RPKM_Counts_DFT <- rbind(RPKM_Counts_DFT, DFTDiff)
RPKM_Counts_DFT$DFTquart <- as.numeric(RPKM_Counts_DFT$DFTquart)

RPKM_Counts_DFT[is.na(RPKM_Counts_DFT)] <- 0
str(RPKM_Counts_DFT)




RPKM_Counts_Female$Fquart <- as.factor(RPKM_Counts_Female$Fquart)
RPKM_Counts_Female$Region <- ifelse(RPKM_Counts_Female$Chr == "NC_045432.1", 'X', 'Auto')

RPKM_Counts_DFT$DFTquart <- as.factor(RPKM_Counts_DFT$DFTquart)
RPKM_Counts_DFT$Region <- ifelse(RPKM_Counts_DFT$Chr == "NC_045432.1", 'X', 'Auto')


########## plotting ##########

#Save Dataframe as a .txt file
write.table(RPKM, file = "RPKM.txt", sep = "\t", quote = F, row.names = T, col.names = T)

RPKM_new <- merge(RPKM, RPKM_Counts_DFT, by="Gene")

RPKM_F <- merge(RPKM, RPKM_Counts_Female, by="Gene")

#Gene Chr Start End Strand DFTquart
head(RPKM_new)

RPKM_new <- RPKM_new[,c(1,2,3,4,5,11)]
colnames(RPKM_new)[2] <- "Chr"

write.table(RPKM_new, file = "RPKM_new.txt", sep = "\t", quote = F, row.names = T, col.names = T)


#########################################
########## making quartiles #############
#########################################

############### DFT1 ###############

df <- RPKM_new
head(df)

##df <- df[,c(1,2,3,4,5,11)]
colnames(df)[2] <- "Chr"

write.table(RPKM_new, file = "RPKM_new.txt", sep = "\t", quote = F, row.names = T, col.names = T)

str(df)
df$Start <- as.numeric(as.character(df$Start))
df$End   <- as.numeric(as.character(df$End))

df_X <- df[which(df$Region == "X"), ]
df_auto <- df[which(df$Region == "Auto"), ]

head(df_X)
df_X <- df_X[,c(1,2,3,4,5,11)]
df_auto <- df_auto[,c(1,2,3,4,5,11)]

#for auto
for (q in 0:3) {
  
  subset <- df_auto[df_auto$DFTquart == q, ]
  
  bed <- data.frame(
    chr = subset$Chr,
    start = subset$Start - 1,
    end = subset$End,
    name = subset$Gene
  )
  
  write.table(bed,
              file=paste0("auto_Q", q + 1, ".bed"),
              sep="\t",
              quote=FALSE,
              row.names=FALSE,
              col.names=FALSE)
}




for (q in 0:3) {
  
  subset <- df[df$DFTquart == q, ]
  
  bed <- data.frame(
    chr = subset$Chr,
    start = subset$Start - 1,
    end = subset$End,
    name = subset$Gene
  )
  
  write.table(bed,
              file=paste0("Q", q + 1, ".bed"),
              sep="\t",
              quote=FALSE,
              row.names=FALSE,
              col.names=FALSE)
}

summary(df$Start)


############### female ###############

df <- RPKM_F
head(df)

##df <- df[,c(1,2,3,4,5,11)]
colnames(df)[2] <- "Chr"

write.table(RPKM_new, file = "RPKM_new.txt", sep = "\t", quote = F, row.names = T, col.names = T)

str(df)
df$Start <- as.numeric(as.character(df$Start))
df$End   <- as.numeric(as.character(df$End))

df_X <- df[which(df$Region == "X"), ]
df_auto <- df[which(df$Region == "Auto"), ]

head(df_X)
df_X <- df_X[,c(1,2,3,4,5,11)]
df_auto <- df_auto[,c(1,2,3,4,5,11)]

#for auto
for (q in 0:3) {
  
  subset <- df_auto[df_auto$Fquart == q, ]
  
  bed <- data.frame(
    chr = subset$Chr,
    start = subset$Start - 1,
    end = subset$End,
    name = subset$Gene
  )
  
  write.table(bed,
              file=paste0("F_auto_Q", q + 1, ".bed"),
              sep="\t",
              quote=FALSE,
              row.names=FALSE,
              col.names=FALSE)
}




for (q in 0:3) {
  
  subset <- df[df$DFTquart == q, ]
  
  bed <- data.frame(
    chr = subset$Chr,
    start = subset$Start - 1,
    end = subset$End,
    name = subset$Gene
  )
  
  write.table(bed,
              file=paste0("Q", q + 1, ".bed"),
              sep="\t",
              quote=FALSE,
              row.names=FALSE,
              col.names=FALSE)
}

summary(df$Start)
