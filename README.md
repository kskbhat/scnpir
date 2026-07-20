<div align="center">

# 📦 scnpir — Interactive R Tutorials

**Tutorial Package for DDS 6103: Statistical Computing & Non-Parametric Inference Using R**

Department of Data Science · Prasanna School of Public Health  
Manipal Academy of Higher Education (MAHE)

[![Install from GitHub](https://img.shields.io/badge/📦_R_Package-Install_from_GitHub-2ea44f?style=for-the-badge)](https://github.com/kskbhat/Teaching/tree/main/mahe/scnpir)
[![Course Notes](https://img.shields.io/badge/📖_Course_Notes-Open_Bookdown-blue?style=for-the-badge)](https://kskbhat.github.io/Teaching/mahe/Statistical%20Computing%20and%20Non%20parametric%20inference%20using%20R/_book/)

</div>

---

This R package contains interactive `learnr` tutorials for the course **Statistical Computing and Non-Parametric Inference using R (DDS 6103)** at MAHE. Each tutorial corresponds to one unit of the course syllabus and provides hands-on, browser-based exercises with immediate feedback.

---

## 🖥️ Quick Start

### Step 1: Install the Package

```r
# Install remotes if you haven't already
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# Install the scnpir package from GitHub
remotes::install_github(
  "kskbhat/Teaching",
  subdir = "mahe/scnpir"
)
```

### Step 2: Run a Tutorial

**Method A — R Console (Recommended)**

```r
library(scnpir)

# Unit 1: Introduction to R
learnr::run_tutorial("unit1_r_basics", package = "scnpir")

# Unit 2: Descriptive Statistics
learnr::run_tutorial("unit2_descriptive_stats", package = "scnpir")

# Unit 3: Confidence Intervals & Bootstrap
learnr::run_tutorial("unit3_confidence_intervals", package = "scnpir")

# Unit 4: Contingency Tables
learnr::run_tutorial("unit4_contingency_tables", package = "scnpir")

# Unit 5: Non-Parametric Tests
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
| `unit1_r_basics` | 1 | R environment, data types, vectors, matrices, data frames, file import |
| `unit2_descriptive_stats` | 2 | Descriptive statistics, loops, functions, dplyr, ggplot2 |
| `unit3_confidence_intervals` | 3 | Bootstrap resampling, percentile CIs, non-parametric estimation |
| `unit4_contingency_tables` | 4 | Chi-square, Fisher's exact, kappa, tableone, gtsummary |
| `unit5_nonparametric_tests` | 5 | Sign test, Mann-Whitney U, Wilcoxon, Kruskal-Wallis, Friedman |

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

## 📚 Dependencies

The package requires the following R packages (installed automatically):

| Package | Purpose |
|:---|:---|
| `learnr` | Interactive tutorial framework |
| `gradethis` | Answer checking and feedback |
| `boot` | Bootstrap resampling (Unit 3) |
| `tableone` | Baseline table generation (Unit 4) |
| `gtsummary` | Publication-ready tables (Unit 4) |
| `psych` | Descriptive stats & kappa (Units 2, 4) |
