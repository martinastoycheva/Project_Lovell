
#Use import dataset on the right from r studio---> for text
#remove first row
library(readxl)

nrl_gnomad <- read_excel("/Users/martinastoycheva/Desktop/Results/NRL/nrl_gnomad_modified.xlsx")
nrl_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/NRL/nrl_hgmd_modified.xlsx")


#IMPORT
#nrl.consurf.all<- nrl.consurf.all[-1,] #do 2 times??
#g <- nrl.consurf.all$V5 #put import

nrl.consurf.rodents <- nrl.consurf.rodents[-1,]
g <- nrl.consurf.rodents$V5

#nrl.consurf.primatesonly <- nrl.consurf.primatesonly[-1,]
g <- nrl.consurf.primatesonly$V5

mutation_hgmd <- nrl_hgmd$Mutation
mutation_gnomad <- nrl_gnomad$Mutation


g <- as.character(g)
g <- gsub("[*].*$","",g)
g <- as.numeric(g)
scoresForhgmdConSurf <- g[mutation_hgmd]
scoresForgnomadConSurf <- g[mutation_gnomad]

length(scoresForhgmdConSurf)
length(scoresForgnomadConSurf)

hist(scoresForgnomadConSurf, plot = T, breaks = 10, main = "NRL-Rodents", xlab = "Score ConSurf", xlim = c(0,10), border = T, col = "red", density = 5, ylim = c(0,1), freq = F)
hist(scoresForhgmdConSurf, plot = T, breaks = 10, xlim = c(0,10),col = "blue", add = T, border = T, density = 5, angle = 145, freq = F)
legend("topleft", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10, box.lty = 0)

hgmd_shallaw_score <- nrl_hgmd$HGMD_score
gnomad_shallaw_score <- nrl_gnomad$gNOMAD_score

hist(gnomad_shallaw_score, plot = T, breaks = 10,main = "crx", xlab = "Score BLOSSOM92", xlim = c(0,10), border = T, col = "red", density = 5, ylim = c(0,80))
hist(hgmd_shallaw_score, plot = T, breaks = 10, main = "crx", xlab = "Score BLOSSOM92", xlim = c(0,10),col = "blue", add = T, border = T, density = 5, angle = 145)
legend("topright", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10)
