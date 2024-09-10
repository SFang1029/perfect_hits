#!/bin/bash

query="$1"
subject="$2"
output="$3"

blastn -query "$query" -subject "$subject" -task blastn-short -outfmt '6 qseqid sseqid pident length qseq sseq' -out blast_results.txt

awk '$3 == 100 && $4 == 28 {print $1, $2, $3, $4, $5, $6}' blast_results.txt > "$output"

perfect_matches=$(awk '$3 == 100 && $4 == 28' blast_results.txt | wc -l)

echo "Found $perfect_matches perfect matches in $subject"

rm blast_results.txt
