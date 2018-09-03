library(seqinr)
library(stringr)


omaBROWSE_seq <- read.fasta("nr2e3_vertebrates_omaBrowser_fasta.txt", seqtype = "AA", as.string = T)
omaBROWSE_species <- read.csv("nr2e3_vertebrates_omaBrowser.csv")


save_names <- names(omaBROWSE_seq)

#Changes names for coulumn 3 species names
names(omaBROWSE_seq) <- omaBROWSE_species[,3]

#Replaces empty spaces with underscore in the name
names(omaBROWSE_seq) <- str_replace_all(names(omaBROWSE_seq),"[[:punct:]]|\\s+","_")

#makes names unique 
names(omaBROWSE_seq) <- make.unique(names(omaBROWSE_seq), sep = "_")

write.fasta(omaBROWSE_seq, names(omaBROWSE_seq), file = "nr2e3_vertebrates_omaBrowse_named")
