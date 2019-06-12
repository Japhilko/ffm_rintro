# Jan-Philipp Kolb
# Thu Jun 06 11:28:42 2019


# set paths ---------------------------------------------------------------



git_path <- "D:/Daten/GitHub/ffm_rintro/"
data_path <- paste0(git_path,"data/")


# Quelle: http://offenedaten.frankfurt.de/dataset/landtagswahl-hessen-2018/resource/98812021-fc2a-446b-88c0-67e5180af948

wahldat <- read.csv2("http://offenedaten.frankfurt.de/dataset/806813a2-8884-46ee-b1c9-4d4f9ff4eee9/resource/98812021-fc2a-446b-88c0-67e5180af948/download/zprojekteopen-datadatenamt-12landtagswahl-2018ergebnisseergebnisselw2018landesstimmen_stadtteile.csv")

head(wahldat)
View(wahldat)

write.csv2(wahldat,file=paste0(data_path,"wahldat_ffm.csv"))

           
############################
# Wohnumfeld - öffentlicher Raum 2011

# http://offenedaten.frankfurt.de/dataset/bauen-wohnen/resource/a4ecd696-45f0-4f4a-90c3-bb788beca8e5


data.path <- "J:/Work/GESISPanel/04_persoenliche_ordner/kolb/Workshops/rintro19_ffm/data/"
git_path <- "D:/github/ffm_rintro/"
data_path <- paste0(git_path,"data/")

# datb <- readxl::read_xls(paste0(data.path,"bauenwohnen2011.xls"))
datb <- read.csv2(paste0(data.path,"bauenwohnen2011.csv"))
datb <- read.csv2(paste0(data_path,"bauenwohnen.csv"))
  
colnames(datb)

datb <- datb[-which(datb$Stadtteil=="Frankfurt am Main"),]
datb <- data.frame(datb)
dat <- data.frame(Stadtteil=datb[,2])

dat$bautaet <- datb[,125]
dat$Spielplaetze_100k <- datb[,16]

dat$Spiel100K <- cut(datb[,16],3)
levels(dat$Spiel100K) <- c("wenig","mittel","viele")

dat$baugenehm12 <- cut(datb[,78],5)
levels(dat$baugenehm12) <- c("sehr wenig","wenig","mittel","viele","sehr viele")

dat$wohnungsbestand <- datb[,18]


dat$wohnraumversorgung_k <- cut(datb[,56],3)
levels(dat$wohnraumversorgung_k) <- c("wenig","mittel","viele")

# dat$wohnraumversorgung_k <- datb$Wohnraumversorgung.Anzahl.der.Einwohnerinnen.und.Einwohner.je.Wohnung.2011


dat <- dat[dat$Stadtteil!="Frankfurt am Main",]


################
# Daten anschauen

colnames(datb)[16]
colnames(datb)[78]

erg <- vector()

for (i in 1:ncol(datb)){
  erg[i] <- sum(is.na(datb[,i]))
}

# Clusteranalyse
nan <- which(erg==0)
nan <- nan[-1]
clust <- kmeans(datb[,c(9,10,11,12,13,14:25)],4)

dat$clust <- clust$cluster

################
# txt Datensatz erzeugen

datt <- data.frame(datb$Stadtteil)
dat_sn <- datt
colnames(dat_sn) <- "Stadtteil"

datt$Stadtteil=as.character(datt$Stadtteil)

list_gc <- list()

#install.packages("tmaptools")
library(tmaptools)
for (i in 1:length(datb$Stadtteil)){
  list_gc[[i]] <- tmaptools::geocode_OSM(datt$Stadtteil[i])  
}


save(list_gc,file=paste0(data_path,"/list_gc.RData"))

datt_gc <- cbind(datt,do.call(rbind,lapply(list_gc,function(x)x$coords)))

write.table(datt_gc,file=paste0(data_path,"/datt_gc_ffm.txt"))


################
# Daten speichern

dat <- data.frame(dat)
dat$Stadtteil <- as.character(dat$Stadtteil)

write.csv2(dat,file=paste0(git_path,"/data/bauenwohnen_teil.csv"))

save(dat,file=paste0(git_path,"/data/bauenwohnen_teil.RData"))

save(dat_sn,file=paste0(git_path,"/data/dat_sn.RData"))

#####################
# XML 


# install.packages("flatxml")



# devtools_install.packages("xmltools")
# install.packages("XML")

#library("xmltools")

# https://stackoverflow.com/questions/33446888/r-convert-xml-data-to-data-frame

dat <- xmlParse("http://offenedaten.frankfurt.de/dataset/912fe0ab-8976-4837-b591-57dbf163d6e5/resource/48378186-5732-41f3-9823-9d1938f2695e/download/parkdaten_dyn.xml")


# https://r4ds.had.co.nz/data-import.html


##############################
# Gesis Panel Daten vorbereiten

# (load("D:/gitlab/r_intro_gp18/data/ZA5666_v1-0-0_small.RData"))
(load("D:/gitlab/IntroDataAnalysis/data/ZA5666_v1-0-0_medium_fac.RData"))

dat <- datf[,c("a11d056z","a11d094a","bczd001a","a11c019a","bdao067a","a11d096b","a11c020a")]

dats <- dat[sample(1:nrow(dat),1000,replace=T),]

save(dats,file="../data/gp_small.RData")

#####################

library(Rcmdr)

library(xlsx)
?write.xlsx

##########################

data(iris)

iris2 <- data.frame(iris)

?iris

write.xlsx2()
