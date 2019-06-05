# Jan-Philipp Kolb
# Mon Jan 07 11:44:06 2019


###############################################
# functions

prep_picnames <- function(txt){
  ind <- agrep("![]",txt)
  pics <- txt[ind]
  pics2 <- strsplit(split = "\\(",x=pics)
  pics3 <- unlist(lapply(pics2,function(x)ifelse(length(x)==3,x[3],x[2])))
  pics3 <- gsub("filepath,\"","",pics3)
  pics3 <- gsub("\\)","",pics3)
  pics3 <- gsub("\")`)","",pics3)
  ind_https <- agrep("https",pics3)
  if (length(ind_https)!=0){
    pics3 <- pics3[-ind_https]  
  }
  return(pics3)
}

###############################################
# set paths

sysInfo <- Sys.info()

if (sysInfo["nodename"]=="MAL15037"){
  new.folder <- "D:/Eigene Dateien/Dokumente/GitHub/IntroR/buildingblocks"
  new.folder <- "D:/github/IntroR/2019/slides/"
  path_wherepicslive <- "D:/GitHub/geocourse/slides/"
  path_wherepicslive <- "D:/Eigene Dateien/Dokumente/GitHub/r_intro_gp18/slides/"
}

if (sysInfo["nodename"]=="SVMARDP07"){
  new.folder <- "D:/Daten/GitHub/IntroR/buildingblocks/"   
  path_wherepicslive <- "D:/Daten/GitHub/r_intro_gp18/slides/" 
  path_wherepicslive <- "D:/Daten/GitHub/geohealth/slides/"
  path_wherepicslive <- "D:/Daten/GitHub/geocourse/slides/"
}

if (sysInfo["nodename"]=="MAC14077"){
  new.folder <- "D:/Daten/GitHub/IntroR/buildingblocks/" 
  new.folder <- "D:/Daten/GitHub/IntroR/2019/slides/"
  path_wherepicslive <- "D:/Daten/GitHub/r_intro_gp18/slides/" 
  path_wherepicslive <- "D:/Daten/GitHub/geocourse/slides/"
  path_wherepicslive <- "D:/Daten/GitHub/geohealth/slides/"
  path_wherepicslive <- "D:/Daten/GitHub/RInterfaces/slides/"
  path_wherepicslive <- "D:/Daten/GitHub/GeoData/2017/slides/"
}

new.folder.fig <- paste0(new.folder,"/figure/")

#################################
# Für meinen Gesis Workshop 2019

setwd(new.folder)

myfiles <- c("Import.Rmd","LineareRegression.Rmd","DatenVerarbeitung.Rmd","GESISPanel.Rmd")

i <- length(myfiles)
myfile <- myfiles[i]

txt <- readLines(myfile)

pics3 <- prep_picnames(txt)


setwd(path_wherepicslive)

file.copy(pics3, new.folder.fig)

###############################################





###############################################
# Links

# https://cran.r-project.org/web/packages/readtext/vignettes/readtext_vignette.html
# https://stackoverflow.com/questions/27721008/how-do-i-deal-with-special-characters-like-in-my-regex
# https://stackoverflow.com/questions/24173194/remove-parentheses-and-text-within-from-strings-in-r

###############################################
# code snippets

# install.packages("readtext")
library(readtext)


pics2 <- gsub("\\!\\[\\]\\(","",pics)
pics3 <- gsub("\\)","",pics2)


# gsub("\\s*\\([^\\)]+\\)","",pics)