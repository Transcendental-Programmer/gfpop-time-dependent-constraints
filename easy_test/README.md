# Easy Test for gfpop Time-Dependent Constraints

This directory contains scripts and examples for the "easy test" of the gfpop time-dependent constraints project. In this test we implement the `plotModel` function that visualizes a gfpop graph as a matrix of nodes and edges.

## Contents

- **plotModel.R** – Implements `plotModel` to display nodes (states as rows, rule IDs as columns) and edges.
- **test_plotModel.R** – Provides detailed examples demonstrating the usage of `plotModel`.
- **simple_gfpop_example.R** – A minimal example aimed at non-technical users.
- **requirements.txt** – Lists required R packages.
- **renv_setup.md** – Instructions to set up a reproducible R environment using renv.

## Quick Start

1. **Install Prerequisites:**  
   Run these commands in an R environment:
   ```r
   install.packages("igraph")
   install.packages("remotes")
   remotes::install_github("vrunge/gfpop")
   ```

2. **Run the Examples:**  
   For full demonstrations:
   ```r
   source("test_plotModel.R")
   ```
   For a quick, user-friendly demonstration:
   ```r
   source("simple_gfpop_example.R")
   ```

3. **Setting Up a Reproducible Environment:**  
   See `renv_setup.md` for instructions on using renv.

---
*End of Easy Test README*