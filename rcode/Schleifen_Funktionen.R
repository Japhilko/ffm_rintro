## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)


## ------------------------------------------------------------------------
  # Ein Container für die Ergebnisse
usq <- vector()

for(i in 1:10) {
  usq[i] <- i*i
  print(usq[i],"\n")
}

print(i)

