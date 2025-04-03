# =============================================================
# SUPER SIMPLE EXAMPLE FOR NON-TECHNICAL USERS
# =============================================================
#
# HOW TO USE:
# 1. Make sure R is installed
# 2. Install required packages using the commands below:
#    install.packages("igraph")
#    install.packages("remotes")  
#    remotes::install_github("vrunge/gfpop")
# 3. Run this script line by line (use Ctrl+Enter to run each line)

# Load the required packages
library(gfpop)
library(igraph)

# First check if we're in the right directory
current_dir <- getwd()
cat("Current directory:", current_dir, "\n")

# Try to find and source the plotModel.R file
if(file.exists("plotModel.R")) {
  source("plotModel.R")
  cat("Found plotModel.R in current directory\n")
} else if(file.exists("easy_test/plotModel.R")) {
  source("easy_test/plotModel.R")
  cat("Found plotModel.R in easy_test subdirectory\n")
} else {
  stop("Cannot find plotModel.R file. Please make sure you're in the right directory.")
}

# =============================================================
# STEP 1: CREATE A GRAPH BY DEFINING THE EDGES
# =============================================================

# Create a simple graph using a safer approach that works with all gfpop versions
# First create a basic graph structure
my_graph <- list()

# Create the edges data frame from scratch
my_graph$edges <- data.frame(
  # From state
  state1 = c("up", "down", "up", "down"),
  
  # To state
  state2 = c("up", "down", "down", "up"),
  
  # Type of transition
  type = c("null", "null", "std", "std"),
  
  # Penalty for transition (0 means no penalty)
  penalty = c(0, 0, 10, 10),
  
  # Rule ID (which determines when this edge can be used)
  rule = c(1, 1, 1, 1),
  
  # Don't change this
  stringsAsFactors = FALSE
)

# Set the class to make it a proper gfpop graph object
class(my_graph) <- "graph"

# =============================================================
# STEP 2: VISUALIZE THE GRAPH
# =============================================================

# Create a nice plot of our graph
plotModel(my_graph, 
          title = "Simple Up-Down Graph",
          node_size = 40,
          arrow_size = 0.7)

# =============================================================
# STEP 3: CREATE A MORE COMPLEX GRAPH
# =============================================================

# This example shows multiple rules
complex_graph <- list()

# Define edges with multiple rules
complex_graph$edges <- data.frame(
  state1 = c("normal", "normal", "normal", "noChange", "normal", "noChange"),
  state2 = c("normal", "normal", "noChange", "noChange", "normal", "normal"),
  type = c("null", "std", "std", "null", "std", "null"),
  penalty = c(0, 5.5, 0, 0, 0, 0),
  rule = c(1, 1, 2, 2, 3, 3),
  stringsAsFactors = FALSE
)

# Set the class to make it a proper gfpop graph object
class(complex_graph) <- "graph"

# Visualize the complex graph
plotModel(complex_graph, 
          title = "Multi-Rule Graph Example",
          node_size = 35)

# =============================================================
# STEP 4: SAVE THE PLOT TO A FILE (OPTIONAL)
# =============================================================

# Uncomment these lines to save the plot as a PNG file
# png("my_graph.png", width = 800, height = 600)
# plotModel(complex_graph, title = "My Saved Graph")
# dev.off()

cat("Script completed successfully!\n")
