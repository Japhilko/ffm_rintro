## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ------------------------------------------------------------------------
b <- c(1,2) #erzeugt ein Objekt mit den Zahlen 1 und 2


## ------------------------------------------------------------------------
mean(b) # berechnet den Mittelwert


## ------------------------------------------------------------------------
length(b) # b hat die Länge 2


## ------------------------------------------------------------------------
str(b) # b ist ein numerischer Vektor


## ------------------------------------------------------------------------
max(b)
min(b)
sd(b)
var(b)


## ------------------------------------------------------------------------
mean(b)
median(b)


## ------------------------------------------------------------------------
quantile(b,.9)
sample(b,1) 


## ------------------------------------------------------------------------
n <- 100
# x und y sind Vektoren
x <- runif(n)
y <- rnorm(n)


## ------------------------------------------------------------------------
str(x)


## ------------------------------------------------------------------------
x[1]
x[1:4]
x[97:100]


## ------------------------------------------------------------------------
a <- letters
length(letters)
a[1:4]


## ------------------------------------------------------------------------
str(a)


## ----warning=T-----------------------------------------------------------
mean(a)


## ------------------------------------------------------------------------
ab <- data.frame(a,x=x[1:26])
head(ab)
str(ab)


## ------------------------------------------------------------------------
xy <- rbind(x[1:4],y[1:4])
str(xy)
xy


## ------------------------------------------------------------------------
t(xy)

