---
title: "HW4 Group 1, Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Oct 15 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---

\newpage


# Problems

## Question 1

### (i)

If they trade sleep for work, then $\beta_1$ would have a negative sign ($\beta_1 < 0$)

### (ii)

I would think that $\beta_2$ and $\beta_3$ will have positive signs. However, I think it is hard to tell if someone with more education would more inclined to get a healthy amount of sleep, or be pressed to pursue their desires in academic or research fields causing them to lose out on sleep and pursue their goals.

### (iii)

Since we are measuring in minutes we first calculate 5 hours in minutes: $5*60=300$. Since sleep is predicted to fall by $0.148 * 300$, that gives us a total of 44.4, or approximately 45 minutes of lost sleep. This really is not a large trade off considering that this would be 45 minutes per week of lost sleep or about 6 minutes per night.

### (iv)

The negative sign of our our $educ$ coefficient means that the more education we get, the less sleep we are likely to get. The magnitude does not have a large impact however. If we assume someone with a high school degree versus a Bachelors degree is a four year difference, that means a college graduate loses about $(-11.13*4)$ 45 minutes of sleep a week.

### (v)

The model returns an $R^2$ value of only 11.3%, so the explanatory variables do not explain a lot of variation in this model. We are overlooking many other things like marital status, kids, income, or health.

\newpage

## Question 2

### (i)

We would expect to have $\beta_5\leq0$ because the higher the rank the *less* prestigious that law school is. In other words, for each increase rank (i.e. 2 to 3 or 30 to 31) you are thought to be less prestigious and therefore have a lower salary.

### (ii)

I would expect the other variable to have the following signs:

  - $LSAT$ and $GPA$ would most likely be positive as these are measures that don't depend on what school you attend, so someone who scored higher and had a higher GPA is more likely to have a higher salary.
  - $libvol$ and $cost$ are also more likely to have positive signs as well as they indicate a better rank of the school and would therefore lead to higher salaries.

### (iii)

That would be the $GPA$ coefficient expressed as a percent, so **24.8%**

### (iv)

The coefficient on $log(libvol)$ implies that a **1%** increase in library volume translates to a **0.095%** increase in median starting salary, ceteris paribus. 

### (v)

I would say you are better off going to a school with a lower rank. The difference between schools ranked 20 apart would be $100*0.0033*20$ or about 6.6% less in starting median salary.

\newpage

## Question 3

### (i)

$R^2$ could have decreased because we have reduced the number in the sample from 142 -> 99.

\newpage 

## Question 4




### (i)


```r
house_mrm <- lm(price~sqrft+bdrms, data = house)
stargazer(house_mrm, type = 'text')
```

```

===============================================
                        Dependent variable:    
                    ---------------------------
                               price           
-----------------------------------------------
sqrft                        0.128***          
                              (0.014)          
                                               
bdrms                         15.198           
                              (9.484)          
                                               
Constant                      -19.315          
                             (31.047)          
                                               
-----------------------------------------------
Observations                    88             
R2                             0.632           
Adjusted R2                    0.623           
Residual Std. Error      63.045 (df = 85)      
F Statistic           72.964*** (df = 2; 85)   
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

From our regression results, our estimated model would be:

$$price=(-19.315)+(0.128)sqrft+(15.198)bdrms$$
This give $R^2=0.632$ and a sample of $n=88$

### (ii)

Holding square footage constant, if we add one more bedroom the price would increase by 15.2 thousand ($15,200).

### (iii)

If we add a bedroom and thus creating an additional 140 square feet in size to the house, the estimated price would be: $0.128*140+15.198*1 = 33.12$ or approximately \$33.1 thousand ($33,100). This is more than double the price of just adding a bedroom.

### (iv)

Using our $R^2$ value, the model explains about 63% of variation from square footage and number of bedrooms.

### (v)

If a home has 2,438sqft and 4 bedrooms, it will be predicted to sale for:
$$-19.315+(0.128*2438)+(15.198*4) = 353.54$$
Or $353,540 

### (vi)

If the actual sale price for this home was \$300,000, but the predicted price was \$353,540, then the residual would be $\$300,000-\$353,540 =-\$54,540$. This would mean that the buyer underpaid for this house. 

\newpage 

## Question 5




### (i)


```r
discrim_summary <- price %>% 
  select(prpblck, income) %>% 
  filter(!is.na(prpblck),
         !is.na(income)) %>% 
  summarise_all(list(mean, sd)) %>% 
  rename('Mean (prpblck)' = prpblck_fn1,
         'Mean (Income)' = income_fn1,
         'SD (prpblck)' = prpblck_fn2,
         'SD (income)' = income_fn2)

pander(discrim_summary)
```


-------------------------------------------------------------
 Mean (prpblck)   Mean (Income)   SD (prpblck)   SD (income) 
---------------- --------------- -------------- -------------
     0.1135           47054          0.1824         13179    
-------------------------------------------------------------

The units for these measures are dollars for income and `prpblck` represents the proportion of the black population.

### (ii)


```r
discrim_mrm <- lm(psoda~prpblck+income, data = price)
stargazer(discrim_mrm, type='text', digits = 10)
```

```

