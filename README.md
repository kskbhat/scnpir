<div align="center">

# 📦 scnpir — Interactive R Tutorials

**Tutorial Package for DDS 6103: Statistical Computing & Non-Parametric Inference Using R**

Department of Data Science · Prasanna School of Public Health  
Manipal Academy of Higher Education (MAHE)

[![Install from GitHub](https://img.shields.io/badge/📦_R_Package-Install_from_GitHub-2ea44f?style=for-the-badge)](https://github.com/kskbhat/scnpir)
[![Course Notes](https://img.shields.io/badge/📖_Course_Notes-Open_Bookdown-blue?style=for-the-badge)](https://kskbhat.github.io/Teaching/mahe/Statistical%20Computing%20and%20Non%20parametric%20inference%20using%20R/_book/)

</div>

---

This R package contains interactive `learnr` tutorials for the course **Statistical Computing and Non-Parametric Inference using R (DDS 6103)** at MAHE. Each tutorial corresponds to one unit of the official course syllabus and provides hands-on, browser-based exercises with progressive hints and automated feedback via `gradethis`.

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

# Unit 2: Descriptive Statistics and Programming Fundamentals
learnr::run_tutorial("unit2_descriptive_stats", package = "scnpir")

# Unit 3: Confidence Interval Estimation & Resampling
learnr::run_tutorial("unit3_confidence_intervals", package = "scnpir")

# Unit 4: Contingency Tables & Compact Reporting
learnr::run_tutorial("unit4_contingency_tables", package = "scnpir")

# Unit 5: Non-Parametric Tests and Applications
learnr::run_tutorial("unit5_nonparametric_tests", package = "scnpir")
```

**Method B — RStudio Tutorials Pane**

1. Open RStudio.
2. In the top-right pane, navigate to the **Tutorial** tab (next to Environment / History).
3. Scroll down to find the **scnpir** section.
4. Click the **Start Tutorial** button next to any unit.

---

## 📘 Tutorial Coverage

| Tutorial | Unit | Official Topics Covered |
|:---|:--:|:---|
| `unit1_r_basics` | 1 | RStudio, vectors, matrices, arrays, data frames, factors, lists, data import |
| `unit2_descriptive_stats` | 2 | Central tendency, dispersion, skewness/kurtosis, conditionals, loops, functions |
| `unit3_confidence_intervals` | 3 | Resampling methods, bootstrap standard error, percentile CIs, proportion CIs |
| `unit4_contingency_tables` | 4 | Chi-square, Fisher's exact, trend tests, kappa agreement, McNemar, `tableone`, `gtsummary` |
| `unit5_nonparametric_tests` | 5 | Binomial test, Sign test, Mann-Whitney U, Wilcoxon, Kruskal-Wallis, Friedman ANOVA |

---

## 📁 Package Structure

```
scnpir/
├── DESCRIPTION                         ← Package metadata and dependencies
├── NAMESPACE                           ← Exported functions
└── inst/
    └── tutorials/
        ├── unit1_r_basics/
        ├── unit2_descriptive_stats/
        ├── unit3_confidence_intervals/
        ├── unit4_contingency_tables/
        └── unit5_nonparametric_tests/
```

---

## 📚 Official Course References

1. R Core Team (2023). *An Introduction to R*. Vienna: R Foundation for Statistical Computing.
2. Wickham H., Grolemund G. (2017). *R for Data Science*. O'Reilly Media.
3. Venables W.N., Ripley B.D. (2002). *Modern Applied Statistics with S*. 4th ed. Springer.
4. Efron B., Tibshirani R.J. (1993). *An Introduction to the Bootstrap*. Chapman & Hall/CRC.
5. Hollander M., Wolfe D.A., Chicken E. (2014). *Nonparametric Statistical Methods*. 3rd ed. Wiley.
6. Conover W.J. (1999). *Practical Nonparametric Statistics*. 3rd ed. Wiley.
7. Agresti A. (2013). *Categorical Data Analysis*. 3rd ed. Wiley.
