#!/bin/bash


cd ~/TD/data/DFT1/raw

fastqc *.fastq.gz -o ~/TD/data/DFT1/FastQC

cd ~/TD/data/F_TD/raw

fastqc *.fastq.gz -o ~/TD/data/F_TD/FastQC
