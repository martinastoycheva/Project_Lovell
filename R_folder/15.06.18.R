library(Biostrings)
#browseVignettes("Biostrings")

#Read fasta file from uniprot and convert it to a dataframe with named rows
all_pax6_fasta <- readAAStringSet("/Users/martinastoycheva/Desktop/Pax6/uniprot-pax6.fasta")
all_pax6_fasta <- as.data.frame(all_pax6_fasta)

#Read the ensemble csvand extract column one with names
orthologs <- read.csv("/Users/martinastoycheva/Desktop/Pax6/orthologues-ComparaOrthologs-Homo_sapiens_Gene_Compara_Ortholog_ENSG00000007372.csv")
ortholog_names <- orthologs[,1]


#Extract only the rows that hav names matching the orthlog_nsmes list

matching_rows <- all_pax6_fasta[which(ortholog_names==row.names.data.frame(all_pax6_fasta)),]

#for (i in ortholog_names){
  sons <- all_pax6_fasta[grep("monkey", ignore.case = TRUE, value = TRUE, row.names(all_pax6_fasta))]
#}



sons <- all_pax6_fasta[grepl("monkey" , ignore.case = TRUE, row.names(all_pax6_fasta)),]



xml_try_names <- read.csv("/Users/martinastoycheva/Downloads/Human_Pax6_orthologues.xml-2.txt")


all_pax6_fasta <- readAAStringSet("/Users/martinastoycheva/Desktop/Pax6/Human_PAX6_orthologues_sauropsida_fish.fa.txt")


write.table(a, file = "names_pax6_sauropsida_fish")
a <- as.array(names(all_pax6_fasta))




result <- lapply(ortholog_names, grepl)

sons <- lapply(ortholog_names, function(x) grepl(x , ignore.case = TRUE, row.names(all_pax6_fasta)))




all_pax6_fasta[grepl( "Candidatus" , row.names(all_pax6_fasta)),]
