#!/usr/bin/env bash
for f in raw/*.1.fastq.gz
do
    FILENAME=$(basename $f | awk '{split ($0, a, ".1.fastq.gz"); print a[1]}')
    echo "Currently at $FILENAME"
    cat "raw/$FILENAME.1.fastq.gz" "raw/$FILENAME.2.fastq.gz" > "combined/$FILENAME_combined.fastq.gz"
done
