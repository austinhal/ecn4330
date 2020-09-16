---
title: "HW2_Group #1_Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Sep 15 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---



\newpage

# Problems

## Question 1

### (i) 


```
[1]  1  5  9 13 17
```

## Question 2

### (i)


```
     [,1] [,2] [,3] [,4] [,5]
[1,]   20   21   22   23   24
[2,]   25   26   27   28   29
[3,]   30   31   32   33   34
[4,]   35   36   37   38   39
```

### (ii)


```
      A  B  C  D  E
[1,] 20 21 22 23 24
[2,] 25 26 27 28 29
[3,] 30 31 32 33 34
[4,] 35 36 37 38 39
```

### (iii)


```
      B  D
[1,] 26 28
[2,] 36 38
```

### (iv)


```
  [,1] [,2]
B   26   36
D   28   38
```

### (v)


```
  [,1] [,2]
B -1.9  1.4
D  1.8 -1.3
```

### (vi)


```
     [,1] [,2]
[1,]    1    0
[2,]    0    1
```
 
\newpage 
 
## Question 3

### (i)


```
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```

### (ii)


```
            cyl hp    wt vs am gear  mpg
Datsun 710    4 93 2.320  1  1    4 22.8
Merc 240D     4 62 3.190  1  0    4 24.4
Merc 230      4 95 3.150  1  0    4 22.8
Fiat 128      4 66 2.200  1  1    4 32.4
Honda Civic   4 52 1.615  1  1    4 30.4
```

### (iii)


```
  cyl hp    wt vs am gear  mpg   gpm
1   4 93 2.320  1  1    4 22.8 0.044
2   4 62 3.190  1  0    4 24.4 0.041
3   4 95 3.150  1  0    4 22.8 0.044
4   4 66 2.200  1  1    4 32.4 0.031
5   4 52 1.615  1  1    4 30.4 0.033
```

### (iv)


```
'data.frame':	32 obs. of  8 variables:
 $ cyl : num  4 4 4 4 4 4 4 4 4 4 ...
 $ hp  : num  93 62 95 66 52 65 97 66 91 113 ...
 $ wt  : num  2.32 3.19 3.15 2.2 1.61 ...
 $ vs  : num  1 1 1 1 1 1 1 1 0 1 ...
 $ am  : num  1 0 0 1 1 1 0 1 1 1 ...
 $ gear: num  4 4 4 4 4 4 3 4 5 5 ...
 $ mpg : num  22.8 24.4 22.8 32.4 30.4 33.9 21.5 27.3 26 30.4 ...
 $ gpm : num  0.044 0.041 0.044 0.031 0.033 0.029 0.047 0.037 0.038 0.033 ...
```

### (v)


```
'data.frame':	32 obs. of  8 variables:
 $ cyl : Factor w/ 3 levels "4","6","8": 1 1 1 1 1 1 1 1 1 1 ...
 $ hp  : num  93 62 95 66 52 65 97 66 91 113 ...
 $ wt  : num  2.32 3.19 3.15 2.2 1.61 ...
 $ vs  : Factor w/ 2 levels "0","1": 2 2 2 2 2 2 2 2 1 2 ...
 $ am  : Factor w/ 2 levels "0","1": 2 1 1 2 2 2 1 2 2 2 ...
 $ gear: Factor w/ 3 levels "3","4","5": 2 2 2 2 2 2 1 2 3 3 ...
 $ mpg : num  22.8 24.4 22.8 32.4 30.4 33.9 21.5 27.3 26 30.4 ...
 $ gpm : num  0.044 0.041 0.044 0.031 0.033 0.029 0.047 0.037 0.038 0.033 ...
```

---------



# Computer Exercises



## Alcohol Dataset for Questions

### (i)
**What is percentage of the men in the sample report abusing alcohol?**

```

         0          1 
0.90083486 0.09916514 
```
From the sample, we see about 9.9% of men report alcohol abuse

### (ii)
**What is the employment rate?**

```

         1          2          3 
0.06963958 0.03217267 0.89818774 
```
The employment rate is ≈ 89.82%

### (iii)
**Consider the group of men who abuse alcohol. What is the employment rate?**

```
   
             1          2          3
  0 0.06792495 0.03108047 0.90099458
  1 0.08521561 0.04209446 0.87268994
```

```

         2          3 
0.04601571 0.95398429 
```
The employment rate of those who abuse alcohol is ≈ 87.26%

### (iv)
**What is the employment rate for the group of men who do not abuse alcohol?**

```
   
             1          2          3
  0 0.06792495 0.03108047 0.90099458
  1 0.08521561 0.04209446 0.87268994
```
The employment rate for those who do not abuse alcohol is ≈ 90.10%

### (v)

__Discuss the difference in your answers to parts (iii) and (iv). Does this allow you to conclude that alcohol abuse causes unemployment?__

---


The rates of those who abuse alcohol and those who do not were who were employed were 87.26% and 90.10%. This does not highlight anything to do with the causality of alcohol abuse and unemployment. We would need to test and control other explanatory variables to try to explain the reasoning for unemployment.
