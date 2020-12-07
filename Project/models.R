a <- sleep75
b <- a %>% 
            mutate(sleep_h = sleep/60) %>% 
            filter(inlf == 1)

summary(b$hrwage)

model1 <- summary(lm(sleep_h~hrwage, df))
model2 <- lm(sleep_h~age+smsa+exper+hrwage+yrsmarr+spsepay+male+gdhlth, df)
model3 <- lm(sleep_h~age+smsa+exper+I(log(hrwage))+yrsmarr+spsepay+male+gdhlth, df)
model4 <- summary(lm(sleep_h~age+hrwage+male, df))
model5 <- lm(sleep_h~age+I(hrwage*construc)+I(hrwage*clerical)+hrwage, df)


plot(model1$residuals)
plot(b$sleep_h, b$hrwage)

plot(lm(sleep_h~age+smsa+exper+hrwage+yrsmarr+spsepay+male+gdhlth, df))

df_train <- select(df, -c(sleep))
as.matrix(df_train)

lambda_seq <- 10^seq(2, -2, by = -.1)

lasso <- cv.glmnet(as.matrix(df_train), df$sleep_h, alpha = 1, nfolds = 5)
best_lam <- lasso$lambda.min

opt_lasso <- cv.glmnet(as.matrix(df_train), df$sleep_h, alpha = 1, lambda = best_lam)

stargazer(model2,model3, type='text')

### Machine Learning Test

cormatrix <- cor(sleep)

