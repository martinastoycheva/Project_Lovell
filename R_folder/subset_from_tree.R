library(seqinr)

names_list <- read.csv("/Users/martinastoycheva/Desktop/Results/NRL/nrl-names-rodents.csv", header = F, stringsAsFactors = F)
sequences <- read.fasta("/Users/martinastoycheva/Desktop/NRL/nrl_protein_ensembl_named", seqtype = "AA", forceDNAtolower = F, as.string = T)

#mode(names_list$names_primates)


#CHNAGE COLUMN NAME!!!
b <- {}
my_names <- {}
for (i in names_list$V1){
  my_names <- grep(i, names(sequences), ignore.case = F)
  b <- append(b,my_names)
}

#CHECK THAT THEY ARE THE SAME LENGTH !!!
length(names_list$V1)
length(b)


wanted_seqs <- sequences[b]

fix_wanted_seqs <- unique(names(wanted_seqs))
wanted_seqs <- unique(wanted_seqs)
#names(wanted_seqs)
length(wanted_seqs)


#setwd("~/Desktop/Results/NRL")
write.fasta(wanted_seqs, names = fix_wanted_seqs, file = "nrl_protein_ensembl_rodents_only") #CHANGE NAME
#Add humn seq