==================================================
                         Dependent variable:      
                    ------------------------------
                                psoda             
--------------------------------------------------
prpblck                    0.1149882000***        
                            (0.0260006400)        
                                                  
income                     0.0000016027***        
                            (0.0000003618)        
                                                  
Constant                   0.9563196000***        
                            (0.0189920100)        
                                                  
--------------------------------------------------
Observations                     401              
R2                           0.0642203900         
Adjusted R2                  0.0595179800         
Residual Std. Error    0.0861147000 (df = 398)    
F Statistic         13.6569100000*** (df = 2; 398)
==================================================
Note:                  *p<0.1; **p<0.05; ***p<0.01
```

Basing our model of the above regression output, we would get the following model: 
$$\hat{psoda}=(0.9563)+(0.115)prpblck+(0.0000016)income$$ 

\newline

The resulting $R^2=0.064$ with a sample size of $n = 401$.  Since $prpblck$ already represents proportion, a 1 increase would represent a 100% increase, not a single unit. So to make this interpretation more meaningful, we will consider a 0.01 increase (or a 1% increase) in $prpblck$ to interpret our results. If we take our $\beta_1$ coefficient of $0.115*0.01$ we get an increase of less than 1 cent, or essentially no effect. On an individual transaction level, this effect seems minuscule. However, if populations increase more dramatically, say 10%-20% we would observe large increases in the the price of soda. 

### (iii)


```r
discrim_srm <- lm(psoda~prpblck, data = price)
stargazer(discrim_srm, type='text', digits = 10)
```

```

=================================================
                         Dependent variable:     
                    -----------------------------
                                psoda            
-------------------------------------------------
prpblck                    0.0649268700***       
                           (0.0239569700)        
                                                 
Constant                   1.0373990000***       
                           (0.0051904520)        
                                                 
-------------------------------------------------
Observations                     401             
R2                          0.0180755100         
Adjusted R2                 0.0156145500         
Residual Std. Error    0.0881017700 (df = 399)   
F Statistic         7.3448910000*** (df = 1; 399)
=================================================
Note:                 *p<0.1; **p<0.05; ***p<0.01
```

When we control for income, the estimated coefficient for prpblck is 0.065, which is much lower than the estimate that did not control for income. This means that the discrimination effect goes down when we do not include income in our model.

\newpage

### (iv)


```r
discrim_log <- lm(log(psoda)~prpblck+log(income), data = price)
stargazer(discrim_log, type='text')
```

```

===============================================
                        Dependent variable:    
                    ---------------------------
                            log(psoda)         
-----------------------------------------------
prpblck                      0.122***          
                              (0.026)          
                                               
log(income)                  0.077***          
                              (0.017)          
                                               
Constant                     -0.794***         
                              (0.179)          
                                               
-----------------------------------------------
Observations                    401            
R2                             0.068           
Adjusted R2                    0.063           
Residual Std. Error      0.082 (df = 398)      
F Statistic           14.540*** (df = 2; 398)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

The estimated model is: $$\hat{psoda}=-0.794+0.122prpblck+0.077log(income)$$

Where $R^2=0.068$ and $n = 401$

\newline

If $prpblck$ increases by 0.20, then we predict the price of soda to increase by $0.122 *0.20=0.0244$ or **2.44%**

\newpage

### (v)


```r
discrim_pov <- lm(psoda~prpblck+log(income)+prppov, data = price)
stargazer(discrim_pov, type='text')
```

```

===============================================
                        Dependent variable:    
                    ---------------------------
                               psoda           
-----------------------------------------------
prpblck                       0.075**          
                              (0.032)          
                                               
log(income)                  0.142***          
                              (0.028)          
                                               
prppov                       0.396***          
                              (0.139)          
                                               
Constant                      -0.512*          
                              (0.308)          
                                               
-----------------------------------------------
Observations                    401            
R2                             0.085           
Adjusted R2                    0.078           
Residual Std. Error      0.085 (df = 397)      
F Statistic           12.289*** (df = 3; 397)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

The estimated model is: $$\hat{psoda}=-0.512+0.073prpblck+0.137log(income)+0.380prppov$$

Where $R^2=0.087$ and $n = 401$

\newline 

When we add $prppov$ to the model, our coefficient falls from 0.122 to 0.073.

### (vi)


```r
cor(log(price$income), price$prppov, method = 'pearson', use = 'complete.obs')
```

```
[1] -0.838467
```

The correlation is $≈-0.8385$. I would expect this because you would expect income to decrease with higher poverty rates.

### (vii)

Because they are not perfectly correlated and only highly correlated, they should remain in the analysis as they add an additional variable to help explain the effect of discrimination in the data.


 
