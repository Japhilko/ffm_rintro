## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning = F,message = F)


## ------------------------------------------------------------------------
A <- c(1,2,3,4)
B <- c("A","B","C","D")

mydata <- data.frame(A,B)


## ----eval=F--------------------------------------------------------------
## mydata


## ----eval=T,echo=F-------------------------------------------------------
library(knitr)
kable(mydata)


## ----eval=F--------------------------------------------------------------
## save(mydata, file="mydata.RData")
## saveRDS(mydata, "mydata.rds")


## ----eval=F--------------------------------------------------------------
## load("mydata.RData")
## mydata <- readRDS("mydata.rds")


## ----eval=F,echo=F-------------------------------------------------------
## install.packages("tibble")


## ------------------------------------------------------------------------
library(tibble)
ab <- tibble(a=1:4,b=4:1)


## ----eval=F--------------------------------------------------------------
## library(xlsx)
## setwd("D:/Daten/GitHub/r_intro_gp18/data")
## write.xlsx(mydata,file="mydata.xlsx")


## ----eval=F--------------------------------------------------------------
## devtools::install_github("dreamRs/viewxl")


## ----eval=F,echo=F-------------------------------------------------------
## iris


## ----eval=F--------------------------------------------------------------
## write.csv(mydata,file="mydata.csv")


## ----eval=F--------------------------------------------------------------
## write.csv2(mydata,file="mydata.csv")


## ----eval=F--------------------------------------------------------------
## write.csv(mydata,file="mydata.csv", row.names=FALSE)


## ----eval=F--------------------------------------------------------------
## write.csv2(mydata,file="mydata.csv", row.names=FALSE)


## ----eval=F--------------------------------------------------------------
## write.csv(mydata,file="mydata.csv")


## ----eval=F--------------------------------------------------------------
## write.csv2(mydata,file="mydata.csv")


## ----eval=F--------------------------------------------------------------
## install.packages("rio")


## ----eval=F--------------------------------------------------------------
## library("rio")
## # create file to convert
## 
## export(mtcars, "data/mtcars.sav")


## ----eval=F--------------------------------------------------------------
## export(mtcars, "data/mtcars.dta")
## 
## # convert Stata to SPSS
## convert("data/mtcars.dta", "data/mtcars.sav")

