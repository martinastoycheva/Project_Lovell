

names_final <- vector("list", f)
codes_final <- vector("list",81)
for (i in 1:113){
  
  #g is every name of species from the ensembl table from 1 to 113
  g <- ensembl_stableIDs[i,2]
  #print(g)
  
  #d is the position in the sequence file
  d <- indexes[[i]]
  #print(d)
  
  #j is the code exttracted from the sequnce file using d
  j <- names_seq[d]
  #print(j)
  
  
  
  if(length(d)!=0){
    
    if (length(d)==2){
      f <- f+2
      
      print(j[1])
      print(j[2])
      print(g)
      names_final[[o]] <- c(j[1],j[2])
      codes_final[[o]] <- 
        #I will not work IF MATCHES ARE MORE THAN TWO 
    }
    else if (length(d)==1){
      print(j)
      print(g)
      names_final[[o]] <- j
      f <- f+1
    }  
  }
}




# 
# for (i in 1:113){
# 
#   #g is every name of species from the ensembl table from 1 to 113
#   g <- ensembl_stableIDs[i,2]
#   #print(g)
# 
#   #d is the position in the sequence file
#   d <- indexes[[i]]
#   #print(d)
# 
#   #j is the code exttracted from the sequnce file using d
#   j <- names_seq[d]
#   #print(j)
# 
#   if(length(d)!=0){
#     for (o in 1:f){
#       if (length(d)==2){
#         print(j[1])
#         print(j[2])
#         print(g)
#         names_final[o] <- c(j[1],j[2])
#        
#         #I will not work IF MATCHES ARE MORE THAN TWO
#       }
#       else if (length(d)==1){
#         names_final[o] <- j
#         print(j)
#         print(g)
# 
#       }
#     }
#   }
# }
# 
#  
#  #You have to now add to empty list names final j and g in order and turn it into a table or something 
#  #It will be a for loop suscription but you have to figure out how to know the entry number
#  f
# s <- c(3,4)
# print(s[1])



ensembl_stableIDs <- cbind(ensembl_stableIDs, c(1:113))




first <- read.csv("/Users/martinastoycheva/Desktop/R_folder/ensembl_stableID.csv", header = T, sep = "\t")
second <- read.csv("/Users/martinastoycheva/Desktop/R_folder/ensembl_stableID.csv", header = T, sep = "\t")
View(first)

new_df <- data.frame(first$Prefix,second$Species.name)
View(new_df)
new_df <- cbind(new_df,c(1:113))
install.packages("ICC")
library(ICC)


