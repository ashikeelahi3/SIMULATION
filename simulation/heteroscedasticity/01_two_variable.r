library(ggplot2)
install.packages("gridExtra")
library(gridExtra)
set.seed(123)
n = 500
alpha = 20
beta = 3
b = c(alpha, beta)

x = runif(n, 20, 50)


y = b[1] + b[2] * x + rnorm(n, mean = 0, sd = 0.5 + b[1]*x + b[2] * x)

model <- lm(y ~ x)
# list(y_hat = model$fitted.values , se = summary(model)$sigma)

# Fit GLS model using weights proportional to variance
weights <- 1/(0.5 + b[1]*x + b[2] * x)^2
gls_model <- lm(y ~ x, weights = weights)

# Compare OLS and GLS estimates
cat("\nOLS estimates:\n")
print(coef(model))
cat("\nGLS estimates:\n")
print(coef(gls_model))

# Create data frame with both OLS and GLS residuals
plot_data <- data.frame(
  x = x,
  y = y,
  ols_residuals = residuals(model),
  gls_residuals = residuals(gls_model),
  ols_fitted = fitted(model),
  gls_fitted = fitted(gls_model)
)

# Create combined plot
combined_plot <- ggplot(plot_data) +
  # Original data points
  geom_point(aes(x = x, y = y), size = 2, alpha = 0.3) +
  
  # Fitted lines
  geom_line(aes(x = x, y = ols_fitted, color = "OLS"), size = 1) +
  geom_line(aes(x = x, y = gls_fitted, color = "GLS"), size = 1) +
  
  # Customize colors and labels
  scale_color_manual(values = c("OLS" = "red", "GLS" = "blue")) +
  labs(title = "OLS vs GLS: Fitted Values",
       x = "x",
       y = "y",
       color = "Model") +
  theme_minimal()

# Display the plot
print(combined_plot)
