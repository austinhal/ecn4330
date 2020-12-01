---
title: "HW11 Group 1, Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Dec 1 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---

\newpage

# Problems



## Question 1

### (i)

## Question 2

### (i)

The transformed equation would be found by dividing the original, $beer$, by $inc$, which would give us:

$$\frac{beer}{inc}=\beta_0(\frac{1}{inc})+\beta_1+\beta_2(\frac{price}{inc})+\beta_3(\frac{educ}{inc})+\beta_4(\frac{female}{inc})+(\frac{u}{inc})$$

## Question 3

### (i)

It would be **False** because WLS estimates could have more or less bias based on the degree of correlation between the error term in explanatory variables when an important 

\newpage

## Question 4

### (i)

Since our *df* would be the number that values can vary, we now that in our numerator, the degrees of freedom is K+1. For our denominator, the degrees of freedom is n-k-2.

### (ii)

The $R^2$ will always be at least as large from the BP regression and White test because in the BP test, the added variable is $\hat{y_i}^2$, which will always be no less than the original. For the White test, the fitted values are linear functions of the regressors. So we can conclude that the original $R^2$ value is greater or equal to the White test $R^2$.

### (iii)

If we look at our F-test formula, we can see that as $R^2$ increases, so does our test value. So we can conclude that our test doesn't depend on $R^2$, rather, degrees of freedom is more important. Since all three tests have different *df*, it is hard to say which test gives a smaller p-value.

### (iv)

I think that it would be a bad idea. Since our equation already includes $\hat{y_i}^2$, if we add $\hat{y_i}$, our model would suffer from perfect collinearity.

\newpage

# Computer Exercises

## Question 5

### (i)

Given that our variance should only rely on gender, our model would then look like: $Var(u|male)=\sigma_0+\sigma_1$ where women are represented by $\sigma_0$ and men by $\sigma_1$

### (ii)


```r
df4 <- sleep75
wls4a <- lm(sleep~totwrk+educ+age+I(age^2)+yngkid+male, df4)
pander(summary(wls4a))
```


------------------------------------------------------------------
     &nbsp;        Estimate   Std. Error    t value     Pr(>|t|)  
----------------- ---------- ------------ ------------ -----------
 **(Intercept)**     3841       239.4        16.04      1.51e-49  

   **totwrk**      -0.1634     0.01816       -8.997     2.153e-18 

    **educ**        -11.71      5.872        -1.995      0.04645  

     **age**        -8.697      11.33       -0.7677      0.4429   

  **I(age^2)**      0.1284      0.1347       0.9538      0.3405   

   **yngkid**      -0.0228      50.28      -0.0004535    0.9996   

    **male**        87.75       34.67        2.531       0.01158  
------------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     706                418           0.1228       0.1152     
--------------------------------------------------------------

Table: Fitting linear model: sleep ~ totwrk + educ + age + I(age^2) + yngkid + male

### (iii)

\newpage

## Question 6

### (i)


```r
df6 <- hprice1 
wls6a <- lm(price~lotsize+sqrft+bdrms, df6, method = )
wls6b <- lm(price~lotsize+sqrft+bdrms, df6)
pander(summary(wls6))
```

Quitting from lines 89-93 (HW11_G1_Halvorsen.Rmd) 
Error in summary(wls6) : object 'wls6' not found
Calls: <Anonymous> ... withCallingHandlers -> withVisible -> eval -> eval -> pander -> summary


### (ii)
### (iii)

\newpage

## Question 7

### (i)
### (ii)
### (iii)

\newpage

## Question 8

### (i) 
### (ii)

Our fitted values are all between 0 and 1. 

