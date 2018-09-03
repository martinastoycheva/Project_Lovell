library(seqinr)
library(stringr)

orthoDB_pax6_species <- read.table("pax6_vertebrates_no-mammals(hum+mouse)_tab.txt", sep = "\t", header = T)
orthoDB_pax6_seq <- read.fasta("pax6_vertebrates_no-mammals(mouse+hum)_fasta.txt", seqtype = "AA", as.string = T)
#orthoDB_pax6_seq <- readAAStringSet("/Users/martinastoycheva/Desktop/sequences-orthodb-pax6.fa.txt")

save_names <- names(orthoDB_pax6_seq)

names(orthoDB_pax6_seq) <- orthoDB_pax6_species$organism_name

names(orthoDB_pax6_seq) <- str_replace_all(names(orthoDB_pax6_seq),"[[:punct:]]|\\s+","_")

names(orthoDB_pax6_seq) <- make.unique(names(orthoDB_pax6_seq), sep = "_")

write.fasta(orthoDB_pax6_seq, names(orthoDB_pax6_seq), file = "vertebrates_no-mammals_otx2_named")


#test <- read.fasta("orthoDB_named_seq_PAX6_numbered_s.txt", seqtype = "AA", as.string = T)

