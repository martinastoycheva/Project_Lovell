library(readxl)

crx_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_hgmd_modified.xlsx")
crx_gnomad <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_gnomad_modified.xlsx")
mutation_hgmd <- crx_hgmd$Mutation
mutation_gnomad <- crx_gnomad$Mutation

#IMPORT & CLEAN
#crx.consurf.promates.only <- crx.consurf.promates.only[-1,] #do 2 times??
#crx.all.consurf <- crx.all.consurf[-1,]
#crx.consurf.rodents <- crx.consurf.rodents[-1,]
#g <- crx.consurf.rodents$V5
#g <- crx.all.consurf$V5 #put import
g <- crx.consurf.promates.only$V5


g <- as.character(g)
g <- gsub("[*].*$","",g)
g <- as.numeric(g)
scoresForhgmdConSurf <- g[mutation_hgmd]
scoresForgnomadConSurf <- g[mutation_gnomad]

length(scoresForhgmdConSurf)
length(scoresForgnomadConSurf)

#CHECK HOW MANY ASTERIX
#j <- crx.consurf.rodents$V5
j <- crx.consurf.promates.only$V5
j <- as.character(j)
j <- gsub("[*].*$","0",j)
j <- as.numeric(j)
scoresForhgmdConSurfo <- j[mutation_hgmd]
scoresForgnomadConSurfo <- j[mutation_gnomad]

length(which(scoresForhgmdConSurfo>=10))
length(which(scoresForgnomadConSurfo>=10))


hist(scoresForgnomadConSurf, plot = T, breaks = 10,main = "CRX-Rodents", xlab = "Score ConSurf", xlim = c(0,10), border = T, col = "red", density = 7, ylim = c(0,1), freq = F)
hist(scoresForhgmdConSurf, plot = T, breaks = 10, xlim = c(0,10),col = "blue", add = T, border = T, density = 7, angle = 145, freq = F)
legend("topleft", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10, box.lty = 0)

hgmd_shallaw_score <- crx_hgmd$HGMD_score
gnomad_shallaw_score <- crx_gnomad$gNOMAD_score

hist(gnomad_shallaw_score, plot = T, breaks = 10,main = "crx", xlab = "Score BLOSSOM92", xlim = c(0,10), border = T, col = "red", density = 5, ylim = c(0,80))
hist(hgmd_shallaw_score, plot = T, breaks = 10, main = "crx", xlab = "Score BLOSSOM92", xlim = c(0,10),col = "blue", add = T, border = T, density = 5, angle = 145)
legend("topright", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10)
