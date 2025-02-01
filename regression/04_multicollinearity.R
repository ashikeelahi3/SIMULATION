# install.packages("car")
library(car)
rm(list=ls())
n <- 100
x1 <- rnorm(n, mean = 5, sd = 2)
x2 <- x1 + rnorm(n, mean = 0, sd = 0.5)
x3 <- rnorm(n, mean = 0, sd = 0.5)
e <- rnorm(n, mean = 0, sd = 1)

beta_0 <- -20
beta <- c(1, -3, 4)
Y <- beta_0 + beta[1]*x1 + beta[2]*x2 + beta[3]*x3 + e
df <- as.data.frame(cbind(Y, x1, x2, x3))
colnames(df) <- c("Y", "X1", "X2", "X3")  # Naming the variables

model <- lm(Y ~ x1 + x2 + x3, data = df)

print(summary(model))

print(vif(model))


# Calculate correlation matrix
cor_matrix <- cor(df[,c("X1", "X2", "X3")])
print("Correlation Matrix:")
print(cor_matrix)

# P value of correlation test 
p.value <- cor.test(df$X1, df$X2)$p.value
print("P value of correlation test between X1 and X2:")
print(p.value)

p.value <- cor.test(df$X1, df$X3)$p.value
print("P value of correlation test between X1 and X2:")
print(p.value)

p.value <- cor.test(df$X2, df$X3)$p.value
print("P value of correlation test between X1 and X2:")
print(p.value)



# Ridge Regression
