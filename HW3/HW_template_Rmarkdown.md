---
title: "HW3_Group1_Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Sep 22 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---



\newpage

# Problems

## Question 1


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyverse)
```

```
## ── Attaching packages ──────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.3     ✓ stringr 1.4.0
## ✓ tidyr   1.1.2     ✓ forcats 0.5.0
## ✓ readr   1.3.1
```

```
## ── Conflicts ─────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(wooldridge)

## Make the data frame
family <- data.frame(family = 1:10, monthly_expense = c(300,440,350,1100,640,480,450,700,670,530))
```


### (i)

Find the average monthly housing expenditure.

```r
mean(family$monthly_expense)
```

```
## [1] 566
```

### (ii)

```r
median(family$monthly_expense)
```

```
## [1] 505
```

### (iii)

```r
adj1 <- family %>% 
  mutate(
    hundreds_dollar = monthly_expense / 100
  ) 

mean(adj1$hundreds_dollar) 
```

```
## [1] 5.66
```

```r
median(adj1$hundreds_dollar)
```

```
## [1] 5.05
```


### (iv)

```r
adj2 <- family
adj2[8,2] <- adj2[8,2] + 100
mean(adj2$monthly_expense)
```

```
## [1] 576
```

```r
median(adj2$monthly_expense)
```

```
## [1] 505
```


## Question 2

The difference between the two percentages was 3%, however the percentage change between 15% and 18% is 20%.

## Question 3 


```r
log_salary <- 10.6 + 0.027*(0)
calc_salary <- function(x){
  exp(10.6 + 0.027 * x)
}
```


### (i)

```r
sal0 <- calc_salary(0)
sal5 <- calc_salary(5)
```


### (ii)

```r
calc_percent <- function(x){
  (100*0.027)*x
}

calc_percent(5)
```

```
## [1] 13.5
```


### (iii)

```r
((sal5-sal0)/sal0)*100
```

```
## [1] 14.45368
```
The exact percent change is 14.5% from the part i. Based on our approximation from part ii, we had that after 5 years experience the percentage increase would be about 13.5%. 

## Question 4

### (i)

```r
round(pnorm(6,5,2),3)
```

```
## [1] 0.691
```

### (ii)

```r
round(1-pnorm(4,5,2),3)
```

```
## [1] 0.691
```

### (iii)

```r
round(1-pnorm(6,5,2) + pnorm(4,5,2),3)
```

```
## [1] 0.617
```

## Question 5


```r
# Writing the function
cdf <- function(x){
  3*x^2 - 2*x^3
} 

1-cdf(0.6)
```

```
## [1] 0.352
```

### (i)

```r
1-cdf(0.6)
```

```
## [1] 0.352
```

```r
#1-pnorm(0.6)
```

## Question 6

### (i)

```r
# use expected values property

52.3*1000
```

```
## [1] 52300
```

```r
14.6*1000
```

```
## [1] 14600
```



