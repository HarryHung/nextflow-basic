#!/bin/bash

# Loop over each FASTA file
for file in samples/sample*.fasta; do
    echo "Processing $file..."

    # Count contigs (lines that start with ">")
    contig_count=$(grep -c "^>" "$file")
    
    # Calculate total length by summing up the lengths of all sequence lines
    total_length=$(grep -v "^>" "$file" | tr -d '\n' | expr $(wc -c))
    
    # Output results
    echo "Number of contigs: $contig_count"
    echo "Total length: $total_length"
    echo "-----------------------"
done
