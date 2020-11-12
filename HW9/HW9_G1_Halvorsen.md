---
title: "HW9 Group 1, Austin Halvorsen"
author: "Pedram Jahangiry"
date: "Nov 12 2020"
output:
  word_document: 
    keep_md: yes
  pdf_document: default
---

\newpage

# Problems



## Question 1

### (i)

We can find the where the marginal effect becomes negative by $\frac{0.0003}{0.000000014}=21,428.57$. This would mean that at $21,428.57, the effect of sales on rdintens, becomes negative.
 
### (ii)

I would keep the quadratic term if the impact was significant. Given that $\frac{-.0000000070}{.0000000037}=-1.892$ which is greater than our critical value of 0.256m I would reject the null and leave the variable in, since it has a significant impact to our model.

### (iii)

$salesbil$ would be sales divided by 1000. This means that our coefficients would be multiplied by 1000, as well as our standard error. With our quadratic term, we need to remember to multiply that terms coefficient by $1000^2$. This would give us a new model of: $$\hat{rdintens}=2.613+0.30salesbil-0.0070salesbil^2$$

### (iv)

I definitely prefer the second equation. With leading zeros gone, the results are much easier to interpret and we aren't confused by having to count them all up to see what the effect is. 

\newpage

## Question 2

---------

\newpage

# Computer Exercises

## Question 3

### (i)

```r
df <- kielmc
df_1981 <- df %>% filter(df$year==1981)
```

Given that if increased distance would most likely increase the value of your home, I would expect that the sign of $\beta_1$ would be positive.


```r
srm1 <- lm(lprice~ldist, df_1981)
pander(summary(srm1))
```


---------------------------------------------------------------
     &nbsp;        Estimate   Std. Error   t value   Pr(>|t|)  
----------------- ---------- ------------ --------- -----------
 **(Intercept)**    8.047       0.6462      12.45    1.998e-24 

    **ldist**       0.3649     0.06576      5.548    1.395e-07 
---------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     142              0.3543          0.1803       0.1744     
--------------------------------------------------------------

Table: Fitting linear model: lprice ~ ldist

Running our model, we get: $\hat{log(price)}=8.047+0.3649log(dist)$ with an $n=142$ and an adjusted $R^2=0.1744$. This means that for each 1% increase in distance from the incinerator, we would expect to see home prices increase by approximately 0.37%.

### (ii)


```r
srm2 <- lm(lprice~ldist+lintst+larea+lland+rooms+baths+age, df_1981)
pander(summary(srm2))
```


----------------------------------------------------------------
     &nbsp;        Estimate    Std. Error   t value   Pr(>|t|)  
----------------- ----------- ------------ --------- -----------
 **(Intercept)**     7.592       0.6417      11.83    1.476e-22 

    **ldist**       0.05539     0.05762     0.9613     0.3381   

   **lintst**      -0.03904     0.05166     -0.7556    0.4512   

    **larea**       0.3193      0.07642      4.178    5.265e-05 

    **lland**       0.07683      0.0395      1.945     0.0539   

    **rooms**       0.04253     0.02825      1.505     0.1346   

    **baths**       0.1669      0.04194      3.98     0.0001125 

     **age**       -0.003567    0.001059    -3.369    0.0009849 
----------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     142               0.201          0.7475       0.7344     
--------------------------------------------------------------

Table: Fitting linear model: lprice ~ ldist + lintst + larea + lland + rooms + baths + age

Running this model, we get: 
$$\hat{log(price)}=7.592+0.055log(dist)-0.039log(intst)+0.3193log(area)+0.0768log(land)+0.0425rooms+0.1669baths-0.0036age$$
with an $n=142$ and an adjusted $R^2=0.7344$

After running the model with the additional variables, we had our first model give us that distance was significant to our model, however now, it has a t value less than one, and it is not significant in our second model. Essentially, by controlling for distance, it may not be as important as we thought it was in our simple regression analysis. The conflicting results in our model come from our scope. In the first, we are only looking at distance and price. In our new model, we are controlling for distance and can see the effect of the other factors and how they influence price.

### (iii)


```r
srm3 <- lm(lprice~ldist+lintst+larea+lland+rooms+baths+age+I(lintst^2), df_1981)
pander(summary(srm3))
```


----------------------------------------------------------------
     &nbsp;        Estimate    Std. Error   t value   Pr(>|t|)  
----------------- ----------- ------------ --------- -----------
 **(Intercept)**    -3.317       2.646      -1.254     0.2121   

    **ldist**       0.1852      0.06235      2.971    0.003524  

   **lintst**        2.073       0.501       4.138    6.189e-05 

    **larea**       0.3593      0.07262      4.948    2.224e-06 

    **lland**       0.09138     0.03738      2.445     0.01581  

    **rooms**       0.03811     0.02664      1.431     0.1549   

    **baths**       0.1496      0.03973      3.764     0.00025  

     **age**       -0.002927    0.001009     -2.9     0.004363  

 **I(lintst^2)**    -0.1193     0.02817     -4.236    4.228e-05 
----------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     142              0.1894          0.7775       0.7642     
--------------------------------------------------------------

Table: Fitting linear model: lprice ~ ldist + lintst + larea + lland + rooms + baths + age + I(lintst^2)

