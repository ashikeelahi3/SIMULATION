# Initialize webR
library(webr)
webr::init()

# Install required packages
if (!require("webr")) {
  install.packages("webr", repos = c("https://repo.r-wasm.org", getOption("repos")))
}

# Function to generate random numbers
generateRandomNumbers <- function(n) {
  if (is.na(n) || n <= 0) {
    stop("Invalid input. Please provide a positive integer.")
  }
  
  # Generate 'n' random numbers between 0 and 1
  random_numbers <- runif(n)
  
  # Return the random numbers as a list
  return(list(random_numbers = random_numbers))
}

# Function to generate a histogram of the random numbers
generateHistogram <- function(n) {
  if (is.na(n) || n <= 0) {
    stop("Invalid input. Please provide a positive integer.")
  }
  
  # Generate 'n' random numbers between 0 and 1
  random_numbers <- runif(n)
  
  # Create a histogram
  hist_plot <- hist(random_numbers, breaks = 30, col = "lightblue", main = "Histogram of Random Numbers", xlab = "Random Numbers")
  
  # Return the plot as an image
  return(hist_plot)
}