#################################
#######   PLOTTING!!!!!   #######
#################################

##### automated for each directory ########


# for both

# (note that dft samples don't have the dft in front of the output files oops but female samples have F_ at the beginning)

for bw in *.bw; do
    sample="${bw%.bw}"
    
    if [[ "$bw" == F_* ]]; then
        auto_beds="$HOME/TD/quartiles/F_auto_Q1.bed $HOME/TD/quartiles/F_auto_Q2.bed $HOME/TD/quartiles/F_auto_Q3.bed $HOME/TD/quartiles/F_auto_Q4.bed"
        x_beds="$HOME/TD/quartiles/F_X_Q1.bed $HOME/TD/quartiles/F_X_Q2.bed $HOME/TD/quartiles/F_X_Q3.bed $HOME/TD/quartiles/F_X_Q4.bed"
    else
        auto_beds="$HOME/TD/quartiles/auto_Q1.bed $HOME/TD/quartiles/auto_Q2.bed $HOME/TD/quartiles/auto_Q3.bed $HOME/TD/quartiles/auto_Q4.bed"
        x_beds="$HOME/TD/quartiles/X_Q1.bed $HOME/TD/quartiles/X_Q2.bed $HOME/TD/quartiles/X_Q3.bed $HOME/TD/quartiles/X_Q4.bed"
    fi

    computeMatrix reference-point -S ./"$bw" \
        -R $auto_beds \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_auto.gz" &

    computeMatrix reference-point -S ./"$bw" \
        -R $x_beds \
        --referencePoint TSS -b 10000 -a 10000 --binSize 50 \
        -out gz/"${sample}_X.gz" &

    wait
done


##### exporting data as tsv file #####

for gz in *.gz; do
    sample="${gz%.gz}"
    plotProfile \
        -m "$gz" \
        --outFileNameData "${sample}_data.tsv" \
        -out plot/"together_${sample}.png"
done

mv *tsv ~/TD/tsv_plots
