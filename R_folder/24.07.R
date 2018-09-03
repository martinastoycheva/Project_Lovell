gNOMAD_mutations <- read.csv("/Users/martinastoycheva/Desktop/cacna1f/cacna1f_gnomad", header = T)
gNOMAD_mutations$Protein.Consequence <- as.character(gNOMAD_mutations$Protein.Consequence)
protein_mut <- unlist(gNOMAD_mutations$Protein.Consequence)  
  
idx_null <- which(match(protein_mut,"")==1)
ind_missense_only <- which(gNOMAD_mutations$Annotation!="missense")

gNOMAD_mutations <- gNOMAD_mutations[-idx_null,]
gNOMAD_mutations <- gNOMAD_mutations[-ind_missense_only,]

cleaned <- {}
for (i in gNOMAD_mutations$Protein.Consequence){
    g <- substring(i,3)
    #print(g)
    cleaned <- append(cleaned,g)
}

gNOMAD_mutations$Protein.Consequence <- cleaned


write.csv(gNOMAD_mutations, "otx2_gnomad_firstformatting.csv")
#Remove first column from the written file (i.e wromg numbering)

