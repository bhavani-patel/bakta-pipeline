process bakta {

    tag "${meta.id}"

    input:
    tuple val(meta), path(fasta)
    val dbpath

    output:
    tuple val(meta), path("*.gff3")
    tuple val(meta), path("*.gbk")
    tuple val(meta), path("*.faa")

    script:
    """
    bakta --db $dbpath --output bakta_out --prefix ${meta.id} $fasta
    mv bakta_out/${meta.id}.gff3 .
    mv bakta_out/${meta.id}.gbk .
    mv bakta_out/${meta.id}.faa .
    """
}
