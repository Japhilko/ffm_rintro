## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,warning=F,message=F)


## ----eval=T,echo=F-------------------------------------------------------
# http://blog.revolutionanalytics.com/2015/06/how-many-packages-are-there-really-on-cran.html
CRANmirror <- "http://cran.revolutionanalytics.com"
cran <- contrib.url(repos = CRANmirror, 
                      type = "source")
info <- available.packages(contriburl = cran, type = "source")
# nrow(info)


## ----eval=F--------------------------------------------------------------
## install.packages("lme4")
## 
## library(lme4)


## ----eval=F--------------------------------------------------------------
## install.packages("lme4")


## ----eval=F--------------------------------------------------------------
## source("https://bioconductor.org/biocLite.R")
## biocLite(c("GenomicFeatures", "AnnotationDbi"))


## ----eval=F--------------------------------------------------------------
## install.packages("devtools")
## library(devtools)
## install_github("hadley/ggplot2")


## ----eval=F--------------------------------------------------------------
## install.packages("Rcmdr")


## ------------------------------------------------------------------------
library(Rcmdr)


## ----eval=F--------------------------------------------------------------
## install.packages("ctv")
## library("ctv")
## install.views("Bayesian")

