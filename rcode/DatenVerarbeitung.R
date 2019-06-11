## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = T,message=F,warning = F,cache=T)
showSolution=F


## ----echo=F,eval=F-------------------------------------------------------
## library("readstata13")
## dat <- read.dta13("../data/ZA5666_v1-0-0_Stata14.dta")
## # dat <- dat[1:100,]
## save(dat,file="../data/ZA5666_v1-0-0_medium.RData")
## 
## datf <- read.dta13("../data/ZA5666_v1-0-0_Stata14.dta",
##                    convert.factors = F)
## 
## # datf <- datf[1:100,]
## save(datf,file="../data/ZA5666_v1-0-0_medium_fac.RData")


## ----echo=F,eval=F-------------------------------------------------------
## library(knitr)
## sched <- xlsx::read.xlsx2("../orga/schedule.xlsx",1)
## dats <- sched[9:15,c(1,4,5)]
## dats <- dats[-which(dats$Part=="Break"),]
## 
## kable(dats,row.names = F)


## ------------------------------------------------------------------------
dat <- read.csv2("../data/wahldat_ffm.csv")


## ------------------------------------------------------------------------
head(names(dat))


## ------------------------------------------------------------------------
nrow(dat) # Zeilen
ncol(dat) # Spalten


## ----eval=F--------------------------------------------------------------
## head(dat) # erste Zeilen
## tail(dat) # letzte Zeilen


## ------------------------------------------------------------------------
View(dat)


## ------------------------------------------------------------------------
dat[1,1] # das Element oben links bekommen


## ----eval=F--------------------------------------------------------------
## dat[2,] # nur die zweite Zeile sehen


## ----echo=F--------------------------------------------------------------
dat[2,1:4] # nur die zweite Zeile sehen


## ----eval=F--------------------------------------------------------------
## dat[,1] # sich nur die erste Spalte anzeigen lassen


## ----echo=F--------------------------------------------------------------
head(dat[,1]) # sich nur die erste Spalte anzeigen lassen 


## ----eval=F--------------------------------------------------------------
## dat[1:2,] # getting the first two rows


## ----echo=F--------------------------------------------------------------
head(dat[1:2,1:10]) # getting the first two rows


## ------------------------------------------------------------------------
head(dat$Stadtteilname)

dat$Stadtteilname[1:10]


## ----eval=T--------------------------------------------------------------
head(dat[,3])
head(dat[,"Stadtteilname"]) # dasselbe Ergebnis


## ------------------------------------------------------------------------
(a <- 1:7) # Beispieldaten - numerisch


## ------------------------------------------------------------------------
a>4
a>=4
a<3


## ------------------------------------------------------------------------
(b <- letters[1:7]) # Beispieldaten - Strings
b=="e"
b %in% c("e","f")


## ------------------------------------------------------------------------
wahlberechtigte <- as.numeric(dat$Wahlberechtigte.insgesamt)


## ------------------------------------------------------------------------
summary(wahlberechtigte)


## ------------------------------------------------------------------------
wahlberechtigte[5] <- NA


## ------------------------------------------------------------------------
mean(wahlberechtigte)


## ------------------------------------------------------------------------
mean(wahlberechtigte,na.rm=T)


## ------------------------------------------------------------------------
is.na(head(wahlberechtigte))


## ------------------------------------------------------------------------
which(is.na(wahlberechtigte))


## ------------------------------------------------------------------------
table(is.na(wahlberechtigte))


## ------------------------------------------------------------------------
# Beispiel Datensatz
mydata <- data.frame(A=c(1,NA,9,6),B=c("A","B",1,NA))


## ----eval=T--------------------------------------------------------------
# Datenzeilen mit fehlenden Werten auflisten 
mydata[complete.cases(mydata),]


## ----eval=F,echo=F-------------------------------------------------------
## install.packages("memisc")


## ----eval=F,echo=F-------------------------------------------------------
## install.packages("memisc")


## ------------------------------------------------------------------------
library(memisc)


## ----eval=F--------------------------------------------------------------
## ?include.missings


## ----eval=F--------------------------------------------------------------
## codebook(dat$Wähler)


## ------------------------------------------------------------------------
name1 <- tolower(c("DEEPAYAN","SARKAR"))


