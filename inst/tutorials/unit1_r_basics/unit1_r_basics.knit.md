---
title: "Unit 1: R Basics and Data Structures"
output: learnr::tutorial
runtime: shiny_prerendered
---



## Welcome

Welcome to the interactive tutorial for **Unit 1: R Basics and Data Structures**! 

In this tutorial, you will practice:
1. Creating script headers, commenting code, and printing execution timestamps.
2. Importing and inspecting datasets (`.csv`, `.xlsx`, `.txt`).
3. Working with every core R data structure: vectors, matrices, arrays, factors, data frames, and lists.

---

## Exercise 1: Script Header, Comments, and Timestamps

Documenting your code and recording execution times are critical for reproducible research.

### Practice Problem
1. Create a script header comment block.
2. Print the current date and time using `Sys.time()`.
3. Print a custom formatted timestamp: `"Execution Timestamp: [Formatted Date & Time]"` using `cat()` and `format()`.

<div class="tutorial-exercise" data-label="ex1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Add a comment describing this script


# 2. Print current date and time using Sys.time()


# 3. Print a formatted execution timestamp
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex1-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Comments start with #
# # This is a script header
```

</div>

<div class="tutorial-exercise-support" data-label="ex1-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use format(Sys.time(), "%Y-%m-%d %H:%M:%S")
# cat("Execution Timestamp:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n")
```

</div>

<div class="tutorial-exercise-support" data-label="ex1-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# ==============================================================================
# Course: Statistical Computing and Non-Parametric Inference Using R
# Script: Unit 1 Exercise - Script Basics
# Author: Student
# ==============================================================================

# Print current date and time
Sys.time()

# Print formatted date and time
cat("Execution Timestamp:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n")
```

</div>

---

## Exercise 2: Importing and Inspecting Data

R can read data from multiple formats (CSV, Excel, Tab-separated text).

### Practice Problem
We have placed three equivalent files in the `../data/` directory: `student_scores.csv`, `student_scores.xlsx`, and `student_scores.txt`.
1. Read the CSV file using `read.csv()`.
2. Inspect its dimensions (`dim()`) and structural information (`str()`).

<div class="tutorial-exercise" data-label="ex2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Read the CSV file and store it in df_csv


# 2. Print dimensions of df_csv


# 3. Print structure of df_csv
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex2-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use read.csv("../data/student_scores.csv")
```

</div>

<div class="tutorial-exercise-support" data-label="ex2-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use dim(df_csv) and str(df_csv)
```

</div>

<div class="tutorial-exercise-support" data-label="ex2-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Read the CSV file
df_csv <- read.csv("../data/student_scores.csv")

# 2. Print dimensions
dim(df_csv)

# 3. Print structure
str(df_csv)
```

</div>

---

## Exercise 3: Vectors and Logical Subsetting

Vectors are the basic building blocks in R and must contain elements of the same data type.

### Practice Problem
1. Create a numeric vector `v1` containing integers from `1` to `10`.
2. Create a character vector `v2` with the colors `"red"`, `"blue"`, `"green"`.
3. Extract all values from `v1` that are **even** (divisible by 2).

<div class="tutorial-exercise" data-label="ex3" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Create v1 containing 1 to 10


# 2. Create v2 containing colors


# 3. Extract even values from v1
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex3-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use the sequence operator (:) to generate 1 to 10:
# v1 <- 1:10
```

</div>

<div class="tutorial-exercise-support" data-label="ex3-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use the modulo operator (%%) for even numbers:
# v1[v1 %% 2 == 0]
```

</div>

<div class="tutorial-exercise-support" data-label="ex3-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Create v1
v1 <- 1:10

# 2. Create v2
v2 <- c("red", "blue", "green")

# 3. Extract even values
v1[v1 %% 2 == 0]
```

</div>

---

## Exercise 4: Matrices and Arrays

Matrices are 2-dimensional structures, and arrays are multi-dimensional generalizations.

### Practice Problem
1. Create a 3x3 matrix named `mat` containing numbers `1` to `9`, filled **by row**.
2. Assign row names `"R1", "R2", "R3"` and column names `"C1", "C2", "C3"` using `rownames()` and `colnames()`.
3. Create a 3D array named `arr` containing numbers `1` to `12` with dimensions `c(2, 3, 2)`.

<div class="tutorial-exercise" data-label="ex4" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Create a 3x3 matrix filled by row


# 2. Assign rownames and colnames


# 3. Create a 3D array of size 2x3x2
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex4-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use matrix(data, nrow, ncol, byrow = TRUE)
```

</div>