Adding in $log(intst)^2$, our adjusted $R^2$ value increases from 0.7344 to 0.7642. Interestingly, our factor log(dist) changes from insignificant, to significant, just by adding the new factor. Mainly, we can observe a big influence on our variables log(dist) and log(intst). Functional form is important to consider when analyzing your data, because you need to be aware of the transformations it is making on your data. It could completely change the interpretation of your model from factors having positive or negative influence, or from being insignificant to significant.

### (iv)


```r
srm4 <- lm(lprice~ldist+I(ldist^2)+lintst+larea+lland+rooms+baths+age+I(lintst^2), df_1981)
pander(summary(srm4))
```


----------------------------------------------------------------
     &nbsp;        Estimate    Std. Error   t value   Pr(>|t|)  
----------------- ----------- ------------ --------- -----------
 **(Intercept)**    -5.921       8.295      -0.7138    0.4766   

    **ldist**       0.8711       2.071      0.4207     0.6747   

 **I(ldist^2)**     -0.0365      0.1101     -0.3314    0.7409   

   **lintst**        1.934       0.6543      2.956    0.003694  

    **larea**       0.3553      0.07387      4.81     4.053e-06 

    **lland**       0.08785     0.03898      2.254     0.02586  

    **rooms**       0.03806     0.02673      1.424     0.1568   

    **baths**       0.1507      0.04002      3.766    0.0002489 

     **age**       -0.002869    0.001027    -2.794    0.005988  

 **I(lintst^2)**    -0.1107     0.03835     -2.887    0.004546  
----------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     142               0.19           0.7777       0.7626     
--------------------------------------------------------------

Table: Fitting linear model: lprice ~ ldist + I(ldist^2) + lintst + larea + lland + rooms + baths + age + I(lintst^2)

By adding in $log(dist)^2$, it is not significant in our model, so there is no reason to add it into our model. Additionally, it makes our model less accurate, so we shouldn't add it.

\newpage

## Question 4

### (i)

```r
df2 <- wage2
```

Holding $exper$ and our $u$ elements fixed, we can rewrite our model as:

$$\Delta\log(wage)=\beta_1\Delta\ educ+\beta_3(\Delta educ)exper = (\beta_1+\beta_3exper)\Delta educ$$
This means that our proportion for approximating the change in wage for an additional year of education would look like. 

$$\frac{\Delta log(wage)}{\Delta educ}=(\beta_1+\beta_3exper)$$

### (ii)

If return to education does not depend on level of exper then $H_0: \beta_3=0$. However, if we believe that exper and educ have a positive interaction, meaning that people with more experience are more productive with an additional year of education, then our alternative hypothesis would be: $\beta_3>0$.

### (iii)


```r
mrm1 <- lm(lwage~educ+exper+I(educ*exper), df2) 
pander(summary(mrm1))
```


--------------------------------------------------------------------
       &nbsp;          Estimate   Std. Error   t value    Pr(>|t|)  
--------------------- ---------- ------------ --------- ------------
   **(Intercept)**      5.949       0.2408      24.7     5.034e-104 

      **educ**         0.04405     0.01739      2.533     0.01148   

      **exper**        -0.0215     0.01998     -1.076      0.2822   

 **I(educ * exper)**   0.003203    0.001529     2.095     0.03648   
--------------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     935              0.3923          0.1349       0.1321     
--------------------------------------------------------------

Table: Fitting linear model: lwage ~ educ + exper + I(educ * exper)

Running this model, our estimated model is: $\hat{log(wage)}=5.95+0.0440educ-0.0215exper+0.00320educ*exper$ with an $n=935$, $R^2=0.1349$ and $\bar{R}^2=0.132$. 

With a t value of 2.095, we reject the null hypothesis at the 5% level of significance.

### (iv)


```r
df2new <- df2 %>% mutate(exper10 = exper - 10)
mrm2 <- lm(lwage~educ+exper+I(educ*exper10), df2new)
pander(summary(mrm2))
```


----------------------------------------------------------------------
        &nbsp;           Estimate   Std. Error   t value    Pr(>|t|)  
----------------------- ---------- ------------ --------- ------------
    **(Intercept)**       5.949       0.2408      24.7     5.034e-104 

       **educ**          0.07608     0.006615     11.5     1.023e-28  

       **exper**         -0.0215     0.01998     -1.076      0.2822   

 **I(educ * exper10)**   0.003203    0.001529     2.095     0.03648   
----------------------------------------------------------------------


--------------------------------------------------------------
 Observations   Residual Std. Error   $R^2$    Adjusted $R^2$ 
-------------- --------------------- -------- ----------------
     935              0.3923          0.1349       0.1321     
--------------------------------------------------------------

Table: Fitting linear model: lwage ~ educ + exper + I(educ * exper10)

```r
pander(confint(mrm2))
```


---------------------------------------------
        &nbsp;            2.5 %      97.5 %  
----------------------- ---------- ----------
    **(Intercept)**       5.477      6.422   

       **educ**           0.0631    0.08906  

       **exper**         -0.0607    0.01771  

 **I(educ * exper10)**   0.000202   0.006204 
---------------------------------------------

Our new model look like: $log(wage)=\beta_0+\theta_1educ+\beta_2exper+\beta_3educ(exper-10)+u$. Running this regression with the new factor, we obtain $\hat{\theta_1}≈0.761$ and $se(\hat{\theta_1})≈0.0066$. The 95% confidence interval for $\theta_1$ is 0.0631 to 0.08906 


