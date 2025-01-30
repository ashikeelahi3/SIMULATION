library(ggplot2)

set.seed(123)

simulate_coin_flips <- function(n_trials, n_flips, prob_heads = 0.5) {
  p = prob_heads
  # Simulate 1000 trials of 100 fair coin flips
  fair_sims <- replicate(
    n = n_flips,
    expr = sample(c("H", "T"), 100, replace = TRUE, prob = c(p, 1-p))
  )

  # Calculate proportion of heads in each trial
  fair_props <- colMeans(fair_sims == "H")

  # Create data frame for ggplot
  results_df <- data.frame(proportion = fair_props)

  # Create plot
  ggplot(results_df, aes(x = proportion)) +
    geom_histogram(aes(y = after_stat(density)),
                  binwidth = 0.02,
                  fill = "skyblue",
                  color = "black") +
    geom_density(alpha = 0.2, linewidth = 1, color = "darkblue") +
    geom_vline(xintercept = mean(fair_props), 
              color = "red", 
              linewidth = 1, 
              linetype = "dashed") +
    geom_vline(xintercept = quantile(fair_props, c(0.025, 0.975)),
              color = "darkgreen",
              linewidth = 0.8,
              linetype = "dotted") +
    labs(title = "Distribution of Head Proportions (1000 Trials of 100 Flips)",
        x = "Proportion of Heads",
        y = "Density") +
    theme_minimal() +
    scale_x_continuous(limits = c(0, 1)) +
    annotate("text", x = 0.5, y = 8, 
            label = paste("Mean:", round(mean(fair_props), 3)),
            color = "red") +
    annotate("text", x = 0.4, y = 7, 
            label = "95% CI", 
            color = "darkgreen")
}

simulate_coin_flips(n_trials = 1000, n_flips = 100, prob_heads = 0.5)
simulate_coin_flips(n_trials = 1000, n_flips = 100, prob_heads = 0.7)
