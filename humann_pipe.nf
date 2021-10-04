#!/usr/bin/env nextflow 

params.dir = "data/combined/*.fastq.gz"
params.outputdir = "output/humann_output/"
seq_files = file(params.dir)

process run_humann {
    input: 
    file query_file from seq_files
    """
    humann --input ${query_file} --output $params.outputdir
    """
}

