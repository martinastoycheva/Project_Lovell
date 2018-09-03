library(seqinr)
library(stringr)

orthologs_ensembl <- read.fasta("/Users/martinastoycheva/Desktop/crx_new/Human_CRX_orthologues_cdna_ensembl.fa.txt", seqtype = "DNA", forceDNAtolower = F, as.string = T)
names_seq <- names(orthologs_ensembl)

ensembl_stableIDs <- read.csv("/Users/martinastoycheva/Desktop/R_folder/ensembl_stableIDs_new.csv", header = F, sep = ",")
ensembl_stableIDs[,1] <- as.character(ensembl_stableIDs[,1])
ensembl_stableIDs[,2] <- as.character(ensembl_stableIDs[,2])
h <- "Caenorhabditis elegans (Roundworm)"
d <- "C18B12.3"
ensembl_stableIDs <- rbind(ensembl_stableIDs, c(d,h))

h <- "Caenorhabditis elegans (Roundworm)"
d <- "C37E2.5a.2"
ensembl_stableIDs <- rbind(ensembl_stableIDs, c(d,h))

h <- "Caenorhabditis elegans (Roundworm)"
d <- "Y113G7A.6a"
ensembl_stableIDs <- rbind(ensembl_stableIDs, c(d,h))

h <- "Saccharomyces cerevisiae (Bread yeast)"
d <- "YGR217W"
ensembl_stableIDs <- rbind(ensembl_stableIDs, c(d,h))

len_ids <- length(ensembl_stableIDs[,1])
 # View(ensembl_stableIDs)
 # View(orthologs_ensembl)
 # View(indexes)


#the indexes list will contain 1 to 113 as many as the names and codes are in the ensembl_stableIDs
#in the same order. To each entry (1-113) a index from the fasta file names coresponds or an empty space if no match was found
indexes <- vector("list", len_ids)
for (i in 1:len_ids){
  indexes[[i]]<- grep(ensembl_stableIDs[i,1], names_seq)
  #print(indexes)
} 

codes_final <- {}
names_final <- {}

f <- 0

for (i in 1:len_ids){
  #g is every name of species from the ensembl table from 1 to 113
  g <- ensembl_stableIDs[i,2]
  #print(g)
  #d is the position in the sequence file (orthologs_ensembl)
  d <- indexes[[i]]
  #print(d)
  #j is the code exttracted from the sequnce file using d
  j <- names_seq[d]
  #print(j)
 #This are loops to print all the matches  
  if(length(d)!=0){
    if (length(d)==2){
      f <- f+2
      #print(j[1])
      #print(j[2])
      #print(g)
      codes_final <- append(codes_final, j[1])
      codes_final <- append(codes_final, j[2])
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
       #It will not work IF MATCHES ARE MORE THAN TWO 
    }
    else if (length(d)==1){
    #print(j)
    #print(g)
    codes_final <- append(codes_final, j)
    names_final <- append(names_final, g)
       f <- f+1
    }  
    else if (length(d)==3){
      f <- f+3
      #print(j[1])
      #print(j[2])
      #print(g)
      codes_final <- append(codes_final, j[1])
      codes_final <- append(codes_final, j[2])
      codes_final <- append(codes_final, j[3])
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      #It will not work IF MATCHES ARE MORE THAN TWO 
    }
    else if (length(d)==4){
      f <- f+4
      #print(j[1])
      #print(j[2])
      #print(g)
      codes_final <- append(codes_final, j[1])
      codes_final <- append(codes_final, j[2])
      codes_final <- append(codes_final, j[3])
      codes_final <- append(codes_final, j[4])
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      #It will not work IF MATCHES ARE MORE THAN TWO 
    }
    else if (length(d)==7){
      f <- f+7
      #print(j[1])
      #print(j[2])
      #print(g)
      codes_final <- append(codes_final, j[1])
      codes_final <- append(codes_final, j[2])
      codes_final <- append(codes_final, j[3])
      codes_final <- append(codes_final, j[4])
      codes_final <- append(codes_final, j[5])
      codes_final <- append(codes_final, j[6])
      codes_final <- append(codes_final, j[7])
      
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      names_final <- append(names_final, g)
      #It will not work IF MATCHES ARE MORE THAN TWO 
    }
}
}

f
#They are 80 because of C1.. (C.elegans) doesn't have a 
#match in the stabe ids and has to be added manually

#Add missing values MANUALLY!!!
#     h <- "Caenorhabditis elegans (Roundworm)"
#     d <- "C18B12.3"
# names_final <- append(names_final, h)
# codes_final <- append(codes_final, d)

names_df <- data.frame(names_final, codes_final)

#Loop to order the names as in the fasta file
indexes_final <- {}

for (e in names_seq){
  indexes_final[e] <- match(e,names_df[,2])
}  


ordered_names <- names_df[indexes_final,] #CHECK HERE!!!!





names_final <- ordered_names$names_final
names(orthologs_ensembl) <- names_final

#Replaces empty spaces with underscore in the name
names(orthologs_ensembl) <- str_replace_all(names(orthologs_ensembl),"[[:punct:]]|\\s+","_")

#makes names unique 
names(orthologs_ensembl) <- make.unique(names(orthologs_ensembl), sep = "_")

write.fasta(orthologs_ensembl, names(orthologs_ensembl), file = "crx_cdna_ensembl_named") #CHANGE NAME

