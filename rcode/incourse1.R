# Erstes Skript
# Jan-Philipp Kolb
# Wed Jun 12 10:49:02 2019

# Erster Teil -----


# Zweiter Teil ------------------------------------------------------------

date()
sessionInfo()

# Paketedate()

date() # dieser Befehl gibt mir das Datum

datum <- date()
  
sessionInfo()


bg <- c(1, 3 ,
        4)

b <- c(2)
#################

n <- 100
x <- runif(n) # x und y sind Vektoren
y <- rnorm(n)

x[1]
x[100]

length(x)

x[1:4]
x[4:1]


a <- letters
mean(a)

###################

b <- 1:5

mean(b)
var(b)
sd(b)^2
sqrt(mean(b))

## Alternative
meanb <- mean(b)
sqrt(meanb)


#######

a <- letters

ab <- data.frame(Spalte1=a,
                 Spalte2=x[1:26])

head(ab)
View(ab)


xy <- rbind(x[1:4],y[1:4])

mean(xy[1:2,2])

mean(xy[,2])

str(xy)

ab <- data.frame(a,x=x[1:26])

mean(ab[,2])

mean(ab[1,])

head(ab)

####
system.time(runif(100000000))

time1 <- Sys.time()
runif(10000000)
time2 <- Sys.time()

time2-time1

########################

?mean

x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

example(lm)

# install.packages("osmdata")

vignette("osmdata")

#########################

# install.packages("swirl")

library(swirl)
swirl()

swirl::swirl()

####################################
# Aufgabe Pakete suchen

# um Daten zu visualisieren

# install.packages("cairo")
# Tool zu visualisieren

install.packages("ggplot2")

library(ggplot2)
library(lattice)

# um Daten zu manipulieren

library(dplyr)
# install.packages("tidyverse")

# für die Modellierung (bspw. Regressionen)

?lm
?glm

# lme4
# MASS
# glmnet
# caret

# um Ergebnisse zu berichten (bspw. in einem pdf oder auf einer
  #                          Website)

# install.packages("rmarkdown")


#############################################

library(haven)

data_path <- "D:/github/IntroR/2019/data/"
setwd(data_path)
oecd <- read_dta("oecd.dta")

setwd("D:/github/ffm_rintro/data/")

########

?read.csv
dat <- read.csv("../data/ZA5666_v1-0-0.csv",sep=";")

library(foreign)
?read.spss

?foreign::read.spss

#########

library(rio)

dat1 <- import("../../2019/data/oecd.dta")

dat2 <- import("../../2019/data/oecd_um.csv")

str(dat2$V3)

dat2$V3 <- gsub(",",".",dat2$V3)
dat2$V3 <- as.numeric(dat2$V3)

############################
# 

setwd("D:/github/ffm_rintro/data")

getwd()
# import("")

dir()

####################
# 

save(oecd,dat,file="oecd.RData")
(load("oecd.RData"))

# save.image("Kurs_erster_Tag.RData")

install.packages("dataset.load")

#######################

ab <- c("kaum","wenig")

###########

rm(ab)

  # alle Objekte löschen:
rm(list=ls())

gc()

getwd()
save.image("Objekte_tag1.RData")

# history("rcode_erster_tag.R")

# dat <- read.xlsx()

head(iris)

iris <- data.frame(iris)

View(iris)
  # erste Zeilen ausgeben lassen
head(iris)

library(xlsx)

xlsx::write.xlsx2(iris,file="iris.xlsx")

# rio::export

dat <- read.csv2("wahldat_ffm.csv")

dat[dat$Stadtteilname=="Altstadt",]


dat$Anteil.CDU[1:10]
dat$Anteil.CDU[c(1,3,6)]

dat <- data.frame(dat)

head(dat$V.Partei3)

summary(dat)

dat[dat$Stadtteilname=="Altstadt",]

max(dat$Wahlbeteiligung)

which(dat$Wahlbeteiligung==76.3)

which.max(dat$Wahlbeteiligung)

dat[which.max(dat$Wahlbeteiligung),"Stadtteilname"]

dat[which.max(dat$Wahlbeteiligung),3]

# wo ist Wahlbeteiligung 60

wb_70 <- dat[dat$Wahlbeteiligung>70,3]

wb_70 <- dat[dat$Wahlbeteiligung>70,]
head(wb_70)

dat[dat$Anteil.DIE.LINKE>12 & dat$Anteil.GRÜNE>25,"Stadtteilname"]

dat3 <- data.frame(runif(5),runif(5))

colnames(dat3) <- c("x","y")

dat3 <- data.frame(x=runif(5),y=runif(5))


(ApplyDat <- cbind(1:4,runif(4),rnorm(4)))
mat <- as.matrix(apply(ApplyDat,1,mean))

mat

ApplyDat <- data.frame(ApplyDat)


ApplyDat$meanvalues <- apply(ApplyDat,1,mean)


