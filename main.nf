#!/usr/bin/env nextflow


workflow {
    // This create a channel emitting all .fasta files in the samples directory
    // Documentation: https://www.nextflow.io/docs/latest/reference/channel.html#frompath
    READS_ch = channel.fromPath( 'samples/*.fasta' )



    // Work needs to be done here!
    // ...

    // You should create two processes, named as "countContigs" and "countTotalLength" respectively
    // Relevant documentation: https://www.nextflow.io/docs/latest/process.html
    
    // The output of each process should be a tuple of "(file name, output value)"
    // Relevant documentation: https://www.nextflow.io/docs/latest/process.html#output-tuples-tuple

    // The output should be named as "output"
    // Relevant documentation: https://www.nextflow.io/docs/latest/process.html#naming-outputs

    // You can refer to bash_script_pipeline.sh for the Bash script, or write your own script!

    // ...



    // This part will take the named outputs of countContigs and countTotalLength and save them into a .csv
    countContigs.out.output
        .join(countTotalLength.out.output)
        .collectFile(keepHeader: true, skip: 1, sort: true, storeDir: "$launchDir") {
            fasta, contig_count, total_length ->
            ["summary.csv", "Sample,Contig Count,Total Length\n${fasta},${contig_count},${total_length}\n"]
        }
}

// Add your processes here!
// ...
