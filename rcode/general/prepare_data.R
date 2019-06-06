# Jan-Philipp Kolb
# Thu Jun 06 11:28:42 2019


git_path <- "D:/Daten/GitHub/ffm_rintro/"
data_path <- paste0(git_path,"data/")


# Quelle: http://offenedaten.frankfurt.de/dataset/landtagswahl-hessen-2018/resource/98812021-fc2a-446b-88c0-67e5180af948

wahldat <- read.csv2("http://offenedaten.frankfurt.de/dataset/806813a2-8884-46ee-b1c9-4d4f9ff4eee9/resource/98812021-fc2a-446b-88c0-67e5180af948/download/zprojekteopen-datadatenamt-12landtagswahl-2018ergebnisseergebnisselw2018landesstimmen_stadtteile.csv")

head(wahldat)

write.csv2(wahldat,file=paste0(data_path,"wahldat_ffm.csv"))

           
############################
# Wohnumfeld - öffentlicher Raum 2011

# http://offenedaten.frankfurt.de/dataset/bauen-wohnen/resource/a4ecd696-45f0-4f4a-90c3-bb788beca8e5


data.path <- "J:/Work/GESISPanel/04_persoenliche_ordner/kolb/Workshops/rintro19_ffm/data/"


# datb <- readxl::read_xls(paste0(data.path,"bauenwohnen2011.xls"))
datb <- read.csv2(paste0(data.path,"bauenwohnen2011.csv"))

colnames(datb)

dat <- datb[,"Stadtteil"]

dat$Spiel100K <- cut(datb[,16],3)
levels(dat$Spiel100K) <- c("wenig","mittel","viele")

dat$baugenehm12 <- cut(datb[,78],5)
levels(dat$baugenehm12) <- c("sehr wenig","wenig","mittel","viele","sehr viele")

write.csv2(dat,file=paste0(git_path,"/data/bauenwohnen_teil.csv"))

colnames(datb)[16]
colnames(datb)[78]

save(dat,file=paste0(git_path,"/data/bauenwohnen_teil.RData"))