## ------------------------------------------------------------------------
firstup <- function(x) {
   substr(x, 1, 1) <- toupper(substr(x, 1, 1))
    return(x)
}


## ------------------------------------------------------------------------
firstup(name1)


## ------------------------------------------------------------------------
dat$wb_kat <- cut(dat$Wahlbeteiligung,3)
head(dat$wb_kat)


## ------------------------------------------------------------------------
levels(dat$wb_kat) <- c("niedrig","mittel","hoch")
head(dat$wb_kat)


## ------------------------------------------------------------------------
table(dat$wb_kat)


## ----eval=F--------------------------------------------------------------
## dat[dat$wb_kat=="mittel","Stadtteilname"]
## dat[dat$wb_kat!="mittel","Stadtteilname"]


## ----echo=F,eval=F-------------------------------------------------------
## head(dat[dat$wb_kat=="mittel","Stadtteilname"])
## head(dat[dat$wb_kat!="mittel","Stadtteilname"])


## ------------------------------------------------------------------------
subDat <- dat[dat$Wahlbeteiligung>65,]


## ----eval=F--------------------------------------------------------------
## dat[dat$Anteil.DIE.LINKE>12 & dat$Anteil.GRÜNE>25,"Stadtteilname"]


## ----eval=F--------------------------------------------------------------
## dat[dat$Anteil.CDU>28 | dat$Anteil.AfD>28,"Stadtteilname"]


## ----eval=F--------------------------------------------------------------
## colnames(dat)


## ----eval=F--------------------------------------------------------------
## colnames(dat)[1] <- "Nummer"


## ----eval=F--------------------------------------------------------------
## rownames(dat)


## ------------------------------------------------------------------------
library("forcats") 


## ----echo=F--------------------------------------------------------------
dat$wbkat5 <-as.factor(cut(dat$Wahlbeteiligung,5,labels=F))


## ------------------------------------------------------------------------
fct_count(f = dat$wbkat5)


## ------------------------------------------------------------------------
wbkat <- fct_collapse(.f = dat$wbkat5,
    hoch=c("4","5"))


## ------------------------------------------------------------------------
fct_count(wbkat)


## ------------------------------------------------------------------------
(ApplyDat <- cbind(1:4,runif(4),rnorm(4))) #Example 


## ------------------------------------------------------------------------
apply(ApplyDat,1,mean)
apply(ApplyDat,2,mean)


## ------------------------------------------------------------------------
apply(ApplyDat,1,var)
apply(ApplyDat,1,sd)
apply(X = ApplyDat,MARGIN = 1,FUN = range)


## ------------------------------------------------------------------------
ApplyDat <- data.frame(Income=rnorm(5,1400,200),
                       Sex=sample(c(1,2),5,replace=T))


## ------------------------------------------------------------------------
tapply(ApplyDat$Income,
       ApplyDat$Sex,function(x)x)


## ------------------------------------------------------------------------
data(iris)


## ----eval=F--------------------------------------------------------------
## head(iris)


## ----echo=F--------------------------------------------------------------
head(iris[,1:4])


## ------------------------------------------------------------------------
# Pearson correlation coefficient
cor(iris$Sepal.Length,iris$Petal.Length)


## ------------------------------------------------------------------------
# Pearson correlation coefficient
cor(iris[,1:4]) 


## ------------------------------------------------------------------------
# Kendall's tau (rank correlation)
cor(iris[,1:4], method = "kendall") 


## ------------------------------------------------------------------------
# Spearman's rho (rank correlation)
cor(iris[,1:4], method = "spearman") 


## ------------------------------------------------------------------------
dat <- read.csv2("../data/bauenwohnen_teil.csv")


## ------------------------------------------------------------------------
tab <- table(dat$Spiel100K,dat$baugenehm12)


## ----echo=F--------------------------------------------------------------
tab


## ------------------------------------------------------------------------
chisq.test(tab)


## ----eval=F--------------------------------------------------------------
## library(DT)
## DT::datatable(dat)


## ----eval=F,echo=F-------------------------------------------------------
## # https://github.com/BAAQMD/copydat
## devtools::install_github("BAAQMD/copydat")
## install.packages("questionr")
## devtools::install_github("ThinkR-open/littleboxes") # https://github.com/ThinkR-open/littleboxes

