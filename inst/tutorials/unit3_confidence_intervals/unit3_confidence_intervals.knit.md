---
title: "Unit 3: Confidence Intervals and Bootstrapping"
output: learnr::tutorial
runtime: shiny_prerendered
---



## Welcome

Welcome to the interactive tutorial for **Unit 3: Confidence Intervals and Bootstrapping**!

In this tutorial, you will practice:
1. Manually calculating a one-sample $t$-statistic and its two-tailed $p$-value.
2. Running R's built-in `t.test()` to construct classical parametric confidence intervals.
3. Estimating Wald and Wilson score confidence intervals for proportions.
4. Performing bootstrapping to estimate standard errors and constructing Percentile vs. $BC_a$ bootstrap confidence intervals using the `boot` package.

---

## Exercise 1: Manual t-Test Calculations

To build intuition, let's manually compute a one-sample $t$-test using the `mtcars$mpg` vector (fuel efficiency of 32 cars) to test $H_0: \mu = 0$ (mean fuel efficiency is zero).

### Formula Review
- Standard Error: $SE = \frac{SD}{\sqrt{n}}$
- $t$-statistic: $t = \frac{\bar{x} - \mu_0}{SE}$
- Two-tailed $p$-value: $p = 2 \times P(T \le -|t|)$ using the cumulative distribution function `pt(..., df)`.

### Practice Problem
1. Compute the sample size `n`, mean `xbar`, and standard deviation `s` of `mtcars$mpg`.
2. Compute the standard error `se`.
3. Calculate the $t$-statistic `t_stat` for testing $H_0: \mu = 0$.
4. Calculate the two-tailed $p$-value `p_val` with degrees of freedom $n - 1$.
5. Print both `t_stat` and `p_val`.

<div class="tutorial-exercise" data-label="ex1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
x <- mtcars$mpg

# 1. Compute n, xbar, s


# 2. Compute standard error se


# 3. Calculate t-statistic t_stat


# 4. Calculate p-value p_val
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex1-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Functions are length(), mean(), sd().
```

</div>

<div class="tutorial-exercise-support" data-label="ex1-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Cumulative density pt() needs the negative absolute value:
# p_val <- 2 * pt(-abs(t_stat), df = n - 1)
```

</div>

<div class="tutorial-exercise-support" data-label="ex1-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
x <- mtcars$mpg
n <- length(x)
xbar <- mean(x)
s <- sd(x)

# 2. Compute standard error se
se <- s / sqrt(n)

# 3. Calculate t-statistic t_stat
t_stat <- (xbar - 0) / se

# 4. Calculate p-value p_val
p_val <- 2 * pt(-abs(t_stat), df = n - 1)

t_stat
p_val
```

</div>

---

## Exercise 2: Using the t.test() Function

Now, let's verify our manual calculation using R's built-in `t.test()`.

### Practice Problem
1. Run a one-sample $t$-test on `mtcars$mpg` with a hypothesized mean `mu = 0`.
2. Access the confidence interval endpoints directly from the output object.

<div class="tutorial-exercise" data-label="ex2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run t.test() on mtcars$mpg


# 2. Assign the test to a variable and extract the $conf.int elements
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex2-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use t.test(x, mu = 0)
```

</div>

<div class="tutorial-exercise-support" data-label="ex2-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Extract endpoints using the `conf.int` attribute:
# test_result <- t.test(x, mu = 0)
# test_result$conf.int
```

</div>

<div class="tutorial-exercise-support" data-label="ex2-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run t.test() on mtcars$mpg
t.test(mtcars$mpg, mu = 0)

# 2. Extract confidence interval endpoints
result <- t.test(mtcars$mpg, mu = 0)
result$conf.int
```

</div>

---

## Exercise 3: Confidence Intervals for Proportions

Estimating confidence intervals for categorical proportions.

### Practice Problem
Suppose in a clinical study of 60 patients, 25 patients responded positively to treatment.
1. Run a Wald test for proportions *without* Yates' continuity correction using `prop.test()` by disabling it.
2. Run the test *with* Yates' continuity correction (default).

<div class="tutorial-exercise" data-label="ex3" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. prop.test without Yates' correction


# 2. prop.test with Yates' correction (default)
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex3-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Set correct = FALSE to disable continuity correction:
# prop.test(25, 60, correct = FALSE)
```

</div>

<div class="tutorial-exercise-support" data-label="ex3-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. prop.test without Yates' correction
prop.test(25, 60, correct = FALSE)

# 2. prop.test with Yates' correction
prop.test(25, 60, correct = TRUE)
```

</div>

---

## Exercise 4: Bootstrapping a Mean

