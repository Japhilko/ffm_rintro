## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,message=F,warning = F,cache=F, fig.height=4)
GESIS <- T
athome <- !GESIS


## ------------------------------------------------------------------------
load("../data/bauenwohnen_teil.RData")


## ----eval=F--------------------------------------------------------------
## ?hist


## ----eval=T,fig.width=12, fig.height=5-----------------------------------
hist(dat$Spielplaetze_100k)


## ----eval=F--------------------------------------------------------------
## png("Histogramm.png")
##   hist(dat$Spielplaetze_100k)
## dev.off()


## ----eval=F--------------------------------------------------------------
## pdf("Histogramm.pdf")
##   hist(dat$Spielplaetze_100k)
## dev.off()


## ----eval=F--------------------------------------------------------------
## jpeg("Histogramm.jpeg")
##   hist(dat$Spielplaetze_100k)
## dev.off()


## ----eval=F--------------------------------------------------------------
## hist(dat$Spielplaetze_100k,col="blue",
##      main="Spielplätze je 100 Kinder 2012",ylab="Frequency",
##      xlab="Spielplätze")


## ----echo=F,eval=F-------------------------------------------------------
## hist(dat$Spielplaetze_100k,col="blue",
##      main="Spielplätze je 100 Kinder 2012",ylab="Frequency",
##      xlab="Spielplätze")


## ----eval=F--------------------------------------------------------------
## install.packages("colourpicker")


## ----eval=F--------------------------------------------------------------
## ?plot
## # or
## ?par


## ----eval=T,fig.width=10, fig.height=4-----------------------------------
hist(dat$Spielplaetze_100k,col="blue",
     main="Spielplätze je 100 Kinder 2012",ylab="Frequency", 
     xlab="Spielplätze",xlim=c(0,2))


## ----eval=F--------------------------------------------------------------
## hist(dat$Spielplaetze_100k,col="red",
##      main="Spielplätze je 100 Kinder 2012",ylab="Häufigkeit",
##      xlab="Spielplätze",breaks=20)


## ------------------------------------------------------------------------
tab_spiel <- table(dat$Spiel100K)


## ----eval=F--------------------------------------------------------------
## barplot(tab_spiel)


## ----eval=T--------------------------------------------------------------
barplot(tab_spiel,col=rgb(0,0,1))


## ------------------------------------------------------------------------
barplot(tab_spiel,col=rgb(0,1,0))


## ------------------------------------------------------------------------
barplot(tab_spiel,col=rgb(1,0,0))


## ------------------------------------------------------------------------
barplot(tab_spiel,col=rgb(1,0,0,.3))


## ------------------------------------------------------------------------
tab2dim <- table(dat$Spiel100K,dat$clust)


## ----eval=F--------------------------------------------------------------
## barplot(tab2dim,col=1:3)


## ----eval=T--------------------------------------------------------------
barplot(tab2dim,col=2:4,beside=T)


## ----eval=F--------------------------------------------------------------
## ?boxplot


## ----eval=T,fig.width=12, fig.height=5-----------------------------------
boxplot(dat$wohnungsbestand,horizontal=TRUE)


## ----eval=T,fig.width=12, fig.height=5-----------------------------------
boxplot(wohnungsbestand~clust,data=dat,horizontal=TRUE)


## ----echo=F,eval=F-------------------------------------------------------
## install.packages("vioplot")


## ----eval=T,fig.width=12, fig.height=5-----------------------------------
library(vioplot)
vioplot(na.omit(dat$wohnungsbestand),col="royalblue")


## ----message=F,eval=F,echo=F,fig.width=12, fig.height=5------------------
## library(vioplot)
## plot(x, y, xlim=c(-5,5), ylim=c(-5,5))
## vioplot(x, col="tomato", horizontal=TRUE, at=-4,
##         add=TRUE,lty=2, rectCol="gray")
## vioplot(y, col="cyan", horizontal=FALSE, at=-4,
##         add=TRUE,lty=2)


## ----echo=F,eval=F-------------------------------------------------------
## install.packages("beanplot")


## ------------------------------------------------------------------------
library(beanplot)
par(mfrow = c(1,2))
boxplot(dat$wohnungsbestand~dat$clust,data=dat,col="blue")
beanplot(dat$wohnungsbestand~dat$clust,data=dat,col="orange")


## ----eval=F,echo=F-------------------------------------------------------
## install.packages("mlmRev")


## ----eval=T--------------------------------------------------------------
plot(dat$wohnungsbestand,dat$bautaet)


## ----echo=F--------------------------------------------------------------
library(datasets)
data(VADeaths)
barplot(VADeaths, border = "dark blue",beside=T,
        col=c(1,2,3,4,5)) 


## ----eval=F--------------------------------------------------------------
## devtools::install_github("homerhanumat/addinplots")


## ----eval=F,echo=F-------------------------------------------------------
## iris


## ----eval=F--------------------------------------------------------------
## iris # Beispieldatensatz


## ------------------------------------------------------------------------
library("mlmRev")
data(Chem97)


## ----echo=F--------------------------------------------------------------
library(knitr)
cats <- c("Local Education Authority","School identifier","Student identifier","Point score on A-level Chemistry in 1997","Student's gender","Age in month, centred at 222 months or 18.5 years","Average GCSE score of individual","Average GCSE score of individual, centered at mean")
c97dat <- data.frame(variables=colnames(Chem97),categories=cats)
kable(c97dat)


