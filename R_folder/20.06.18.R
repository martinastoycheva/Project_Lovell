library(seqinr)

#library(Biostrings)

pax6_orthologs_ensembl <- read.fasta("/Users/martinastoycheva/Desktop/Pax6/Human_PAX6_orthologues_emsembl.fa.txt",seqtype = "AA", as.string = T)

#b <- as.data.frame(all_pax6_fasta)
#write.table(a, file = "names_pax6_sauropsida_fish")
#a <- as.array(names(all_pax6_fasta))

all_species_ensemblID <- read.table("/Users/martinastoycheva/Desktop/ensembl_names_speciesID.txt", sep ="\t")


for (i in all_species_ensemblID$V1){
my_names <- grepl(i, names(pax6_fasta_fish_sauropsida), ignore.case = T)
}


pax6_fasta_fish_sauropsida[[59]]

ENSRROP00000023764


q <- grepl(ENSRRO, all_species_ensemblID$V1, ignore.case = T)



#install.packages("devtools")
devtools::install_github("USCBiostats/rphyloxml")

library(ape)
library(rphyloxml)

>experience=exp
>cbind(salaries, experience)

fn <- system.file("phyloxml/amphibian_tree_of_life_Frost_DR_2006.xml", package="rphyloxml")
xmltree <- read_phyloxml(fn)

xmltree$`Amphibian Phylogeny, Frost DR, 2006`$node.meta[[715]]$taxonomy$scientific_name

fff <- read_phyloxml("/Users/martinastoycheva/Desktop/Pax6/Human_PAX6_paralogues.xml.txt")

orthoDB_pax6_species <- read.table("/Users/martinastoycheva/Desktop/orthodb-orthologs-pax6-tab.txt", sep = "\t", header = T)
orthoDB_pax6_seq <- read.fasta("/Users/martinastoycheva/Desktop/sequences-orthodb-pax6.fa.txt", seqtype = "AA", as.string = T)
#orthoDB_pax6_seq <- readAAStringSet("/Users/martinastoycheva/Desktop/sequences-orthodb-pax6.fa.txt")

save_names <- names(orthoDB_pax6_seq)

names(orthoDB_pax6_seq) <- orthoDB_pax6_species$organism_name
