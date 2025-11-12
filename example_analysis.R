# example_analysis.R
source("protein_toolkit.R")

# Example: use a protein sequence
seq <- "MKWVTFISLLFLFSSAYSRGVFRRDTHKSEIAHRFKDLGE"
print("Amino acid composition:")
print(aa_composition(seq))

print(paste("Molecular weight:", round(mw_aa(seq), 2), "Da"))
print(paste("Estimated pI:", round(pI_estimate(seq), 2)))

# run that in r studio

source("example_analysis.R")
