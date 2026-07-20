<div align="center">

# 📦 scnpir — Interactive R Tutorials

**Tutorial Package for Statistical Computing & Non-Parametric Inference Using R**

[![Install from GitHub](https://img.shields.io/badge/📦_R_Package-Install_from_GitHub-2ea44f?style=for-the-badge)](https://github.com/kskbhat/scnpir)
[![Course Notes](https://img.shields.io/badge/📖_Course_Notes-Open_Bookdown-blue?style=for-the-badge)](https://kskbhat.github.io/Teaching/mahe/Statistical%20Computing%20and%20Non%20parametric%20inference%20using%20R/_book/)
[![R-CMD-check](https://github.com/kskbhat/scnpir/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kskbhat/scnpir/actions/workflows/R-CMD-check.yaml)

</div>

---

This R package contains interactive `learnr` tutorials for **Statistical Computing and Non-Parametric Inference Using R**. Each tutorial corresponds to one unit of the course syllabus and provides hands-on, browser-based exercises with progressive hints and automated feedback via `gradethis`.

---

## 🖥️ Quick Start

### Step 1: Install the Package

```r
# Install remotes if you haven't already
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install the scnpir package directly from GitHub
remotes::install_github("kskbhat/scnpir")
```

### Step 2: Run a Tutorial

**Method A — R Console (Recommended)**

```r
library(scnpir)

# Unit 1: Introduction to R and Data Structures
learnr::run_tutorial("unit1_r_basics", package = "scnpir")

# Unit 2: Descriptive Statistics and Programming Fundamentals in R
learnr::run_tutorial("unit2_descriptive_stats", package = "scnpir")

# Unit 3: Confidence Interval Estimation and Resampling Methods
learnr::run_tutorial("unit3_confidence_intervals", package = "scnpir")

# Unit 4: Analysis of Contingency Tables and Compact Reporting
learnr::run_tutorial("unit4_contingency_tables", package = "scnpir")

# Unit 5: Non-Parametric Tests and Applications Using R
learnr::run_tutorial("unit5_nonparametric_tests", package = "scnpir")
```

**Method B — RStudio Tutorials Pane**

1. Open RStudio.
2. In the top-right pane, navigate to the **Tutorial** tab (next to Environment / History).
3. Scroll down to find the **scnpir** section.
4. Click the **Start Tutorial** button next to any unit.

---

## 📘 Tutorial Coverage

| Tutorial | Unit | Topics Covered |
|:---|:--:|:---|
| `unit1_r_basics` | 1 | Introduction to R and Data Structures (8 Hours) |
| `unit2_descriptive_stats` | 2 | Descriptive Statistics and Programming Fundamentals in R (10 Hours) |
| `unit3_confidence_intervals` | 3 | Confidence Interval Estimation and Resampling Methods (12 Hours) |
| `unit4_contingency_tables` | 4 | Analysis of Contingency Tables and Compact Reporting (15 Hours) |
| `unit5_nonparametric_tests` | 5 | Non-Parametric Tests and Applications Using R (15 Hours) |

---

## 📚 Official References

1. R Core Team (2023). *An introduction to R*. Vienna: R Foundation for Statistical Computing.
2. Wickham H, Grolemund G (2017). *R for data science: import, tidy, transform, visualize, and model data*. O’Reilly Media.
3. Venables WN, Ripley BD (2002). *Modern applied statistics with S*. 4th ed. Springer.
4. Efron B, Tibshirani RJ (1993). *An introduction to the bootstrap*. Chapman & Hall/CRC.
5. Hollander M, Wolfe DA, Chicken E (2014). *Nonparametric statistical methods*. 3rd ed. Wiley.
6. Conover WJ (1999). *Practical nonparametric statistics*. 3rd ed. Wiley.
7. Agresti A (2013). *Categorical data analysis*. 3rd ed. Wiley.
