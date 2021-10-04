#!/usr/bin/env nextflow 

params.dir = "/raw/*.fastq.gz"

files = file(param.dir)


process run_humann {
    output: 
    """
    humann --input $SAMPLE --output $OUTPUT_DIR
    """
}

process normalize_files {
    output:
    """
    humann_renorm_table --input $SAMPLE_genefamilies.tsv \
    --output  $SAMPLE_genefamilies_relab --units relab 
    """
}

process join_files {

}