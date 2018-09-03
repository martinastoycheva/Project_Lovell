library(seqinr)


#This expression can be a boolean and if true add to the list of desired sequences
all_pax6_fasta[grep("p63", ignore.case = TRUE, value = TRUE, names(all_pax6_fasta))]

names(all_pax6_fasta)
try <- names(all_pax6_fasta)[which(ortholog_names==names(all_pax6_fasta))]
