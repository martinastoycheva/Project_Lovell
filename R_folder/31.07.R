#Use import dataset ---> for text
#remove first row
library(readxl)
#otx2.consurf.allensembl <- otx2.consurf.allensembl[-1,] #do 2 times??
#g <- otx2.consurf.allensembl$V5
#otx2.primates.consurf <- otx2.primates.consurf[-1,]
g <- otx2.primates.consurf$V5
#otx2.consurf.rodents <- otx2.consurf.rodents[-1,]
#g <- otx2.consurf.rodents$V5

otx2_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/OTX2/otx2_hgmd_ensembl_all.xlsx")
otx2_gnomad <- read_excel("/Users/martinastoycheva/Desktop/Results/OTX2/otx2_gnomad_ensembl_all.xlsx")

mutation_hgmd <- otx2_hgmd$Mutation
mutation_gnomad <- otx2_gnomad$Mutation


g <- as.character(g)
g <- gsub("[*].*$","",g)
g <- as.numeric(g)
scoresForhgmdConSurf <- g[mutation_hgmd]
scoresForgnomadConSurf <- g[mutation_gnomad]

#scoresForhgmdConSurf <- append(scoresForhgmdConSurf,8)
length(scoresForhgmdConSurf)
length(scoresForgnomadConSurf)

#CHECK HOW MANY ASTERIX
j <- otx2.primates.consurf$V5
j <- as.character(j)
j <- gsub("[*].*$","0",j)
j <- as.numeric(j)
scoresForhgmdConSurfo <- j[pax6_mutation_hgmd]
scoresForgnomadConSurfo <- j[pax6_mutation_gnomad]

length(which(scoresForhgmdConSurfo>=10))
length(which(scoresForgnomadConSurfo>=10))

hist(scoresForgnomadConSurf, plot = T,main = "Otx2-Rodents", xlab = "Score ConSurf", xlim = c(0,10), border = T, col = "red",breaks = 10, density = 7, ylim = c(0,1), freq = F)
hist(scoresForhgmdConSurf, plot = T, main = "Otx2", xlab = "Score ConSurf",col = "blue", breaks = 10, add = T, border = T, density = 7, angle = 145, freq = F)
legend("topleft", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10, box.lty = 0)


#Make a list 1 to 9 and see whether the value is 0 or 1 
vector_gnomad <- {}
for (i in 1:9){
  vector_gnomad[i] <- b
}


table_plot1 <- table(scoresForgnomadConSurf)
c9_gnomad <- table_plot1[[2]]/length(scoresForgnomadConSurf)*100
c1_gnomad <- table_plot1[[1]]/length(scoresForgnomadConSurf)*100

table_plot2 <- table(scoresForhgmdConSurf)
c9_hgmd <- table_plot2[[1]]/length(scoresForhgmdConSurf)*100
c1_hgmd <- table_plot2[[1]]/length(scoresForhgmdConSurf)*100
# barplot(table_plot)
#barplot(scoresForhgmdConSurf, names.arg=1:10, main="Heights of Golden State Warriors", las = 1)

library(plotly)

x <- c(1:9)
y1 <- c(c1_gnomad, 0, 0, 0, 0, 0, 0, 0, c9_gnomad)
y2 <- c(0, 0, 0, 0, 0, 0, 0, 0, c9_hgmd)
data <- data.frame(x, y1, y2)
p <- plot_ly(
  data, x = ~x, y = ~y1,
  name = "gnomAD",
  type = "bar", marker = list(color = 'rgb(49,130,189)')) %>%
  add_trace(y = ~y2, name = 'HGMD', marker = list(color = 'rgb(204,204,204)')) %>%
  layout(xaxis = list(1:9),
         yaxis = list(title = ""),
         margin = list(b = 100),
         barmode = 'group'
)

# p <- plot_ly(
#   x = c(1:9),
#   y = vector_gnomad,
#   name = "OTX",
#   type = "bar"
# )


#TO use barplot you need to make a summary table of the counts i.e 1 = 3; 2=0, etc.

hgmd_shallaw_score <- otx2_hgmd_ensembl_all$HGMD_score
gnomad_shallaw_score <- otx2_gnomad_ensembl_all$gNOMAD_score

hist(gnomad_shallaw_score, plot = T, breaks = 10,main = "Otx2", xlab = "Score BLOSSOM92", xlim = c(0,10), border = T, col = "red", density = 5, ylim = c(0,80))
hist(hgmd_shallaw_score, plot = T, breaks = 10, main = "Otx2", xlab = "Score BLOSSOM92", xlim = c(0,10),col = "blue", add = T, border = T, density = 5, angle = 145)
legend("topright", c("gnomAD", "HGMD"), col=c("red", "blue"), lwd=10)
