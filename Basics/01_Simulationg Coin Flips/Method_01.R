# Simulate FAIR coin (50/50 probability)
set.seed(123)  # For reproducibility
fair_coin <- sample(c("H", "T"), 
                    size = 100, 
                    replace = TRUE, 
                    prob = c(0.5, 0.5))

# Calculate proportion of heads
fair_prop <- mean(fair_coin == "H")
cat("Fair coin proportion of heads:", fair_prop, "\n")

# Simulate UNFAIR coin (70/30 probability)
unfair_coin <- sample(c("H", "T"), 
                      size = 100, 
                      replace = TRUE, 
                      prob = c(0.7, 0.3))

# Calculate proportion of heads
unfair_prop <- mean(unfair_coin == "H")
cat("Unfair coin proportion of heads:", unfair_prop)