<div class="tutorial-exercise-support" data-label="ex4-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use array(data, dim = c(2, 3, 2))
```

</div>

<div class="tutorial-exercise-support" data-label="ex4-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Create a 3x3 matrix
mat <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)

# 2. Assign rownames and colnames
rownames(mat) <- c("R1", "R2", "R3")
colnames(mat) <- c("C1", "C2", "C3")
mat

# 3. Create a 3D array
arr <- array(1:12, dim = c(2, 3, 2))
arr
```

</div>

---

## Exercise 5: Factors

Factors represent categorical variables with predefined levels.

### Practice Problem
1. Convert the character vector `sizes` into a factor named `size_factor`.
2. Define the levels explicitly as `"Small"`, `"Medium"`, `"Large"` to enforce order.

<div class="tutorial-exercise" data-label="ex5" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
sizes <- c("Medium", "Small", "Large", "Medium", "Small")

# 1. Convert sizes to an ordered factor size_factor


# 2. Print levels of size_factor
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex5-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use factor(x, levels = c(...), ordered = TRUE)
```

</div>

<div class="tutorial-exercise-support" data-label="ex5-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
sizes <- c("Medium", "Small", "Large", "Medium", "Small")

# 1. Convert sizes to an ordered factor
size_factor <- factor(sizes, levels = c("Small", "Medium", "Large"), ordered = TRUE)

# 2. Print levels
levels(size_factor)
size_factor
```

</div>

---

## Exercise 6: Data Frames and Lists

Lists are the most flexible R objects because they can hold items of completely different types and lengths.

### Practice Problem
1. Create a list named `my_list` containing:
   - A numeric scalar named `id` with value `101`.
   - A character vector named `name` with value `"Shrikrishna"`.
   - The matrix `mat` we created earlier.
2. Extract the matrix `mat` from `my_list` using the double square bracket `[[ ]]` operator.

<div class="tutorial-exercise" data-label="ex6" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
mat <- matrix(1:9, nrow = 3, ncol = 3)

# 1. Create my_list containing id, name, and mat


# 2. Extract the matrix from my_list
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex6-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use list(name1 = value1, name2 = value2, ...)
```

</div>

<div class="tutorial-exercise-support" data-label="ex6-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use my_list[[3]] or my_list[["mat"]]
```

</div>

<div class="tutorial-exercise-support" data-label="ex6-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
mat <- matrix(1:9, nrow = 3, ncol = 3)

# 1. Create my_list
my_list <- list(id = 101, name = "Shrikrishna", mat = mat)

# 2. Extract the matrix
my_list[["mat"]]
```

</div>

---

## Concept Check Quiz

Test your understanding of the concepts!


```{=html}
<div class="panel-heading tutorial-quiz-title"><span data-i18n="text.quiz">Quiz</span></div>
```

```{=html}
<div class="panel panel-default tutorial-question-container">
<div data-label="quiz-1" class="tutorial-question panel-body">
<div id="quiz-1-answer_container" class="shiny-html-output"></div>
<div id="quiz-1-message_container" class="shiny-html-output"></div>
<div id="quiz-1-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div>
```

```{=html}
<div class="panel panel-default tutorial-question-container">
<div data-label="quiz-2" class="tutorial-question panel-body">
<div id="quiz-2-answer_container" class="shiny-html-output"></div>
<div id="quiz-2-message_container" class="shiny-html-output"></div>
<div id="quiz-2-action_button_container" class="shiny-html-output"></div>
<script>if (Tutorial.triggerMathJax) Tutorial.triggerMathJax()</script>
</div>
</div>
```
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server-start">
library(learnr)
library(readxl)
knitr::opts_chunk$set(echo = FALSE)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::register_http_handlers(session, metadata = NULL)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::prepare_tutorial_state(session)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::i18n_observe_tutorial_language(input, session)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
session$onSessionEnded(function() {
        learnr:::event_trigger(session, "session_stop")
      })
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex1-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex1-code-editor`)), session)
output$`tutorial-exercise-ex1-output` <- renderUI({
  `tutorial-exercise-ex1-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache(structure(list(label = "ex1", global_setup = structure(c("library(learnr)", 
"library(readxl)", "knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex1", code = "# 1. Add a comment describing this script\n\n\n# 2. Print current date and time using Sys.time()\n\n\n# 3. Print a formatted execution timestamp\n\n", 
        opts = list(label = "\"ex1\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# ==============================================================================", 
    "# Course: Statistical Computing and Non-Parametric Inference Using R", 
    "# Script: Unit 1 Exercise - Script Basics", "# Author: Student", 
    "# ==============================================================================", 
    "", "# Print current date and time", "Sys.time()", "", "# Print formatted date and time", 
    "cat(\"Execution Timestamp:\", format(Sys.time(), \"%Y-%m-%d %H:%M:%S\"), \"\\n\")"
    ), chunk_opts = list(label = "ex1-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit1_r_basics_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "default", fig.path = "unit1_r_basics_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex1", exercise = TRUE, code = c("# 1. Add a comment describing this script", 
        "", "", "# 2. Print current date and time using Sys.time()", 
        "", "", "# 3. Print a formatted execution timestamp", 
        "", ""), out.width.px = 624, out.height.px = 384, params.src = "ex1, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex2-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex2-code-editor`)), session)
