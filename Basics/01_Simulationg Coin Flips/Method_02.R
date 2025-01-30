simulate_coin_flips <- function(n_trials, n_flips, prob_heads = 0.5) {
  # Simulate 1000 trials of 100 fair coin flips
  # It returns a matrix with 100 rows and 1000 columns
  p = prob_heads
  fair_sims <- replicate(
    n = n_flips, 
    expr = sample(c("H", "T"), 100, replace = TRUE, prob = c(p, 1-p))
  )
  print(dim(fair_sims))

  # Calculate proportion of heads in each trial
  fair_props <- colMeans(fair_sims == "H")

  # Analyze results
  hist(fair_props, main = "Distribution of Head Proportions (Fair Coin)")
  cat("Mean proportion:", mean(fair_props), "\n",
      " 95% Confidence Interval:", quantile(fair_props, c(0.025, 0.975)))
}

simulate_coin_flips(n_trials = 1000, n_flips = 100, prob_heads = 0.5)
simulate_coin_flips(n_trials = 1000, n_flips = 100, prob_heads = 0.7)
