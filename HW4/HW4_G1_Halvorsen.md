---
title: "HW4 Group 1, Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Oct 1 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---



\newpage

# Problems


```r
# setup
library(tidyverse)
```

```
## ── Attaching packages ──────────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.3     ✓ dplyr   1.0.2
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.5.0
```

```
## ── Conflicts ─────────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(stargazer)
```

```
## 
## Please cite as:
```

```
##  Hlavac, Marek (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables.
```

```
##  R package version 5.2.2. https://CRAN.R-project.org/package=stargazer
```

```r
library(wooldridge)
```
# Problems

## Question 1

### (i)


I am not surprised by the sign, because the further away from the incinerator I am, the more value I get from my house. As you add a percent of distance away from the incinerator, your home value $$log\hat(price)$$ would increase by .132%

### (ii)

Other factors that could influence your home prices could be square footage, age of the home, location (good neighborhood, commercial versus residential proximity, etc), or the lot size of the home. These factors could also easily be correlated with distance.

### (iii)

No, because our unobserved variables are not independent of our the price of our home. The city decides as to where the incinerator is built 

## Question 2

### (i)


$$E(u|inc) = E(\sqrt{inc} * e|inc) = (\sqrt{inc})E(e|inc) = (\sqrt{inc})E(e) = (\sqrt{inc}) * 0 = 0$$


### (ii)



### (iii)


---

# Computer Problems

## Question 3


```r
## Load the data
rich <- k401k
```


### (i)

```r
mean(rich$prate)
```

```
## [1] 87.36291
```

```r
mean(rich$mrate)
```

```
## [1] 0.7315124
```

### (ii)

```r
reg <- lm(prate~mrate, rich)
stargazer(reg, type="text")
```

```
## 
## ===============================================
##                         Dependent variable:    
##                     ---------------------------
##                                prate           
## -----------------------------------------------
## mrate                        5.861***          
##                               (0.527)          
##                                                
## Constant                     83.075***         
##                               (0.563)          
##                                                
## -----------------------------------------------
## Observations                   1,534           
## R2                             0.075           
## Adjusted R2                    0.074           
## Residual Std. Error     16.085 (df = 1532)     
## F Statistic          123.685*** (df = 1; 1532) 
## ===============================================
## Note:               *p<0.1; **p<0.05; ***p<0.01
```

This gives us an estimated equation of:

$$\hat{prate}=83.075+5.86mrate$$
Our sample size would be: $$n=1534$$ and $$R^2=0.75$$


### (iii)

Interpret the intercept and the coefficient of *mrate*

### (iv)


```r
predict_rich <- function(rate){
  83.075+5.86*rate
}

predict_rich(3.5)
```

```
## [1] 103.585
```

When `mrate = 3.5` we get a predicted `prate` of 103.59.


### (v)

## Question 4


```r
# Question Setup
math <- meap93
```

### (i)



### (ii)



### (iii)
### (iv)
### (v)

## Question 5

### (i)
### (ii)
### (iii)
### (iv)

## Question 6

### (i)
### (ii)
### (iii)
### (iv)
### (v)




