# Set seed for reproducibility
set.seed(123)

# Number of observations
n <- 100

# Generate independent variable (X) from normal distribution
X <- rnorm(n, mean = 5, sd = 2)

# Define true regression coefficient
beta0 <- 2   # Intercept
beta1 <- 3   # Slope

# Generate heteroscedastic error: variance depends on X
epsilon <- rnorm(n, mean = 0, sd = 0.5 * X)  # Error var increases with X

# Compute response variable Y
Y <- beta0 + beta1 * X + epsilon

# Create data frame
df <- data.frame(Y, X)

# Fit linear regression model
model <- lm(Y ~ X, data = df)

# Display summary
summary(model)

# Plot residuals to visualize heteroscedasticity
par(mfrow = c(1, 2))
plot(X, residuals(model), main = "Residuals vs X", xlab = "X", ylab = "Residuals")
abline(h = 0, col = "red")

# Perform Breusch-Pagan Test for heteroscedasticity
library(lmtest)
print(bptest(model))
