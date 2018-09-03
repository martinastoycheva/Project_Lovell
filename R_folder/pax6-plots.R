#library(tidyr)
library(readxl)
library( "stringr" )

consurf_scores <- read.csv("/Users/martinastoycheva/Desktop/consurf\ results/pax6_all.csv")

#pax6_mutation_hgmd <- pax6_hgmd_modified_ensembl_protein$Mutation

pax6_gnomad <- read.csv( "/Users/martinastoycheva/Desktop/gnomad_hgmd\ /pax6_gnomad.csv")
pax6_hgmd <- read_excel("/Users/martinastoycheva/Desktop/gnomad_hgmd\ /pax6_hgmd.xlsx")

pax6_mutation_gnomad <- str_extract(pax6_gnomad$Consequence, "[0-9]+" ) 
pax6_mutation_gnomad <- as.numeric(pax6_mutation_gnomad)

pax6_mutation_hgmd <- pax6_hgmd$mutation
#pax6_mutation_gnomad <- pax6_gnomad$mutation
g <- consurf_scores$ConSurf.Grade

g <- as.character(g)
g <- gsub("[*].*$","",g)
g <- as.numeric(g)
scoresForhgmdConSurf <- g[pax6_mutation_hgmd]
scoresForgnomadConSurf <- g[pax6_mutation_gnomad]

length(scoresForhgmdConSurf)
length(scoresForgnomadConSurf)

#CHECK HOW MANY ASTERIX
#j <- pax6.enseblprot.consurf$V6
#j <- primate_only.consurf.pax6$V6
j <- pax6.consurf.rodentsonly$V5
j <- as.character(j)
j <- gsub("[*].*$","0",j)
j <- as.numeric(j)
scoresForhgmdConSurfo <- j[pax6_mutation_hgmd]
scoresForgnomadConSurfo <- j[pax6_mutation_gnomad]

length(which(scoresForhgmdConSurfo>=10))
length(which(scoresForgnomadConSurfo>=10))

# d <- pax6.enseblprot.consurf$V4
# d <-as.numeric(levels(d))[d]
# scoresForhgmdConSurf <- d[pax6_mutation_hgmd]
# scoresForgnomadConSurf <- d[pax6_mutation_gnomad]
# hist(scoresForhgmdConSurf)
# hist(scoresForgnomadConSurf)
# mean(scoresForgnomadConSurf)
# mean(scoresForhgmdConSurf)
# 
# #pax6.enseblprot.consurf <- separate(pax6.enseblprot.consurf$V10, into= c("first_num", "second_num"), sep=",")
# second_num <- as.numeric(pax6.enseblprot.consurf$second_num)
# fisr_num <- as.numeric(pax6.enseblprot.consurf$fisr_num)
# scoresForgnomadConSurf <- second_num[pax6_mutation_gnomad]
# scoresForhgmdConSurf <- second_num[pax6_mutation_hgmd]
# scoresForgnomadConSurf <- fisr_num[pax6_mutation_gnomad]
# scoresForhgmdConSurf <- fisr_num[pax6_mutation_hgmd]

hist(scoresForgnomadConSurf, plot = T, breaks = 10,main = "Pax6-Primates", xlab = "Score ConSurf", xlim = c(0,10), border = T, col = "red", density = 7, ylim = c(0,1), freq = F)
hist(scoresForhgmdConSurf, plot = T, breaks = 10, xlab = "Score ConSurf", xlim = c(0,10),col = "blue", add = T, border = T, density = 7, angle = 145, freq = F)
legend("topleft", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10, box.lty = 0)



hist(pax6_gnomad_scoresShallaw, plot = T, breaks = c(1:9),main = "Pax6", xlab = "Score BLOSSUM92", xlim = c(0,10), border = T, density = 0, ylim = c(0,60))
hist(pax6_hgmd_scoresShallaw, plot = T, breaks = c(1:9), main = "Pax6", xlab = "Score BLOSSUM92", xlim = c(0,10),col = 4.5, add = T, border = T, density = 0)
legend("topright", c("gNOMAD", "HGMD"), col=c("black", "blue"), lwd=10)

compare <- data.frame(scoresForgnomadConSurf,pax6_gnomad_scoresShallaw,pax6_mutation_gnomad)


