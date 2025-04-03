# Load required packages
library(gfpop)
library(igraph)
# Source the plotModel function
source("plotModel.R")

# SIMPLE WORKING EXAMPLE THAT WILL WORK WITH ALL VERSIONS OF GFPOP
# First create a graph without the rule parameter
simple_graph <- gfpop::graph(
  Edge(state1 = "normal", state2 = "normal", type = "null"),
  Edge(state1 = "normal", state2 = "normal", type = "std", penalty = 5.5),
  Edge(state1 = "normal", state2 = "normal", type = "null"),
  Edge(state1 = "noChange", state2 = "noChange", type = "null")
)

# Then add the rule parameter to the edges data frame
simple_graph$edges$rule <- c(1, 1, 2, 2)

# Plot the simple graph
plotModel(simple_graph, title="Simple Graph Example")

# Example 2: Create the LOPART graph example from the problem description
# First create the graph without the rule parameter
LOPART_graph <- gfpop::graph(
  Edge(state1 = "normal", state2 = "normal", type = "null"),
  Edge(state1 = "normal", state2 = "normal", type = "std", penalty = 5.5),
  Edge(state1 = "normal", state2 = "normal", type = "null"),
  Edge(state1 = "noChange", state2 = "noChange", type = "null"),
  Edge(state1 = "normal", state2 = "noChange", type = "std"),
  Edge(state1 = "normal", state2 = "normal", type = "std"),
  Edge(state1 = "noChange", state2 = "normal", type = "null"),
  Edge(state1 = "normal", state2 = "normal", type = "null")
)

# Then add the rule parameter manually
LOPART_graph$edges$rule <- c(1, 1, 2, 2, 2, 3, 3, 4)

# Plot the LOPART graph
plotModel(LOPART_graph, title="LOPART Graph Example")
