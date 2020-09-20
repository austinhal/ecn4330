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
## ── Attaching packages ───────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.3     ✓ stringr 1.4.0
## ✓ tidyr   1.1.2     ✓ forcats 0.5.0
## ✓ readr   1.3.1
```

```
## ── Conflicts ──────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(wooldridge)

## Make the data frame
family <- data.frame(x = 1:10, y = c(300,440,350,1100,640,480,450,700,670,530))

names(family)[1] <- "family" 
names(family)[2] <- "monthly_expense"
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

## Question 3 

### (i)



### (ii)



### (iii)



## Question 4

## Question 5

## Question 6


