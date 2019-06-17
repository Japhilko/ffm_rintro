##################################################
## Project: Einführung in R
## Script purpose: 
## Date: Thu Jun 13 09:57:20 2019
## Place:
## Author:
##################################################

my_packages <- installed.packages()
mypack <- my_packages[,"Package"]

packlist <- c("ggplot2", "Rcpp","wiesbaden")

c(1,3,4) %in% c(3,1)
!(c(1,3,4) %in% c(3,1))

packlist %in% mypack
!(packlist %in% mypack)

new.packages <- packlist[!(packlist %in% mypack)]

##############################
# Shapefiles einlesen


# install.packages("rgdal")

setwd("D:/github/ffm_rintro/data")
shp_ffm <- rgdal::readOGR("Stadtteile_Frankfurt_am_Main.shp")

head(shp_ffm@data)

dat <- read.csv2("../data/bauenwohnen.csv")
ffm_shp@data$Einwohnerdichte <-
  dat$Wohnumfeld...öffentlicher.Raum.Einwohnerdichte.je.ha.2012

sp::spplot(ffm_shp,"Einwohnerdichte")

  # Alternative
library(sp)
spplot(ffm_shp,"Einwohnerdichte")

library(sp)
spplot(ffm_shp,"Einwohnerdichte",
       col.regions=blue2red(100))

spplot(ffm_shp,"Einwohnerdichte",
       col.regions=green2red(100))

dat$Stadtteil%in%c("Oberrad")

nas1 <- ffm_shp$STTLNAME[which(is.na(ind))][1]
agrep("Sachsenhausen",dat$Stadtteil,value=T)



data_path <- "D:/gitlab/IntroDataAnalysis/data/"
gpdat <- foreign::read.spss(paste0(data_path,"ZA5666_v1-0-0.sav"),
                            to.data.frame=TRUE)
att_dat <- attributes(gpdat)
names(att_dat)
att_dat$variable.labels
View(gpdat)

#############


# hier liegen die Daten
# http://offenedaten.frankfurt.de/dataset/landtagswahl-hessen-2018/resource/98812021-fc2a-446b-88c0-67e5180af948

# Richtiges Verzeichnis setzen
setwd("D:/github/ffm_rintro/data")
getwd()
# Import
dat <- read.csv2("wahldat_ffm.csv")

# Kategorien anlegen
wbkat <- cut(dat$Wahlbeteiligung,5)
wbkat
table(wbkat)

# tapply Funktion anwenden
tapply(dat$Anteil.AfD ,wbkat,mean)

tapply(dat$Stadtteilname,wbkat,function(x)x)

tapply(dat$Anteil.AfD ,wbkat,var)

hist(dat$Anteil.AfD)
hist(dat$Anteil.AfD,col=1)
hist(dat$Anteil.AfD,col=2)

# install.packages("colourpicker")

hist(dat$Anteil.AfD,col="royalblue")
hist(dat$Anteil.AfD,col=c("#68228B"))

# ?na.rm


install.packages("editData")

dat <- edit(dat)

################################
# Aufgabe Barplot

library(datasets)

data(VADeaths)
VADeaths

?barplot

barplot(VADeaths, beside = TRUE,col=1:5)

# barplot(VADeaths, beside = TRUE,col=1:6)

#####################################

dat$Stadtteil <- as.character(dat$Stadtteil)

dat$Verkehrsflaeche <- as.factor(dat$Wohnumfeld...öffentlicher.Raum.Anteil.der.Verkehrsfläche.in...2011)

dat$Verkehrsflaeche <- as.numeric(as.character(dat$Verkehrsflaeche))

ab <- as.factor(sample(1:4,100,replace=T))
levels(ab) <- 1:5

table(ab)

#############################

paste("ab","cd")
paste0("ab","cd")
paste("ab","cd",sep="_")
paste("ab","cd",sep="")

library(tmaptools)
(gc1 <- geocode_OSM("Frankfurt Altstadt",details = T))

dat$stadtteil_l <- paste("Frankfurt",dat$Stadtteil)

###########

let <- c("a","b","c")

for (i in 1:length(let)){
  var <- let[i]
  cat(var, i, "\n")
}

setwd("../data/")
dirn <- dir("../data/")
head(dirn)

rdat <- grep(".RData",dirn,value = T)
# grep("stadtteile",rdat,value=T)

  # bei ungefährem match agrep
?agrep

for (i in 1:length(rdat)){
  load(rdat[i])
  cat(rdat[i],"\n")
}


for (i in 1:length(rdat)){
  if(length(grep("stadteile",rdat[i]))>0){
    load(rdat[i])
    cat(rdat[i],"\n")
  }
}


erg <- list()

for (i in 1:ncol(dat)){
  erg[[i]] <- summary(dat[,i])
  cat(i, "\n")
}

code_miss <- function(var){
  var[var%in%c(-99,-88)] <- NA
  var[var%in%c("Item Nonresponse")] <- NA
  return(var)
}


code_miss <- function(var,...){
  var[var%in%c(-99,-88,"Item Nonresponse")] <- NA
  plot(var)
  return(var)
}

code_miss(x,main="")


code_miss <- function(var,main="Überschrift"){
  var[var%in%c(-99,-88,"Item Nonresponse")] <- NA
  plot(var)
  return(var)
}


#######
# Links

# Karten erzeugen
# https://www.uni-regensburg.de/wirtschaftswissenschaften/vwl-tschernig/medien/programmieren-mit-r/pir_tut_geomapping.r

# Genesis Webservices
# https://www-genesis.destatis.de/genesis/misc/GENESIS-Webservices_Einfuehrung.pdf

# Farbgestaltung
# https://www.rdocumentation.org/packages/grDevices/versions/3.6.0/topics/colorRamp

# Ausreißer Boxplot
# https://www.r-statistics.com/tag/boxplot-outlier/
# https://stackoverflow.com/questions/14207739/how-to-remove-outliers-in-boxplot-in-r
# https://community.rstudio.com/t/outliers-in-box-plots/27854

# API`s nutzen
# https://cran.r-project.org/web/packages/request/README.html`