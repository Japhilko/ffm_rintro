# Jan-Philipp Kolb
# Thu Jun 06 07:22:25 2019


#-------------------------------------------------#
# Load libraries
#-------------------------------------------------#

library(knitr)
library(rmarkdown)
library(lme4)

#-------------------------------------------------#
# Define paths
#-------------------------------------------------#

main_path <- "D:/Daten/github/ffm_rintro/"
# main_path <- "D:/github/ffm_rintro/"
slide_path <- paste0(main_path,"slides/")
rcode_path <- paste0(main_path,"rcode/")

#-------------------------------------------------#
# Parts of the presentation
#-------------------------------------------------#

dirnamen <- dir(slide_path)
presparts <- grep(".Rmd",dirnamen,value = T)


# setwd("D:/gitlab/IntroDataAnalysis/rcode/")
setwd(rcode_path)

for (i in 1:length(presparts)){
  purl(paste0("../slides/",presparts[i]),documentation = 1)  
}

#-------------------------------------------------#
# Creating pdf slides
#-------------------------------------------------#

# setwd("D:/Daten/GitLab/IntroDataAnalysis/slides")
setwd(slide_path)


for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "beamer_presentation")
}


for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "all")
}


for (i in 3:length(presparts)){
  rmarkdown::render(presparts[i], "md_document")
}

# B1_DataProcessing


#-------------------------------------------------#
# Create rcode in course
#-------------------------------------------------#

setwd(rcode_path)

purl("../slides/C2_hierarchMods.Rmd",documentation = 2)
purl("../slides/D1_webScrapping.Rmd",documentation = 2)
purl("../slides/D2_dataCleaning.Rmd",documentation = 2)

#-------------------------------------------------#
# Install necessary packages
#-------------------------------------------------#


install.packages("lme4")

#-------------------------------------------------#
# Links
#-------------------------------------------------#


# https://rmarkdown.rstudio.com/authoring_quick_tour.html
# https://www.r-bloggers.com/function-to-simplify-loading-and-installing-packages/