When data is highly skewed (like household income), parametric $t$-intervals can be inaccurate. Let's use bootstrapping to build standard errors and confidence intervals. We have preloaded the `income` dataset with column `monthly_income`.

### Practice Problem
1. Define a helper function `mean_fn(data, indices)` that returns the mean of `data` subsetted by `indices`.
2. Run the `boot()` function with $R = 1000$ to bootstrap the mean of `income$monthly_income`. Store this in `boot_out`.
3. Print the standard error using `sd(boot_out$t)`.
4. Calculate Percentile and BCa intervals using `boot.ci()`.

<div class="tutorial-exercise" data-label="ex4" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Define mean_fn
mean_fn <- function(data, indices) {
  # Write logic here
  
}

# Run boot() with R = 1000


# Compute Bootstrap SE


# Extract Percentile & BCa intervals
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex4-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Inside mean_fn, return mean(data[indices])
```

</div>

<div class="tutorial-exercise-support" data-label="ex4-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Call boot like this:
# boot_out <- boot(data = income$monthly_income, statistic = mean_fn, R = 1000)
# boot.ci(boot_out, type = c("perc", "bca"))
```

</div>

<div class="tutorial-exercise-support" data-label="ex4-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Define mean_fn
mean_fn <- function(data, indices) {
  mean(data[indices])
}

# Run boot() with R = 1000
boot_out <- boot(data = income$monthly_income, statistic = mean_fn, R = 1000)
boot_out

# Compute Bootstrap SE
sd(boot_out$t)