output$`tutorial-exercise-ex2-output` <- renderUI({
  `tutorial-exercise-ex2-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache(structure(list(label = "ex2", global_setup = structure(c("library(learnr)", 
"library(readxl)", "knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex2", code = "# 1. Read the CSV file and store it in df_csv\n\n\n# 2. Print dimensions of df_csv\n\n\n# 3. Print structure of df_csv\n\n", 
        opts = list(label = "\"ex2\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Read the CSV file", 
    "df_csv <- read.csv(\"../data/student_scores.csv\")", "", 
    "# 2. Print dimensions", "dim(df_csv)", "", "# 3. Print structure", 
    "str(df_csv)"), chunk_opts = list(label = "ex2-solution")), 
    tests = NULL, options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit1_r_basics_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "default", fig.path = "unit1_r_basics_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex2", exercise = TRUE, code = c("# 1. Read the CSV file and store it in df_csv", 
        "", "", "# 2. Print dimensions of df_csv", "", "", "# 3. Print structure of df_csv", 
        "", ""), out.width.px = 624, out.height.px = 384, params.src = "ex2, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex3-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex3-code-editor`)), session)
output$`tutorial-exercise-ex3-output` <- renderUI({
  `tutorial-exercise-ex3-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache(structure(list(label = "ex3", global_setup = structure(c("library(learnr)", 
"library(readxl)", "knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex3", code = "# 1. Create v1 containing 1 to 10\n\n\n# 2. Create v2 containing colors\n\n\n# 3. Extract even values from v1\n\n", 
        opts = list(label = "\"ex3\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Create v1", 
    "v1 <- 1:10", "", "# 2. Create v2", "v2 <- c(\"red\", \"blue\", \"green\")", 
    "", "# 3. Extract even values", "v1[v1 %% 2 == 0]"), chunk_opts = list(
        label = "ex3-solution")), tests = NULL, options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, size = "normalsize", background = "#F7F7F7", 
        strip.white = TRUE, cache = 0, cache.path = "unit1_r_basics_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit1_r_basics_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex3", exercise = TRUE, code = c("# 1. Create v1 containing 1 to 10", 
        "", "", "# 2. Create v2 containing colors", "", "", "# 3. Extract even values from v1", 
        "", ""), out.width.px = 624, out.height.px = 384, params.src = "ex3, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex4-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex4-code-editor`)), session)
output$`tutorial-exercise-ex4-output` <- renderUI({
  `tutorial-exercise-ex4-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache(structure(list(label = "ex4", global_setup = structure(c("library(learnr)", 
"library(readxl)", "knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex4", code = "# 1. Create a 3x3 matrix filled by row\n\n\n# 2. Assign rownames and colnames\n\n\n# 3. Create a 3D array of size 2x3x2\n\n", 
        opts = list(label = "\"ex4\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Create a 3x3 matrix", 
    "mat <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)", "", 
    "# 2. Assign rownames and colnames", "rownames(mat) <- c(\"R1\", \"R2\", \"R3\")", 
    "colnames(mat) <- c(\"C1\", \"C2\", \"C3\")", "mat", "", 
    "# 3. Create a 3D array", "arr <- array(1:12, dim = c(2, 3, 2))", 
    "arr"), chunk_opts = list(label = "ex4-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit1_r_basics_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "default", fig.path = "unit1_r_basics_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex4", exercise = TRUE, code = c("# 1. Create a 3x3 matrix filled by row", 
        "", "", "# 2. Assign rownames and colnames", "", "", 
        "# 3. Create a 3D array of size 2x3x2", "", ""), out.width.px = 624, 
        out.height.px = 384, params.src = "ex4, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex5-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex5-code-editor`)), session)
