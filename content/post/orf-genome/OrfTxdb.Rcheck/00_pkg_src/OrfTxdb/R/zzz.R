###
###

.pkgname <- "OrfTxdb"

.seqnames <- c("orfv")

.circ_seqs <- NULL

.mseqnames <- NULL

.onLoad <- function(libname, pkgname)
{
    if (pkgname != .pkgname)
        stop("package name (", pkgname, ") is not ",
             "the expected name (", .pkgname, ")")
    extdata_dirpath <- system.file("extdata", package=pkgname,
                                   lib.loc=libname, mustWork=TRUE)

    ## Make and export BSgenome object.
    bsgenome <- BSgenome(
        organism="Orfv",
        common_name="Orf virus",
        provider="NCBI",
        provider_version="1.0.0",
        release_date="Jan.2004",
        release_name="Orf virus strain OV-IA82",
        source_url="https://www.ncbi.nlm.nih.gov/nuccore/AY386263.1",
        seqnames=.seqnames,
        circ_seqs=.circ_seqs,
        mseqnames=.mseqnames,
        seqs_pkgname=pkgname,
        seqs_dirpath=extdata_dirpath
    )

    ns <- asNamespace(pkgname)

    objname <- pkgname
    assign(objname, bsgenome, envir=ns)
    namespaceExport(ns, objname)

    old_objname <- "Orfv virus"
    assign(old_objname, bsgenome, envir=ns)
    namespaceExport(ns, old_objname)
}