# Extract Percentile & BCa intervals
boot.ci(boot_out, type = c("perc", "bca"))
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
library(boot)
knitr::opts_chunk$set(echo = FALSE)
income <- read.csv("../data/survey_income.csv")
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
"library(boot)", "knitr::opts_chunk$set(echo = FALSE)", "income <- read.csv(\"../data/survey_income.csv\")"
), chunk_opts = list(label = "setup", include = FALSE)), setup = NULL, 
    chunks = list(list(label = "ex1", code = "x <- mtcars$mpg\n\n# 1. Compute n, xbar, s\n\n\n# 2. Compute standard error se\n\n\n# 3. Calculate t-statistic t_stat\n\n\n# 4. Calculate p-value p_val\n\n", 
        opts = list(label = "\"ex1\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("x <- mtcars$mpg", 
    "n <- length(x)", "xbar <- mean(x)", "s <- sd(x)", "", "# 2. Compute standard error se", 
    "se <- s / sqrt(n)", "", "# 3. Calculate t-statistic t_stat", 
    "t_stat <- (xbar - 0) / se", "", "# 4. Calculate p-value p_val", 
    "p_val <- 2 * pt(-abs(t_stat), df = n - 1)", "", "t_stat", 
    "p_val"), chunk_opts = list(label = "ex1-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit3_confidence_intervals_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit3_confidence_intervals_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex1", exercise = TRUE, code = c("x <- mtcars$mpg", 
        "", "# 1. Compute n, xbar, s", "", "", "# 2. Compute standard error se", 
        "", "", "# 3. Calculate t-statistic t_stat", "", "", 
        "# 4. Calculate p-value p_val", "", ""), out.width.px = 624, 
        out.height.px = 384, params.src = "ex1, exercise=TRUE", 
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
"library(boot)", "knitr::opts_chunk$set(echo = FALSE)", "income <- read.csv(\"../data/survey_income.csv\")"
), chunk_opts = list(label = "setup", include = FALSE)), setup = NULL, 
    chunks = list(list(label = "ex2", code = "# 1. Run t.test() on mtcars$mpg\n\n\n# 2. Assign the test to a variable and extract the $conf.int elements\n\n", 
        opts = list(label = "\"ex2\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Run t.test() on mtcars$mpg", 
    "t.test(mtcars$mpg, mu = 0)", "", "# 2. Extract confidence interval endpoints", 
    "result <- t.test(mtcars$mpg, mu = 0)", "result$conf.int"
    ), chunk_opts = list(label = "ex2-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit3_confidence_intervals_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit3_confidence_intervals_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex2", exercise = TRUE, code = c("# 1. Run t.test() on mtcars$mpg", 
        "", "", "# 2. Assign the test to a variable and extract the $conf.int elements", 
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
"library(boot)", "knitr::opts_chunk$set(echo = FALSE)", "income <- read.csv(\"../data/survey_income.csv\")"
), chunk_opts = list(label = "setup", include = FALSE)), setup = NULL, 
    chunks = list(list(label = "ex3", code = "# 1. prop.test without Yates' correction\n\n\n# 2. prop.test with Yates' correction (default)\n\n", 
        opts = list(label = "\"ex3\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. prop.test without Yates' correction", 
    "prop.test(25, 60, correct = FALSE)", "", "# 2. prop.test with Yates' correction", 
    "prop.test(25, 60, correct = TRUE)"), chunk_opts = list(label = "ex3-solution")), 
    tests = NULL, options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit3_confidence_intervals_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit3_confidence_intervals_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex3", exercise = TRUE, code = c("# 1. prop.test without Yates' correction", 
        "", "", "# 2. prop.test with Yates' correction (default)", 
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
"library(boot)", "knitr::opts_chunk$set(echo = FALSE)", "income <- read.csv(\"../data/survey_income.csv\")"
), chunk_opts = list(label = "setup", include = FALSE)), setup = NULL, 
    chunks = list(list(label = "ex4", code = "# Define mean_fn\nmean_fn <- function(data, indices) {\n  # Write logic here\n  \n}\n\n# Run boot() with R = 1000\n\n\n# Compute Bootstrap SE\n\n\n# Extract Percentile & BCa intervals\n\n", 
        opts = list(label = "\"ex4\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# Define mean_fn", 
    "mean_fn <- function(data, indices) {", "  mean(data[indices])", 
    "}", "", "# Run boot() with R = 1000", "boot_out <- boot(data = income$monthly_income, statistic = mean_fn, R = 1000)", 
    "boot_out", "", "# Compute Bootstrap SE", "sd(boot_out$t)", 
    "", "# Extract Percentile & BCa intervals", "boot.ci(boot_out, type = c(\"perc\", \"bca\"))"
    ), chunk_opts = list(label = "ex4-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit3_confidence_intervals_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit3_confidence_intervals_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex4", exercise = TRUE, code = c("# Define mean_fn", 
        "mean_fn <- function(data, indices) {", "  # Write logic here", 
        "  ", "}", "", "# Run boot() with R = 1000", "", "", 
        "# Compute Bootstrap SE", "", "", "# Extract Percentile & BCa intervals", 
        "", ""), out.width.px = 624, out.height.px = 384, params.src = "ex4, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-1", question = structure("What correction factors does the Bias-Corrected and Accelerated (\\(BC_a\\)) bootstrap interval introduce compared to the Percentile interval?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_cad1223", 
    option = "Sample size adjustment and degrees of freedom correction.", 
    value = "Sample size adjustment and degrees of freedom correction.", 
    label = structure("Sample size adjustment and degrees of freedom correction.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, those are parametric parameters, not bootstrap ones.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_b7433be", 
    option = "Bias correction ($z_0$) for asymmetry, and Acceleration ($a$) for non-constant variance (skewness).", 
    value = "Bias correction ($z_0$) for asymmetry, and Acceleration ($a$) for non-constant variance (skewness).", 
    label = structure("Bias correction (\\(z_0\\)) for asymmetry, and Acceleration (\\(a\\)) for non-constant variance (skewness).", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_63073a4", 
    option = "Yates' continuity correction and Bonferroni adjustments.", 
    value = "Yates' continuity correction and Bonferroni adjustments.", 
    label = structure("Yates’ continuity correction and Bonferroni adjustments.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, those are used for contingency tables and post-hoc pairwise tests.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("The BCa interval adjusts for skewness/asymmetry (bias) and changing standard errors (acceleration) in the resampled distribution.", html = TRUE, class = c("html", 
"character")), incorrect = structure("The BCa interval adjusts for skewness/asymmetry (bias) and changing standard errors (acceleration) in the resampled distribution.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-1-answer", question = "quiz-1"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 142019877.933867, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-2", question = structure("Why is a large number of bootstrap replicates (e.g., \\(R \\ge 1000\\) or \\(2000\\)) required for \\(BC_a\\) intervals?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_6a70ee", 
    option = "To ensure stable estimation of the extreme tails and correction factors ($z_0$ and $a$).", 
    value = "To ensure stable estimation of the extreme tails and correction factors ($z_0$ and $a$).", 
    label = structure("To ensure stable estimation of the extreme tails and correction factors (\\(z_0\\) and \\(a\\)).", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_4cf36de", 
    option = "Because standard errors decrease as R increases.", 
    value = "Because standard errors decrease as R increases.", 
    label = structure("Because standard errors decrease as R increases.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, the standard error is an estimate of the population parameter and stabilizes as R grows.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Estimating correction factors at the tails of the resampled distribution requires a large number of replicates for stable endpoints.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Estimating correction factors at the tails of the resampled distribution requires a large number of replicates for stable endpoints.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-2-answer", question = "quiz-2"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 846489665.105823, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
