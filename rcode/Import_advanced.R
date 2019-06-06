## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----eval=F--------------------------------------------------------------
## getwd()


## ----eval=F--------------------------------------------------------------
## main.path <- "C:/" # Example for Windows
## main.path <- "/users/Name/" # Example for Mac
## main.path <- "/home/user/" # Example for Linux


## ----eval=F--------------------------------------------------------------
## setwd(main.path)


## ------------------------------------------------------------------------
getwd()
setwd("..")
getwd()

