---
title: "Grundlagen R"
author: "Jan-Philipp Kolb"
date: "11 Juni, 2019"
fontsize: 10pt
output: 
  slidy_presentation: 
    highlight: haddock
    keep_md: yes
  beamer_presentation: 
    fig_caption: no
    fig_height: 3
    fig_width: 5
    fonttheme: structuresmallcapsserif
    highlight: zenburn
    colortheme: whale
    theme: Warsaw
---





## R ist eine Objekt-orientierte Sprache

### Vektoren und Zuweisungen

-  R ist eine Objekt-orientierte Sprache
-  `<-` ist der Zuweisungsoperator


```r
b <- c(1,2) #erzeugt ein Objekt mit den Zahlen 1 und 2
```
-  Eine Funktion kann auf dieses Objekt angewendet werden:


```r
mean(b) # berechnet den Mittelwert
```

```
## [1] 1.5
```

## Objektstruktur

Mit den folgenden Funktionen können wir etwas über die Eigenschaften des Objekts lernen:


```r
length(b) # b hat die Länge 2
```

```
## [1] 2
```



```r
str(b) # b ist ein numerischer Vektor
```

```
##  num [1:2] 1 2
```


## Funktionen im base-Paket

|Funktion |Bedeutung          |Beispiel  |
|:--------|:------------------|:---------|
|length() |Länge              |length(b) |
|max()    |Maximum            |max(b)    |
|min()    |Minimum            |min(b)    |
|sd()     |Standardabweichung |sd(b)     |
|var()    |Varianz            |var(b)    |
|mean()   |Mittelwert         |mean(b)   |
|median() |Median             |median(b) |

Diese Funktionen brauchen nur ein Argument.

## Funktionen mit mehr Argumenten

Andere Funktionen brauchen mehr Argumente:

|Argument   |Bedeutung         |Beispiel       |
|:----------|:-----------------|:--------------|
|quantile() |90 % Quantile     |quantile(b,.9) |
|sample()   |Stichprobe ziehen |sample(b,1)    |


## Beispiel - Funktionen mit einem Argument


```r
max(b)
```

```
## [1] 2
```

```r
min(b)
```

```
## [1] 1
```

```r
sd(b)
```

```
## [1] 0.7071068
```

```r
var(b)
```

```
## [1] 0.5
```

## Argumente

### Funktionen mit einem Argument


```r
mean(b)
```

```
## [1] 1.5
```

```r
median(b)
```

```
## [1] 1.5
```


### Funktionen mit mehr Argumenten


```r
quantile(b,.9)
```

```
## 90% 
## 1.9
```

```r
sample(b,1) 
```

```
## [1] 2
```


## Zufallszahlen ziehen


```r
n <- 100
x <- runif(n) # x und y sind Vektoren
y <- rnorm(n)
```



```r
str(x)
```

```
##  num [1:100] 0.5161 0.0824 0.2854 0.6559 0.1088 ...
```

### Indizieren von Vektoren


```r
x[1]
```

```
## [1] 0.5160947
```

```r
x[1:4]
```

```
## [1] 0.5160947 0.0823844 0.2853837 0.6559391
```

```r
x[97:100]
```

```
## [1] 0.6028855 0.6022262 0.1771250 0.8853866
```


## Buchstaben


```r
a <- letters
length(letters)
```

```
## [1] 26
```

```r
a[1:4]
```

```
## [1] "a" "b" "c" "d"
```

### Variablentyp `character` 


```r
str(a)
```

```
##  chr [1:26] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" ...
```


- Hier kann man bspw keinen Mittelwert berechnen


```r
mean(a)
```

```
## Warning in mean.default(a): argument is not numeric or logical: returning
## NA
```

```
## [1] NA
```


## Aufgabe - Zuweisungen und Funktionen

Erzeugen Sie einen Vektor b mit den Zahlen von 1 bis 5 und berechnen Sie...


1. den Mittelwert

2. die Varianz

3. die Standardabweichung

4. die quadratische Wurzel aus dem Mittelwert


## Kommentierung / Style Guide


### Kommentierung

- Man kann mit einem Hashtag Kommentare einfügen.
- Es macht Sinn am Anfang kurz einen Header einzufügen, bspw. mit folgenden Informationen: Autor, Thema, Erstellungsdatum,...
- Kommentarzeichen, die mehrere Zeilen als Kommentare kennzeichnen (siehe Stata) gibt es nicht. 


### [**Google Style Guide**](https://google.github.io/styleguide/Rguide.xml)

- Enthält bspw. Richtlinien zur Benennung von Objekten

## `data.frame`s


```r
ab <- data.frame(a,x=x[1:26])
head(ab)
```

```
##   a         x
## 1 a 0.5160947
## 2 b 0.0823844
## 3 c 0.2853837
## 4 d 0.6559391
## 5 e 0.1088144
## 6 f 0.1066747
```

```r
str(ab)
```

```
## 'data.frame':	26 obs. of  2 variables:
##  $ a: Factor w/ 26 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ x: num  0.5161 0.0824 0.2854 0.6559 0.1088 ...
```

## Matrizen

- Eine Matrix ist invertierbar - Allerdings haben alle Variablen gleichen Typ. 


```r
xy <- rbind(x[1:4],y[1:4])
str(xy)
```

```
##  num [1:2, 1:4] 0.5161 0.717 0.0824 0.4397 0.2854 ...
```

```r
xy
```

```
##           [,1]      [,2]       [,3]      [,4]
## [1,] 0.5160947 0.0823844  0.2853837 0.6559391
## [2,] 0.7170405 0.4397382 -0.2213181 0.7891333
```


```r
t(xy)
```

```
##           [,1]       [,2]
## [1,] 0.5160947  0.7170405
## [2,] 0.0823844  0.4397382
## [3,] 0.2853837 -0.2213181
## [4,] 0.6559391  0.7891333
```



## [Übersicht Befehle](http://cran.r-project.org/doc/manuals/R-intro.html)

<http://cran.r-project.org/doc/manuals/R-intro.html>

![](figure/UebersichtBefehle.PNG)

