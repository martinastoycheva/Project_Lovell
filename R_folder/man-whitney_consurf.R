library(readxl)
library( "stringr" )

#CHANGE FILE PATHS !!!
consurf_scores <- read.csv("/Users/martinastoycheva/Desktop/consurf\ results/crx_all.csv")
gnomad <- read.csv( "/Users/martinastoycheva/Desktop/gnomad_hgmd\ /crx_gnomad.csv")
hgmd <- read_excel("/Users/martinastoycheva/Desktop/gnomad_hgmd\ /crx_hgmd.xlsx")

missense_index <- grep("missense", gnomad$Annotation)
mutation_gnomad <- gnomad$Consequence[missense_index]
mutation_gnomad <- str_extract(mutation_gnomad, "[0-9]+" ) 
mutation_gnomad <- as.numeric(mutation_gnomad)
mutation_hgmd <- str_extract(hgmd$mutation, "[0-9]+" )
mutation_hgmd <- as.numeric(mutation_hgmd)

g <- consurf_scores$ConSurf.Grade
g <- as.character(g)
g <- gsub("[*].*$","",g)
g <- as.numeric(g)
scoresForhgmdConSurf <- g[mutation_hgmd]
scoresForgnomadConSurf <- g[mutation_gnomad]


wilcox.test(scoresForhgmdConSurf,scoresForgnomadConSurf)
