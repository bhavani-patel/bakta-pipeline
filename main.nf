workflow {

    fasta_ch = Channel
        .fromPath(params.input_fasta)
        .map { path -> tuple([id: path.getBaseName()], path) }

    call_bakta(fasta_ch, params.bakta_db)
}


workflow call_bakta {
    take:
    fasta_ch
    dbpath

    main:
    bakta(fasta_ch, dbpath)

    emit:
    bakta
}
