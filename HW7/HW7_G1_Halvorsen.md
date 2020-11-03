---
title: "HW7 Group 1, Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Nov 3 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---

\newpage

# Problems



## Question 1

### (i) 

### (ii)

### (iii)

## Question 2

### (i) 

The null hypothesis would be $H_0: \beta_3=0$. The alternative hypothesis would be $H_1: \beta_3\neq0$

### (ii)

I would expect $\beta_1$ to have a positive sign, since having a larger population would result in more demand for rental housing.

I would expect $\beta_2$ to also have a positive sign, since higher income would likely mean that the cost of living is high as well, meaning housing prices and rental rates would be higher.

### (iii)

Because this is a log-log model, the interpretation of this model should be, *"A 10% increase in population would result an increase of rent of 0.66%.

### (iv)

With a degree of freedom of 60 (64-4), at the 1% level, we 

## Question 3

### (i)

### (ii)

### (iii)

### (iv) 

\newpage

## Question 4

### (i)

We can apply the property of variance: 
$$Var(\hat{\beta}_1-3\hat{\beta}_2=Var(\hat{\beta}_1)+9Var(\hat{\beta}_2)-6 Cov(\hat{\beta}_1,\hat{\beta}_2)$$

### (ii)

$$t = \frac{(\hat{\beta}_1-3\hat{\beta}_2-1)}{se(\hat{\beta}_1-3\hat{\beta}_2)}$$

We will need to identify the standard error, or $se(\hat{\beta}_1-3\hat{\beta}_2)$

### (iii)

If $\theta_1=\beta_1-3\beta_2$ then $\beta_1=\theta_1+3\beta_2$, therefore we can write our population regression model as:

$$y=\beta_0+(\theta_1+3\beta_2)x_1+\beta_2x_2+\beta_3x_3+u$$
$$=\beta_0+\theta_1x_1+\beta_2(3x_1+x_2)+\beta_3x_3+u$$
We would estimate y by regressing y on $x_1, 3x_1+x_2,$ and $x_3$. This will allow us to calculate the stand error and coefficient of $x_1$

## Question 5

### (i)

With the negative sign, I would expect that if a profit margins are small, meaning they weren't that profitable of a company, then that firm would need to pay more in order to attract someone to fill the position.

### (ii)

Yes, the effect is significant. The t value is greater than 2, and this would make sense that companies with larger market values pay more.

### (iii)

The

### (iv)

This could be the result of someone who has stayed with the company for a long time and may not have demands on pay and does the job more out of passion for the company rather than an outsider who may demand large bonus pay to run the company.

---------

\newpage

# Computer Exercises

## Question 6

### (i)

```r
d1 <- hprice1
mrm1 <- lm(lprice~sqrft+bdrms, d1)
stargazer(mrm1, type = 'text', digits = 8)
```

```

===============================================
                        Dependent variable:    
                    ---------------------------
                              lprice           
-----------------------------------------------
sqrft                      0.00037945***       
                           (0.00004321)        
                                               
bdrms                       0.02888444         
                           (0.02964326)        
                                               
Constant                   4.76602700***       
                           (0.09704447)        
                                               
-----------------------------------------------
Observations                    88             
R2                          0.58829480         
Adjusted R2                 0.57860770         
Residual Std. Error    0.19706340 (df = 85)    
F Statistic         60.72921000*** (df = 2; 85)
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

Using the data from HPRICE1, we get the following model:

$$log(price)=4.766+0.0003795sqrft+0.02889bdrms$$ with an $n=88$ and $R^2=0.588$.

Using our model we get the following estimation: 
$$\hat{\theta_1}=150(.0003795)+0.02889=0.0858$$

```r
theta <- 150*mrm1$coefficients[2]+mrm1$coefficients[3]
theta
```

```
     sqrft 
0.08580134 
```

This means that when we add a 150 sqft bedroom, then we can expect the home price to increase by about 8.6%

### (ii)

We can rewrite $\beta_2=\theta_1-150\beta_1$. In our model, we can substitute to have the following:

$$log(price)=\beta_0+\beta_1(sqrft-150bdrms)+\theta_1bdrms + u$$

### (iii)


```r
d1$bdrms_150 <- d1$bdrms*150
d1$bdrms_theta <- d1$bdrms*theta
se1 <- lm(lprice~(sqrft-bdrms_150)+(bdrms_theta), d1)
stargazer(se1, type = 'text')
```

```

===============================================
                        Dependent variable:    
                    ---------------------------
                              lprice           
-----------------------------------------------
sqrft                        0.0004***         
                             (0.00004)         
                                               
bdrms_theta                    0.337           
                              (0.345)          
                                               
Constant                     4.766***          
                              (0.097)          
                                               
-----------------------------------------------
Observations                    88             
R2                             0.588           
Adjusted R2                    0.579           
Residual Std. Error       0.197 (df = 85)      
F Statistic           60.729*** (df = 2; 85)   
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```



## Question 7

### (i)


```r
d2 <- k401ksubs
d2  %>% 
  filter(fsize==1) %>% 
  count()
```

```
##      n
## 1 2017
```

There are 2017 single person households in the dataset.

### (ii)


```r
d2a <- d2 %>% 
  filter(fsize==1)
mrm2 <- lm(nettfa~inc+age, d2a)
stargazer(mrm2, type='text')
```

```
## 
## ===============================================
##                         Dependent variable:    
##                     ---------------------------
##                               nettfa           
## -----------------------------------------------
## inc                          0.799***          
##                               (0.060)          
##                                                
## age                          0.843***          
##                               (0.092)          
##                                                
## Constant                    -43.040***         
##                               (4.080)          
##                                                
## -----------------------------------------------
## Observations                   2,017           
## R2                             0.119           
## Adjusted R2                    0.118           
## Residual Std. Error     44.683 (df = 2014)     
## F Statistic          136.465*** (df = 2; 2014) 
## ===============================================
## Note:               *p<0.1; **p<0.05; ***p<0.01
```

Using only single family households, we get the model:

$$nettfa=-43.040+0.799inc+0.843age$$
With an $n=2017$ and $R^2=0.119$. This means that for every \$1 thousand increase in income means an estimated \$799 increase in net wealth. For $\beta_2$ we interpret that for every year increase, we estimate a \$843 net wealth increase. These numbers make sense, and is not too surprising.

### (iii)

The intercept, $\hat{\beta_0}=-43.040$, means that at age 0 and income = 0, their net wealth is $-43.04. In other words, you are born in debt. 

### (iv)



### (v)


## Question 8

### (i)


```r
d3 <- discrim
mrm3 <- lm(lpsoda~prpblck+lincome+prppov, d3)
stargazer(mrm3, type='text')
```

```

===============================================
                        Dependent variable:    
                    ---------------------------
                              lpsoda           
-----------------------------------------------
prpblck                       0.073**          
                              (0.031)          
                                               
lincome                      0.137***          
                              (0.027)          
                                               
prppov                       0.380***          
                              (0.133)          
                                               
Constant                     -1.463***         
                              (0.294)          
                                               
-----------------------------------------------
Observations                    401            
R2                             0.087           
Adjusted R2                    0.080           
Residual Std. Error      0.081 (df = 397)      
F Statistic           12.604*** (df = 3; 397)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

We get the following model:

$$log(psoda)=-1.463+0.073prpblck+0.137log(income)+0.380prppov$$

With an $n=401$ and $R^2=0.087$. AT the 5% level, $\hat{\beta_1}$ is statistically significant, but it is not significant at the 1% level.

### (ii)


```r
pander(cor.test(d3$lincome,d3$prppov))
```


----------------------------------------------------------------------------
 Test statistic   df        P value        Alternative hypothesis     cor   
---------------- ----- ------------------ ------------------------ ---------
     -31.04       407   2.349e-109 * * *         two.sided          -0.8385 
----------------------------------------------------------------------------

Table: Pearson's product-moment correlation: `d3$lincome` and `d3$prppov`


### (iii)


