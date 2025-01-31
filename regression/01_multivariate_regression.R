# Set seed for reproducibility
set.seed(123)

# Number of observations (samples)
n <- 100  

# Number of predictor variables
p <- 3    

# Generate independent variables (X)
X <- matrix(rnorm(n * p, mean = 5, sd = 2), n, p)  # Normal distribution

# Define true regression coefficients (β)
beta0 <- 2
beta <- c(2, -1.5, 3)  # True values of coefficients
b <- c(beta0, beta)

# Generate error term (ε) from normal distribution
epsilon <- rnorm(n, mean = 0, sd = 1)

# Compute response variable Y
Y <- beta0 + X %*% beta + epsilon  # Y = Xβ + ε

# Convert X to a data frame for modeling
df <- as.data.frame(cbind(Y, X))
colnames(df) <- c("Y", "X1", "X2", "X3")  # Naming the variables

# Fit the multivariate regression model
model <- lm(Y ~ X1 + X2 + X3, data = df)

# Display the summary of the regression model
print(summary(model))
est_b <- model$coefficients

# Diagnostic plots to check model assumptions
par(mfrow = c(2, 2))
plot(model)

library(lmtest)
print(bptest(model))

print(norm(b - est_b, type="2"))
