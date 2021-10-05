#!/usr/bin/env nextflow 

seqFiles = Channel.fromFilePairs("raw_data/paired_end/*.{1,2}.fastq.gz")

process concat_samples {
    echo true 
    publishDir 'raw_data/combined'
    input: 
    set sampleID, file(reads) from seqFiles
    output:
    set sampleID, file("${sampleID}_concat.fastq.gz") into concatFiles
    """
    cat $reads > ${sampleID}_concat.fastq.gz
    """   
}


