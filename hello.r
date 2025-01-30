# Load necessary library
#install.packages("ggplot2")
library(ggplot2)

# Set a random seed for reproducibility
set.seed(42)

# Generate synthetic data
X <- runif(100, 0, 2)  # 100 random points in the range [0, 2]
y <- 4 + 3 * X + rnorm(100)  # Linear relation with some noise

# Create a data frame
data <- data.frame(X, y)

# Fit a linear regression model
model <- lm(y ~ X, data = data)

# Predict values
data$y_predict <- predict(model)

# Plotting the results
ggplot(data, aes(x = X, y = y)) +
  geom_point(color = 'blue', label = 'Data points') +
  geom_line(aes(y = y_predict), color = 'red', size = 1) +
  labs(title = 'Linear Regression Simulation', x = 'X', y = 'y') +
  theme_minimal()
