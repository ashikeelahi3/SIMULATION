# Simulation Exercises in R

Practice these problems to learn simulation techniques in R:

---

## 1. Simulating Coin Flips  

**Objective**: Simulate flipping a fair/unfair coin and estimate probabilities.  
**Task**:  

- Flip a fair coin (`P(heads) = 0.5`) 100 times using `sample()`.  
- Calculate the proportion of heads.  
- Repeat for an unfair coin (`P(heads) = 0.7`).  
**Key Functions**: `sample()`, `mean()`, `replicate()`.

---

## 2. Law of Large Numbers  

**Objective**: Demonstrate how sample means converge to population means.  
**Task**:  

- Simulate rolling a die (`1:6`) with `sample()` for increasing sample sizes (10, 100, 1000).  
- Plot the sample mean vs. sample size to show convergence to the true mean (3.5).  
**Key Functions**: `cummean()` (from `dplyr`), `plot()`.

---

## 3. Central Limit Theorem (CLT)  

**Objective**: Show that sample means follow a normal distribution.  
**Task**:  

- Simulate 1000 samples of size `n = 30` from an exponential distribution (`rexp()`).  
- Calculate the mean of each sample.  
- Plot a histogram of the sample means and overlay a normal curve.  
**Key Functions**: `rexp()`, `replicate()`, `hist()`, `dnorm()`.

---

## 4. Monte Carlo Integration  

**Objective**: Estimate π (pi) using random sampling.  
**Task**:  

- Generate random points in a unit square (`x, y ~ Uniform(0,1)`).  
- Calculate the proportion of points inside the unit circle (`x² + y² ≤ 1`).  
- Multiply by 4 to approximate π.  
**Key Functions**: `runif()`, logical indexing.

---

## 5. Gambler’s Ruin Problem  

**Objective**: Simulate a simple stochastic process.  
**Task**:  

- A gambler starts with $10 and bets $1 per round with `P(win) = 0.5`.  
- Simulate their wealth over time until they reach $0 or $20.  
- Repeat 100 times and calculate the probability of ruin.  
**Key Functions**: `while()`, loops, `replicate()`.

---

## 6. Simulating Random Walks  

**Objective**: Model a 1D/2D random walk.  
**Task**:  

- Simulate a particle starting at 0 and moving ±1 with equal probability for 100 steps.  
- Plot its trajectory.  
- Extend to 2D (up/down/left/right).  
**Key Functions**: `cumsum()`, `plot()`, `matrix()`.

---

## 7. Bootstrapping Confidence Intervals  

**Objective**: Estimate confidence intervals without parametric assumptions.  
**Task**:  

- Generate a skewed dataset (e.g., `rgamma(100, shape=2)`).  
- Resample with replacement 1000 times and compute the mean of each bootstrap sample.  
- Use quantiles of the bootstrap means to create a 95% confidence interval.  
**Key Functions**: `sample()`, `replicate()`, `quantile()`.

---

## 8. Simulating Queues (M/M/1)  

**Objective**: Model a simple queuing system.  
**Task**:  

- Simulate customer arrivals (`~ Poisson(λ)`) and service times (`~ Exponential(μ)`).  
- Track waiting times and queue lengths over time.  
- Analyze the impact of λ and μ on congestion.  
**Key Functions**: `cumsum()`, `diff()`, loops.

---

## 9. Simulating Disease Spread  

**Objective**: Model an SIR (Susceptible-Infected-Recovered) epidemic.  
**Task**:  

- Start with 1 infected person in a population of 100.  
- Simulate daily infections (`P(infection) = 0.02`) and recovery after 7 days.  
- Plot the number of infected individuals over time.  
**Key Functions**: Vectors to track states, loops.

---

## 10. Simulating Stock Prices  

**Objective**: Model geometric Brownian motion for stock prices.  
**Task**:  

- Use the formula:  
  `S_t = S_0 * exp((μ - σ²/2)t + σW_t)`  
  where `W_t` is a Wiener process (random walk).  
- Simulate 5 stock price paths over 1 year.  
**Key Functions**: `rnorm()`, `cumprod()`, `matplot()`.

---

## Next Steps  

1. Start with **Problems 1–3** to master basics of sampling and distributions.  
2. Use `set.seed()` for reproducibility.  
3. Visualize results with `ggplot2` or base R plots.  
4. Gradually tackle problems involving loops/stochastic processes (e.g., Gambler’s Ruin).  

**Let me know which problem you’d like to solve first!** 🚀