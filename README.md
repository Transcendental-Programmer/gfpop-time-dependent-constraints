# gfpop Time-Dependent Constraints Project

## Overview

This project extends the gfpop package to support time-dependent constraints in changepoint detection models. The implementation allows constraints to vary over time, enabling implementations like Labeled Optimal Partitioning and unconstrained optimal partitioning.

## Project Structure

- `easy_test/` - Implementation of the Easy Test (visualizing gfpop graphs)
  - `plotModel.R` - Main function for graph visualization
  - `test_plotModel.R` - Examples showing how to use plotModel
  - `simple_gfpop_example.R` - Beginner-friendly example script
  - `README.md` - Instructions specific to the easy test
- `problem.md` - Original problem statement and tests description

## Completed Tests

### Easy Test ✅

We've implemented a solution for the easy test:

```
Write an R function `plotModel` which takes a `gfpop::graph` as above and draws a matrix of nodes (one row for each state, one column for each rule) and edges.
```

Our implementation visualizes gfpop graphs as a matrix with:
- Each **row** representing a state
- Each **column** representing a rule ID
- Nodes at each state/rule intersection
- Directed edges showing valid transitions

## Environment Setup

### Prerequisites

- R (version 3.6.0 or higher)
- Rtools (for Windows users building packages from source)

### Installing Required Packages

Run these commands in an R console:

```r
install.packages("igraph")     # For graph visualization
install.packages("remotes")    # For installing packages from GitHub
remotes::install_github("vrunge/gfpop")  # Install gfpop from GitHub
```

### Setting Up a Reproducible Environment with renv

For a fully reproducible environment, we use renv:

1. **Start an R Console**: Open RStudio or VS Code with R extension

2. **Install renv**:
   ```r
   install.packages("renv")
   ```

3. **Navigate to the project directory**:
   ```r
   setwd("path/to/gfpop-time-dependent-constraints")
   ```

4. **Initialize the environment**:
   ```r
   renv::init()
   ```

5. **Install required packages in the isolated environment**:
   ```r
   renv::install("igraph")
   renv::install("remotes")
   remotes::install_github("vrunge/gfpop")
   
   # For testing
   renv::install("testthat")
   ```
<<<<<<< HEAD

6. **Save the environment state**:
   ```r
   renv::snapshot()
=======
2. **Clone the Repository:**
   ```bash
   git clone https://github.com/Transcendental-Programmer/gfpop-time-dependent-constraints.git
>>>>>>> 7eb01425ac58e93e3e3d2978611808a48225b131
   ```

7. **When returning to the project later**:
   ```r
   renv::restore()  # Reinstall all packages from the lockfile
   ```

## Running Tests

We use testthat for testing the implementation:

### Running Easy Test Visually

1. **Navigate to the easy_test directory**:
   ```r
   setwd("path/to/gfpop-time-dependent-constraints/easy_test")
   ```

2. **Run the example script**:
   ```r
   source("test_plotModel.R")
   ```

3. **What you'll observe**: Three graph visualizations will appear:
   - Simple Graph Example (2 states, 2 rules)
   - LOPART Graph Example (complex graph with multiple transitions)
   - Complex Graph Example (up/down states with multiple rules)

4. **For a simpler example**:
   ```r
   source("simple_gfpop_example.R")
   ```


## Implementation Approach

### Easy Test Solution

The `plotModel` function visualizes gfpop graphs using these steps:

1. Extract unique states and rules from the graph
2. Create a matrix layout with states as rows and rules as columns
3. Build an igraph object with nodes at each state/rule intersection
4. Add edges according to the transitions defined in the graph
5. Render the visualization with igraph's plotting functions

### File Overview

- `easy_test/plotModel.R`: Contains the main `plotModel` function implementation
- `easy_test/test_plotModel.R`: Demonstrates usage with multiple example graphs
- `easy_test/simple_gfpop_example.R`: A beginner-friendly example that works with any gfpop version

## Usage Examples

```r
library(gfpop)
library(igraph)

# Source the plotModel function
source("easy_test/plotModel.R")

# Create a graph (using the approach that works with all gfpop versions)
g <- list()
g$edges <- data.frame(
  state1 = c("normal", "normal", "noChange", "noChange"),
  state2 = c("normal", "noChange", "noChange", "normal"),
  type = c("null", "std", "null", "null"),
  penalty = c(0, 5.5, 0, 0),
  rule = c(1, 2, 2, 3),
  stringsAsFactors = FALSE
)
class(g) <- "graph"

# Visualize the graph
plotModel(g, title="Example Graph")
```

## Contributors

- [Priyansh Saxena](https://github.com/Transcendental-Programmer) - Implemented the Easy Test solution

## Mentors

- Primary: [Vincent Runge](https://github.com/vrunge) - vincent.runge@univ-evry.fr
- Co-Mentor: [Toby Dylan Hocking](https://github.com/tdhock) - tdhock5@gmail.com

## License

<<<<<<< HEAD
This project is licensed under the terms of the R license.
=======
For distribution details, run in an R session:
```r
license()
```

## Acknowledgements

This work extends established changepoint detection methods by incorporating time-sensitive constraints, with contributions from both the gfpop community and the broader changepoint research community.

>>>>>>> 7eb01425ac58e93e3e3d2978611808a48225b131