## ----message=F,fig.width=12, fig.height=5--------------------------------
library("lattice")
histogram(~ gcsescore, data = Chem97)


## ----fig.width=12, fig.height=5------------------------------------------
histogram(~ gcsescore | score,data = Chem97)


## ----fig.width=12, fig.height=5------------------------------------------
densityplot(~ gcsescore | score, Chem97, 
	groups=gender,auto.key=TRUE)


## ----echo=T,eval=T,fig.width=12, fig.height=5----------------------------
Chem97$score <- as.factor(Chem97$score)


## ----fig.width=12, fig.height=5------------------------------------------
bwplot(score ~ gcsescore | gender, Chem97)


## ----fig.width=12, fig.height=5------------------------------------------
bwplot(gcsescore ~ gender | score, Chem97,
 layout = c(6, 1))


## ----echo=F,eval=F-------------------------------------------------------
## barchart(yield ~ variety | site, data = barley,
##          groups = year, layout = c(1,6), stack = TRUE,
##          auto.key = list(space = "right"),
##          ylab = "Barley Yield (bushels/acre)",
##          scales = list(x = list(rot = 45)))


## ----echo=F,eval=F-------------------------------------------------------
## barchart(gcsescore ~ lea | school, data = Chem97,groups = gender, stack = TRUE,
##          auto.key = list(space = "right"),
##          ylab = "Barley Yield (bushels/acre)",
##          scales = list(x = list(rot = 45)))


## ----fig.width=12, fig.height=5------------------------------------------
densityplot(~height|voice.part,data=singer,layout = c(2,4),
            xlab = "Height (inches)",bw = 5)


## ----fig.width=12, fig.height=5------------------------------------------
qq(gender ~ gcsescore | score, Chem97)


## ----eval=F,echo=F-------------------------------------------------------
## xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width
##        | Species,data=iris,scales="free",layout= c(2,2),
##        auto.key = list(x = .6, y = .7, corner = c(0, 0)))


## ----eval=T,fig.width=12, fig.height=5-----------------------------------
xyplot(Sepal.Length+Sepal.Width~Petal.Length+Petal.Width 
       | Species,data = iris, auto.key = T)


## ----fig.width=12, fig.height=5------------------------------------------
pairs(iris[,1:4])


## ----eval=T,fig.width=12, fig.height=5-----------------------------------
library("psych")
pairs.panels(iris[,1:4],bg=c("red","yellow","blue")[iris$Species],
             pch=21,main="")


## ----fig.width=12, fig.height=5------------------------------------------
splom(~iris[,1:4], groups = Species, data = iris)


## ----eval=F--------------------------------------------------------------
## super.sym <- trellis.par.get("superpose.symbol")
## splom(~iris[1:4], groups = Species, data = iris,
##       panel = panel.superpose,
##       key = list(title = "Three Varieties of Iris",
##                  columns = 3,
##                  points = list(pch = super.sym$pch[1:3],
##                  col = super.sym$col[1:3]),
##                  text = list(c("Setosa", "Versicolor",
##                                "Virginica"))))


## ----echo=T,eval=F-------------------------------------------------------
## install.packages("AER")


## ------------------------------------------------------------------------
library("AER")
data(BankWages)


## ------------------------------------------------------------------------
head(BankWages)


## ----message=F,eval=T----------------------------------------------------
library("lattice")
levelplot(table(BankWages$education,BankWages$job),
          xlab="education",ylab="job")


## ------------------------------------------------------------------------
tab2dim2 <- table(dat$clust,dat$Spiel100K)


## ----message=F,fig.width=12, fig.height=5--------------------------------
levelplot(tab2dim2,
col.regions=colorRampPalette(c("blue","white","red")))


## ------------------------------------------------------------------------
mosaicplot(tab2dim2, color = TRUE,main="")


## ------------------------------------------------------------------------
mosaicplot(tab2dim2, main="",shade = TRUE)


## ----fig.width=12, fig.height=8------------------------------------------
parallelplot(~iris[,1:4] | Species, iris,layout=c(3,1))


## ----eval=T--------------------------------------------------------------
library(ggplot2)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()


## ----eval=F--------------------------------------------------------------
## install.packages("ggThemeAssist")


## ----eval=F--------------------------------------------------------------
## install.packages('ggedit')


## ----eval=F--------------------------------------------------------------
## devtools::install_github("dreamRs/esquisse")


## ------------------------------------------------------------------------
data(diamonds)


## ------------------------------------------------------------------------
d <- diamonds[sample(nrow(diamonds), 1000), ]


## ------------------------------------------------------------------------
library(plotly)


## ----eval=F--------------------------------------------------------------
## p <- ggplot(data = d, aes(x = carat, y = price)) +
##   geom_point(aes(text = clarity,size = 4)) +
##   geom_smooth(aes(colour = cut, fill = cut))+
##   facet_wrap(~ cut)


## ----eval=F,echo=F-------------------------------------------------------
## p <- ggplot(data = d, aes(x = carat, y = price)) +
##   geom_point(aes(text = paste("Clarity:",clarity)),size = 4) +
##   geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)
## (gg <- ggplotly(p))


## ----eval=F--------------------------------------------------------------
## ggplotly(p)

