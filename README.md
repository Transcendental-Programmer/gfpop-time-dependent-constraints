# gfpop Time-Dependent Constraints Project

## Overview

This project extends the gfpop package to support time-dependent constraints in changepoint detection models. By allowing constraints that vary over time, the framework can implement models such as Labeled Optimal Partitioning and unconstrained optimal partitioning, broadening the applicability of gfpop for real-world problems.

## Project Structure

- **problem.md** – Describes the background, research context, and detailed project goals.
- **easy_test/** – Contains the easy test scripts for implementing and testing the `plotModel` function.
  - *See [easy_test/README.md](easy_test/README.md) for details on testing and examples.*
- **src/** *(if applicable)* – May include additional code, C++ wrappers, and shared R functions.
- **tests/** *(if applicable)* – Contains unit tests (e.g., using the `testthat` framework).
- **renv_setup.md** – Instructions for reproducible package management using renv.
- **requirements.txt** – Lists required R packages for the project.

## Quick Start

### Prerequisites

- **R** (version 3.6.0 or higher)
- **Rtools** (for Windows users building packages from source)
- Editor: Visual Studio Code with the R extension or RStudio

### Installation

1. **Install Dependencies:**  
   In an R session, run:
   ```r
   install.packages("igraph")
   install.packages("remotes")
   remotes::install_github("vrunge/gfpop")
   ```
2. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourrepo/gfpop-time-dependent-constraints.git
   ```
3. **Set Up the Environment:**  
   For reproducibility, use [renv_setup.md](renv_setup.md) to create an isolated R environment.

## Usage

- **Visualizing Models:**  
  The key function `plotModel` (in *easy_test/plotModel.R*) takes a gfpop graph object and visualizes it as a node matrix based on states and rule IDs.
- **Running Examples:**  
  - Execute `source("easy_test/test_plotModel.R")` for complete examples.
  - For a quick demo, try `source("easy_test/simple_gfpop_example.R")`.

## Contribution Guidelines

- **Compatibility:** Ensure backward compatibility when modifying gfpop interfaces.
- **Testing:** Write unit tests using `testthat` to validate model outputs.
- **Documentation:** Update both code comments and this README if external interfaces change.
- **Contact Mentors:**
  - Primary: [Vincent Runge](https://github.com/vrunge) – vincent.runge@univ-evry.fr
  - Co-Mentor: [Toby Dylan Hocking](https://github.com/tdhock) – tdhock5@gmail.com

## Additional Resources

- **gfpop GitHub:** [https://github.com/vrunge/gfpop](https://github.com/vrunge/gfpop)
- **Documentation and Vignettes:** [CRAN gfpop Vignettes](https://cran.r-project.org/web/packages/gfpop/vignettes/)
- **Research References:**
  - Runge et al., [arXiv:2002.03646](https://arxiv.org/abs/2002.03646)
  - Maidstone et al. (2016) on Optimal Partitioning

## License

For distribution details, run in an R session:
```r
license()
```

## Acknowledgements

This work extends established changepoint detection methods by incorporating time-sensitive constraints, with contributions from both the gfpop community and the broader changepoint research community.

---
*End of Project README*
