## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,warning=F,message=F,eval=T,fig.width=12, fig.height=5)
pres <- T


## ----echo=F--------------------------------------------------------------
dat <- readstata13::read.dta13("../data/ZA5666_v1-0-0_Stata14.dta")
datf <- readstata13::read.dta13("../data/ZA5666_v1-0-0_Stata14.dta",
                  convert.factors = F)



## ----eval=F--------------------------------------------------------------
## ?mtcars


## ----echo=F--------------------------------------------------------------
library(knitr)
kable(mtcars)


## ----fig.width=12, fig.height=5------------------------------------------
par(mfrow=c(1,2))
plot(density(mtcars$wt)); plot(density(mtcars$mpg))


## ------------------------------------------------------------------------
m1 <- lm(mpg ~ wt,data=mtcars)
m1


## ------------------------------------------------------------------------
summary(m1) 


## ------------------------------------------------------------------------
m2 <- lm(mpg ~ - 1 + wt,data=mtcars)
summary(m2)$coefficients


## ------------------------------------------------------------------------
m3 <- lm(mpg ~ wt + cyl,data=mtcars)
summary(m3)$coefficients


## ------------------------------------------------------------------------
# effect of cyl and interaction effect:
m3a<-lm(mpg~wt*cyl,data=mtcars) 

# only interaction effect:
m3b<-lm(mpg~wt:cyl,data=mtcars) 


## ----eval=F,echo=F-------------------------------------------------------
## m3c<-lm(mpg~cyl|wt,data=mtcars)
## 
## m3c<-lm(mpg~cyl/wt,data=mtcars)
## 
## 
## summary(m3b)
## summary(m3c)


## ----eval=F--------------------------------------------------------------
## m3d<-lm(mpg~log(wt),data=mtcars)


## ------------------------------------------------------------------------
m3d<-lm(mpg~wt*disp,data=mtcars) 
m3dsum <- summary(m3d)
m3dsum$coefficients


## ----eval=F,echo=F-------------------------------------------------------
## install.packages("jtools")


## ----eval=F,echo=T-------------------------------------------------------
## library(jtools)
## interact_plot(m3d, pred = "wt", modx = "disp")


## ----eval=F,echo=F-------------------------------------------------------
## library(jtools)
## fitiris <- lm(Petal.Length ~ Petal.Width * Species, data = iris)
## interact_plot(fitiris, pred = "Petal.Width", modx = "Species")


## ------------------------------------------------------------------------
library(interplot)


## ----eval=F,echo=F-------------------------------------------------------
## interplot(m = m3d, var1 = "disp", var2 = "wt", hist = TRUE) +
##   aes(color = "pink") + theme(legend.position="none") +
##   geom_hline(yintercept = 0, linetype = "dashed")


## ----eval=T--------------------------------------------------------------
interplot(m = m3a, var1 = "wt", var2 = "cyl", hist = TRUE)  


## ----eval=F--------------------------------------------------------------
## predict(m3) # Prediction
## resid(m3) # Residuals


## ----echo=F--------------------------------------------------------------
head(predict(m3)) # Prediction
head(resid(m3)) # Residuals


## ------------------------------------------------------------------------
pre <- predict(m1)
head(mtcars$mpg)
head(pre)




## ------------------------------------------------------------------------
plot(m3,2)


## ----fig.width=12, fig.height=5------------------------------------------
plot(mtcars$wt,mtcars$mpg)
abline(m1)
segments(mtcars$wt, mtcars$mpg, mtcars$wt, pre, col="red")


## ----echo=F,eval=F-------------------------------------------------------
## # https://www.r-bloggers.com/marginal-effects-for-regression-models-in-r-rstats-dataviz/
## p <- ggpredict(m5, c("wt", "cyl"))
## plot(p)


## ----eval=F--------------------------------------------------------------
## install.packages("visreg")


## ------------------------------------------------------------------------
library(visreg)


## ----eval=F--------------------------------------------------------------
## visreg(m1, "wt", type = "conditional")


## ----eval=T,echo=F,fig.width=12, fig.height=5----------------------------
visreg(m1, "wt", type = "conditional",
      line=list(col="red"),
       fill=list(col="#473C8B"),points=list(cex=1.5,col=rgb(0,1,0,.5)))


## ----eval=F--------------------------------------------------------------
## visreg(m1, "wt", type = "contrast")


## ----echo=F,eval=T,fig.width=12, fig.height=5----------------------------
visreg(m1, "wt", type = "contrast",alpha=.01,
       line=list(col="red"),
       fill=list(col="#473C8B"),points=list(cex=1.5,col=rgb(.4,.4,0,.5)))


## ------------------------------------------------------------------------
mtcars$cyl <- as.factor(mtcars$cyl)
m4 <- lm(mpg ~ cyl + wt, data = mtcars)
# summary(m4)


## ----echo=F--------------------------------------------------------------
sum_m4 <- summary(m4)
sum_m4$coefficients


## ----eval=F--------------------------------------------------------------
## par(mfrow=c(1,2))
## visreg(m4, "cyl", type = "contrast")
## visreg(m4, "cyl", type = "conditional")


## ----eval=T,echo=F-------------------------------------------------------
par(mfrow=c(1,2))
visreg(m4, "cyl", type = "contrast",fill=list(col=c("#00FFFF")),points=list(cex=1.5,col=rgb(.4,.4,.4,.5)))
visreg(m4, "cyl", type = "conditional",fill=list(col=c("#00FFFF")),points=list(cex=1.5,col=rgb(.4,.4,.4,.5)))


## ------------------------------------------------------------------------
m5 <- lm(mpg ~ cyl*wt, data = mtcars)
# summary(m5)


## ----echo=F--------------------------------------------------------------
sum_m5 <- summary(m5)
sum_m5$coefficients


## ----eval=F--------------------------------------------------------------
## visreg(m5, "wt", by = "cyl",layout=c(3,1))




## ------------------------------------------------------------------------
m6 <- lm(mpg ~ hp + wt * cyl, data = mtcars)




## ------------------------------------------------------------------------
visreg2d(m6, "wt", "hp", plot.type = "image")


## ---- fig.height=6-------------------------------------------------------
visreg2d(m6, "wt", "hp", plot.type = "persp")


## ----eval=F,echo=F-------------------------------------------------------
## install.packages("stargazer")


## ----eval=F--------------------------------------------------------------
## library(stargazer)
## stargazer(m3, type="html")