output$`tutorial-exercise-ex5-output` <- renderUI({
  `tutorial-exercise-ex5-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache(structure(list(label = "ex5", global_setup = structure(c("library(learnr)", 
"library(readxl)", "knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex5", code = "sizes <- c(\"Medium\", \"Small\", \"Large\", \"Medium\", \"Small\")\n\n# 1. Convert sizes to an ordered factor size_factor\n\n\n# 2. Print levels of size_factor\n\n", 
        opts = list(label = "\"ex5\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("sizes <- c(\"Medium\", \"Small\", \"Large\", \"Medium\", \"Small\")", 
    "", "# 1. Convert sizes to an ordered factor", "size_factor <- factor(sizes, levels = c(\"Small\", \"Medium\", \"Large\"), ordered = TRUE)", 
    "", "# 2. Print levels", "levels(size_factor)", "size_factor"
    ), chunk_opts = list(label = "ex5-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit1_r_basics_cache/html/", cache.vars = NULL, 
        cache.lazy = TRUE, dependson = NULL, autodep = FALSE, 
        cache.rebuild = FALSE, fig.keep = "high", fig.show = "asis", 
        fig.align = "default", fig.path = "unit1_r_basics_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex5", exercise = TRUE, code = c("sizes <- c(\"Medium\", \"Small\", \"Large\", \"Medium\", \"Small\")", 
        "", "# 1. Convert sizes to an ordered factor size_factor", 
        "", "", "# 2. Print levels of size_factor", "", ""), 
        out.width.px = 624, out.height.px = 384, params.src = "ex5, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
`tutorial-exercise-ex6-result` <- learnr:::setup_exercise_handler(reactive(req(input$`tutorial-exercise-ex6-code-editor`)), session)
output$`tutorial-exercise-ex6-output` <- renderUI({
  `tutorial-exercise-ex6-result`()
})
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::store_exercise_cache(structure(list(label = "ex6", global_setup = structure(c("library(learnr)", 
"library(readxl)", "knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex6", code = "mat <- matrix(1:9, nrow = 3, ncol = 3)\n\n# 1. Create my_list containing id, name, and mat\n\n\n# 2. Extract the matrix from my_list\n\n", 
        opts = list(label = "\"ex6\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("mat <- matrix(1:9, nrow = 3, ncol = 3)", 
    "", "# 1. Create my_list", "my_list <- list(id = 101, name = \"Shrikrishna\", mat = mat)", 
    "", "# 2. Extract the matrix", "my_list[[\"mat\"]]"), chunk_opts = list(
        label = "ex6-solution")), tests = NULL, options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, size = "normalsize", background = "#F7F7F7", 
        strip.white = TRUE, cache = 0, cache.path = "unit1_r_basics_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit1_r_basics_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex6", exercise = TRUE, code = c("mat <- matrix(1:9, nrow = 3, ncol = 3)", 
        "", "# 1. Create my_list containing id, name, and mat", 
        "", "", "# 2. Extract the matrix from my_list", "", ""
        ), out.width.px = 624, out.height.px = 384, params.src = "ex6, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-1", question = structure("What happens when you run <code>c(1, &quot;apple&quot;, TRUE)<\u002fcode> in R?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_215203e", 
    option = "It creates a list with different data types.", 
    value = "It creates a list with different data types.", label = structure("It creates a list with different data types.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, c() always creates a vector, not a list.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_497999b", 
    option = "It coerces all elements to character type, resulting in `\"1\"`, `\"apple\"`, `\"TRUE\"`.", 
    value = "It coerces all elements to character type, resulting in `\"1\"`, `\"apple\"`, `\"TRUE\"`.", 
    label = structure("It coerces all elements to character type, resulting in <code>&quot;1&quot;<\u002fcode>, <code>&quot;apple&quot;<\u002fcode>, <code>&quot;TRUE&quot;<\u002fcode>.", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_df799b3", 
    option = "It returns an error because vectors cannot hold mixed types.", 
    value = "It returns an error because vectors cannot hold mixed types.", 
    label = structure("It returns an error because vectors cannot hold mixed types.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("R doesn’t error; instead, it automatically coerces elements to a single common type.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Coercion moves towards the most flexible data type: Logical -&gt; Numeric -&gt; Character.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Coercion moves towards the most flexible data type: Logical -&gt; Numeric -&gt; Character.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-1-answer", question = "quiz-1"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 2134145410.50621, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-2", question = structure("Which index operator returns a single element stripped of its list structure?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_d3f9596", 
    option = "`[ ]`", value = "`[ ]`", label = structure("<code>[ ]<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, single square brackets return a sublist, not the single element itself.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_4b7a871", 
    option = "`[[ ]]`", value = "`[[ ]]`", label = structure("<code>[[ ]]<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_8f8b7bb", 
    option = "`( )`", value = "`( )`", label = structure("<code>( )<\u002fcode>", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("Parentheses are used for function calls and expression grouping.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Double square brackets <code>[[ ]]<\u002fcode> retrieve a single element from a list and remove its list structure wrapper.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Double square brackets <code>[[ ]]<\u002fcode> retrieve a single element from a list and remove its list structure wrapper.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-2-answer", question = "quiz-2"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 1870208480.12912, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
