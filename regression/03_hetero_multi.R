library(lmtest)

n <- 100
p <- 4

X <- matrix(rnorm(n * p, mean = 5, sd = 2), n, p)

beta0 <- 20
beta <- c(2, -1.5, 3, 4)
b <- c(beta0, beta)


print("Before outlier")
epsilon <- rnorm(n, mean = 0, sd = 0.5)

Y <- beta0 + X %*% beta + epsilon

df <- as.data.frame(cbind(Y, X))
colnames(df) <- c("Y", "X1", "X2", "X3", "X4")

model <- lm(Y ~ X1 + X2 + X3 + X4, data = df)
est_b <- model$coefficients

# print(summary(model))
# par(mfrow = c(2, 2))
# plot(model)

print(bptest(model))
print(paste("Norm of beta", norm(b - est_b, type="2")))

print("After outlier")

epsilon <- rnorm(n, mean = 0, sd = 0.5 * X %*% beta)

Y <- beta0 + X %*% beta + epsilon

df <- as.data.frame(cbind(Y, X))
colnames(df) <- c("Y", "X1", "X2", "X3", "X4")

model <- lm(Y ~ X1 + X2 + X3 + X4, data = df)
est_b <- model$coefficients

# print(summary(model))
# par(mfrow = c(2, 2))
# plot(model)
print(bptest(model))
print(paste("Norm of beta", norm(b - est_b, type="2")))

print("--------------------------------")