# protein_toolkit.R
# Simple Protein Analysis Toolkit in R

# Install missing packages if needed
if (!requireNamespace("Biostrings", quietly = TRUE)) {
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install("Biostrings")
}
if (!requireNamespace("seqinr", quietly = TRUE))
  install.packages("seqinr")

library(Biostrings)
library(seqinr)

# Read protein FASTA
read_fasta <- function(file) {
  seqs <- Biostrings::readAAStringSet(file)
  return(as.character(seqs))
}

# Amino acid composition
aa_composition <- function(seq) {
  aa <- strsplit(seq, "")[[1]]
  tbl <- table(aa)
  prop <- 100 * tbl / sum(tbl)
  return(round(prop, 2))
}

# Molecular weight
mw_aa <- function(seq) {
  aa_vec <- seqinr::s2c(seq)
  mw <- sum(seqinr::aa2mass(aa_vec), na.rm = TRUE) - 18.015
  return(mw)
}

# Isoelectric point
pI_estimate <- function(seq) seqinr::computePI(seq)

