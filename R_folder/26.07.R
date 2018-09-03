library(readxl)
pax6_gnomad <- read_excel( "/Users/martinastoycheva/Desktop/Results/PAX6/pax6_gnomad_modified.xlsx")
pax6_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/PAX6/pax6_hgmd_modified.xlsx")

nrl_gnomad <- read_excel("/Users/martinastoycheva/Desktop/Results/NRL/nrl_gnomad_modified.xlsx")
nrl_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/NRL/nrl_hgmd_modified.xlsx")

crx_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_hgmd_modified.xlsx")
crx_gnomad <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_gnomad_modified.xlsx")

otx2_hgmd <- read_excel("/Users/martinastoycheva/Desktop/Results/OTX2/otx2_hgmd_ensembl_all.xlsx")
otx2_gnomad <- read_excel("/Users/martinastoycheva/Desktop/Results/OTX2/otx2_gnomad_ensembl_all.xlsx")



hist(otx2_gnomad$gNOMAD_score, breaks = 10, main = "OTX2", xlab = "gNOMAD Score", ylim =c(0,100), xlim = c(1,10))
hist(otx2_hgmd$HGMD_score,breaks = 10, main = "OTX2", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))


hist(pax6_gnomad$gNOMAD_score, breaks = 10, main = "Pax6", xlab = "gNOMAD Score", ylim =c(0,100),xlim = c(1,10))
#hist(hgmd[6:92,15],breaks = 10, main = "Pax6", xlab = "HGMD Score", ylim =c(0,50),xlim = c(1,10))
hist(pax6_hgmd$HGMD_score,breaks = 10,main = "Pax6", xlab = "HGMD Score", ylim =c(0,100),xlim = c(1,10))


#hist(hgmd$HGMD_score, main = "NR2E3", xlab = "HGMD Score", ylim =c(0,40))


#length(hgmd[,15])
#hgmd[6:92,15]



hist(nrl_gnomad$gNOMAD_score, breaks = 10, main = "NRL", xlab = "gNOMAD Score", ylim =c(0,100), xlim = c(1,10))
hist(nrl_hgmd$HGMD_score,breaks = 10, main = "NRL", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))


hist(crx_gnomad$gNOMAD_score, breaks = 10, main = "CRX", xlab = "gNOMAD Score", ylim =c(0,100))
hist(crx_hgmd$HGMD_score,breaks = 10, main = "CRX", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))


#hist(gnomad$gNOMAD_score, breaks = 10, main = "NRL", xlab = "gNOMAD Score", ylim =c(0,50), xlim = c(1,10))
#hist(hgmd$HGMD_score,breaks = 10, main = "NRL", xlab = "HGMD Score", ylim =c(0,50), xlim = c(1,10))

#hist(gnomad$gNOMAD_score, breaks = 10, main = "NRL", xlab = "gNOMAD Score", ylim =c(0,50), xlim = c(1,10))
#hist(hgmd$HGMD_score,breaks = 10, main = "NRL", xlab = "HGMD Score", ylim =c(0,50), xlim = c(1,10))


#PAX6 modifications

pax6_gnomad_primate <- read_excel( "/Users/martinastoycheva/Desktop/Results/PAX6/pax6_primate_scoring_gnomad.xlsx")
pax6_hgmd_primate <- read_excel("/Users/martinastoycheva/Desktop/Results/PAX6/pax6_primate_scoring_hgmd.xlsx")


hist(pax6_gnomad_primate$gNOMAD_score, breaks = 10, main = "Pax6-Primate", xlab = "gNOMAD Score", ylim =c(0,100),xlim = c(1,10))
#hist(hgmd[6:92,15],breaks = 10, main = "Pax6", xlab = "HGMD Score", ylim =c(0,50),xlim = c(1,10))
hist(pax6_hgmd_primate$HGMD_score,breaks = 10,main = "Pax6-Primate", xlab = "HGMD Score", ylim =c(0,150),xlim = c(1,10))


pax6_gnomad_primate_mammal2nd <- read_excel( "/Users/martinastoycheva/Desktop/Results/PAX6/pax6_primate+2ndmammalcluster_scoring_gnomad.xlsx")
pax6_hgmd_primate_mammal2nd <- read_excel("/Users/martinastoycheva/Desktop/Results/PAX6/pax6_primate+2ndmammalcluster_scoring_hgmd.xlsx")


hist(pax6_gnomad_primate_mammal2nd$gNOMAD_score, breaks = 10, main = "Pax6-Primate+Mammal1", xlab = "gNOMAD Score", ylim =c(0,100),xlim = c(1,10))
#hist(hgmd[6:92,15],breaks = 10, main = "Pax6", xlab = "HGMD Score", ylim =c(0,50),xlim = c(1,10))
hist(pax6_hgmd_primate_mammal2nd$HGMD_score,breaks = 10,main = "Pax6-Primate+Mammal1", xlab = "HGMD Score", ylim =c(0,100),xlim = c(1,10))


#CRX modifications

crx_hgmd_primateNOwrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_hgmd_only_primates-NOwrongclade.xlsx")
crx_gnomad_primateNOwrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_gnomad_only_primates-NOwrongclade.xlsx")

hist(crx_gnomad_primateNOwrongclade$gNOMAD_score, breaks = 10, main = "CRX_primateNOwrongclade", xlab = "gNOMAD Score", ylim =c(0,100))
hist(crx_hgmd_primateNOwrongclade$HGMD_score,breaks = 10, main = "CRX_primateNOwrongclade", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))


crx_hgmd_primatePluswrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_hgmd_only_primates-pluswrongclade.xlsx")
crx_gnomad_primatePluswrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_gnomad_only_primates-pluswrongclade.xlsx")

hist(crx_gnomad_primatePluswrongclade$gNOMAD_score, breaks = 10, main = "CRX_primatePluswrongclade", xlab = "gNOMAD Score", ylim =c(0,100))
hist(crx_hgmd_primatePluswrongclade$HGMD_score,breaks = 10, main = "CRX_primatePluswrongclade", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))


crx_hgmd_primateNmiceNOwrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_hgmd_primatesnmice-NOwrongclade.xlsx")
crx_gnomad_primateNmiceNOwrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_gnomad_primatesnmice-NOwrongclade.xlsx")

hist(crx_gnomad_primateNmiceNOwrongclade$gNOMAD_score, breaks = 10, main = "CRX_primateNmiceNOwrongclade", xlab = "gNOMAD Score", ylim =c(0,100))
hist(crx_hgmd_primateNmiceNOwrongclade$HGMD_score,breaks = 10, main = "CRX_primateNmiceNOwrongclade", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))


crx_hgmd_primateNmicePluswrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_hgmd_primatesnmice-pluswrongclade.xlsx")
crx_gnomad_primateNmicePluswrongclade <- read_excel("/Users/martinastoycheva/Desktop/Results/CRX/crx_gnomad_primatesnmice-pluswrongclade.xlsx")

hist(crx_gnomad_primateNmicePluswrongclade$gNOMAD_score, breaks = 10, main = "CRX_primateNmicePluswrongclade", xlab = "gNOMAD Score", ylim =c(0,100))
hist(crx_hgmd_primateNmicePluswrongclade$HGMD_score,breaks = 10, main = "CRX_primateNmicePluswrongclade", xlab = "HGMD Score", ylim =c(0,100), xlim = c(1,10))




