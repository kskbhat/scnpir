---
title: "Unit 5: Non-Parametric Hypothesis Tests"
output: learnr::tutorial
runtime: shiny_prerendered
---



## Welcome

Welcome to the interactive tutorial for **Unit 5: Non-Parametric Hypothesis Tests**!

In this tutorial, you will practice the primary non-parametric statistical tests:
1. **Sign Test** (one-sample / paired).
2. **Mann-Whitney U Test** (two independent groups).
3. **Wilcoxon Signed-Rank Test** (paired samples).
4. **Kruskal-Wallis Test** (three or more independent groups) with Bonferroni post-hoc adjustments.
5. **Friedman Test** (repeated measures) and calculating Kendall's W.

---

## Exercise 1: Sign Test

The sign test is the simplest non-parametric test. It evaluates whether the median of a variable differs from a hypothesized value.

### Practice Problem
Let's test if the median week 8 pain score (`week8_pain` in `course_df`) differs from a hypothesized clinical threshold of `4.0`.
1. Compute the differences `diffs` between each score and `4.0`.
2. Count the number of positive differences `n_pos` (greater than 0).
3. Determine the number of valid (non-tied) cases `n_valid` (excluding exactly 0 differences).
4. Use `binom.test()` to perform the two-tailed sign test.

<div class="tutorial-exercise" data-label="ex1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# View baseline structure
head(course_df, 3)

# 1. Compute differences from threshold 4.0


# 2. Count positive differences n_pos


# 3. Count non-tied differences n_valid


# 4. Perform binom.test()
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex1-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Calculate diffs as:
# diffs <- course_df$week8_pain - 4.0
```

</div>

<div class="tutorial-exercise-support" data-label="ex1-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: positive counts are sum(diffs > 0).
# non-ties are sum(diffs != 0).
# binom.test(n_pos, n_valid, p = 0.5)
```

</div>

<div class="tutorial-exercise-support" data-label="ex1-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
diffs <- course_df$week8_pain - 4.0

# 2. Count positive differences n_pos
n_pos <- sum(diffs > 0)

# 3. Count non-tied differences n_valid
n_valid <- sum(diffs != 0)

# 4. Perform binom.test()
binom.test(n_pos, n_valid, p = 0.5)
```

</div>

---

## Exercise 2: Mann-Whitney U & Wilcoxon Signed-Rank

These tests evaluate independent and paired group differences, respectively.

### Practice Problem
1. **Independent groups**: Perform a Wilcoxon Rank-Sum test (Mann-Whitney U) using the formula `week8_pain ~ treatment` from `course_df`.
2. **Paired groups**: Perform a Wilcoxon Signed-Rank test to evaluate whether student scores in `exam_df` increased from `pre_test` to `post_test`. (Remember to enable `paired = TRUE`!).

<div class="tutorial-exercise" data-label="ex2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run Mann-Whitney U test


# 2. Run Wilcoxon Signed-Rank test on exam_df
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex2-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use wilcox.test(formula, data) for independent groups:
# wilcox.test(week8_pain ~ treatment, data = course_df)
```

</div>

<div class="tutorial-exercise-support" data-label="ex2-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Pass both columns to wilcox.test and set paired = TRUE:
# wilcox.test(exam_df$pre_test, exam_df$post_test, paired = TRUE)
```

</div>

<div class="tutorial-exercise-support" data-label="ex2-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run Mann-Whitney U test
wilcox.test(week8_pain ~ treatment, data = course_df)

# 2. Run Wilcoxon Signed-Rank test on exam_df
wilcox.test(exam_df$pre_test, exam_df$post_test, paired = TRUE)
```

</div>

---

## Exercise 3: Kruskal-Wallis & Post-Hoc

The Kruskal-Wallis test compares medians across three or more independent groups.

### Practice Problem
Let's analyze if week 8 pain levels (`week8_pain`) differ across the three hospital sites (`site` in `course_df`).
1. Run the overall `kruskal.test()` with the formula `week8_pain ~ site`.
2. Run post-hoc pairwise Wilcoxon Rank-Sum tests using `pairwise.wilcox.test()` with a Bonferroni p-value adjustment.

<div class="tutorial-exercise" data-label="ex3" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run overall Kruskal-Wallis test


# 2. Run pairwise post-hoc Wilcoxon tests with Bonferroni adjustment
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex3-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Call kruskal.test(formula, data):
# kruskal.test(week8_pain ~ site, data = course_df)
```

</div>

<div class="tutorial-exercise-support" data-label="ex3-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Use pairwise.wilcox.test(x, g, p.adjust.method = "bonferroni")
# pairwise.wilcox.test(course_df$week8_pain, course_df$site, p.adjust.method = "bonferroni")
```

</div>

<div class="tutorial-exercise-support" data-label="ex3-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run overall Kruskal-Wallis test
kruskal.test(week8_pain ~ site, data = course_df)

# 2. Run pairwise post-hoc Wilcoxon tests with Bonferroni adjustment
pairwise.wilcox.test(
  x = course_df$week8_pain,
  g = course_df$site,
  p.adjust.method = "bonferroni"
)
```

</div>

---

## Exercise 4: Friedman Test & Kendall's W

The Friedman test evaluates differences in repeated measures designs across three or more conditions.

### Practice Problem
Let's analyze pain scores at three time points (baseline, week 4, week 8). The repeated measures are structured inside `course_df` as columns `baseline_pain`, `week4_pain`, and `week8_pain` (one row per patient ID).
1. The Friedman test requires data in a long format. Reshape the columns into a long format using `reshape()` or a manual data frame, or use the pre-built code below.
2. Run `friedman.test()` using the long format formula `pain ~ time | id`.
3. Compute **Kendall's W** effect size from the Friedman Chi-Squared statistic ($Q$):
   $$W = \frac{Q}{N(k-1)}$$
   Where $Q$ is the Friedman test statistic, $N$ is the sample size (number of subjects, 180), and $k$ is the number of time points (3).

<div class="tutorial-exercise" data-label="ex4" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Reshape baseline, week 4, and week 8 to long format:
n_subjects <- nrow(course_df)
long_pain <- data.frame(
  id = rep(1:n_subjects, times = 3),
  time = rep(c("baseline", "week4", "week8"), each = n_subjects),
  pain = c(course_df$baseline_pain, course_df$week4_pain, course_df$week8_pain)
)

# 1. Run the Friedman test on long_pain


# 2. Retrieve the chi-squared statistic Q and compute Kendall's W
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex4-hint-1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Formula is: pain ~ time | id
# res <- friedman.test(pain ~ time | id, data = long_pain)
```

</div>

<div class="tutorial-exercise-support" data-label="ex4-hint-2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Hint: Get the statistic from the result list:
# Q <- res$statistic
# W <- Q / (n_subjects * (3 - 1))
```

</div>

<div class="tutorial-exercise-support" data-label="ex4-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
n_subjects <- nrow(course_df)
long_pain <- data.frame(
  id = rep(1:n_subjects, times = 3),
  time = rep(c("baseline", "week4", "week8"), each = n_subjects),
  pain = c(course_df$baseline_pain, course_df$week4_pain, course_df$week8_pain)
)

# 1. Run the Friedman test
res <- friedman.test(pain ~ time | id, data = long_pain)
res

# 2. Compute Kendall's W
Q <- res$statistic
W <- Q / (n_subjects * (3 - 1))
names(W) <- "Kendall's W"
W
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
knitr::opts_chunk$set(echo = FALSE)
course_df <- read.csv("../data/course_dataset.csv")
exam_df <- read.csv("../data/exam_pairs.csv")
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
"knitr::opts_chunk$set(echo = FALSE)", "course_df <- read.csv(\"../data/course_dataset.csv\")", 
"exam_df <- read.csv(\"../data/exam_pairs.csv\")"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex1", code = "# View baseline structure\nhead(course_df, 3)\n\n# 1. Compute differences from threshold 4.0\n\n\n# 2. Count positive differences n_pos\n\n\n# 3. Count non-tied differences n_valid\n\n\n# 4. Perform binom.test()\n\n", 
        opts = list(label = "\"ex1\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("diffs <- course_df$week8_pain - 4.0", 
    "", "# 2. Count positive differences n_pos", "n_pos <- sum(diffs > 0)", 
    "", "# 3. Count non-tied differences n_valid", "n_valid <- sum(diffs != 0)", 
    "", "# 4. Perform binom.test()", "binom.test(n_pos, n_valid, p = 0.5)"
    ), chunk_opts = list(label = "ex1-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit5_nonparametric_tests_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit5_nonparametric_tests_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex1", exercise = TRUE, code = c("# View baseline structure", 
        "head(course_df, 3)", "", "# 1. Compute differences from threshold 4.0", 
        "", "", "# 2. Count positive differences n_pos", "", 
        "", "# 3. Count non-tied differences n_valid", "", "", 
        "# 4. Perform binom.test()", "", ""), out.width.px = 624, 
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
"knitr::opts_chunk$set(echo = FALSE)", "course_df <- read.csv(\"../data/course_dataset.csv\")", 
"exam_df <- read.csv(\"../data/exam_pairs.csv\")"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex2", code = "# 1. Run Mann-Whitney U test\n\n\n# 2. Run Wilcoxon Signed-Rank test on exam_df\n\n", 
        opts = list(label = "\"ex2\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Run Mann-Whitney U test", 
    "wilcox.test(week8_pain ~ treatment, data = course_df)", 
    "", "# 2. Run Wilcoxon Signed-Rank test on exam_df", "wilcox.test(exam_df$pre_test, exam_df$post_test, paired = TRUE)"
    ), chunk_opts = list(label = "ex2-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit5_nonparametric_tests_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit5_nonparametric_tests_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex2", exercise = TRUE, code = c("# 1. Run Mann-Whitney U test", 
        "", "", "# 2. Run Wilcoxon Signed-Rank test on exam_df", 
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
"knitr::opts_chunk$set(echo = FALSE)", "course_df <- read.csv(\"../data/course_dataset.csv\")", 
"exam_df <- read.csv(\"../data/exam_pairs.csv\")"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex3", code = "# 1. Run overall Kruskal-Wallis test\n\n\n# 2. Run pairwise post-hoc Wilcoxon tests with Bonferroni adjustment\n\n", 
        opts = list(label = "\"ex3\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Run overall Kruskal-Wallis test", 
    "kruskal.test(week8_pain ~ site, data = course_df)", "", 
    "# 2. Run pairwise post-hoc Wilcoxon tests with Bonferroni adjustment", 
    "pairwise.wilcox.test(", "  x = course_df$week8_pain,", "  g = course_df$site,", 
    "  p.adjust.method = \"bonferroni\"", ")"), chunk_opts = list(
        label = "ex3-solution")), tests = NULL, options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, size = "normalsize", background = "#F7F7F7", 
        strip.white = TRUE, cache = 0, cache.path = "unit5_nonparametric_tests_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit5_nonparametric_tests_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex3", exercise = TRUE, code = c("# 1. Run overall Kruskal-Wallis test", 
        "", "", "# 2. Run pairwise post-hoc Wilcoxon tests with Bonferroni adjustment", 
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
"knitr::opts_chunk$set(echo = FALSE)", "course_df <- read.csv(\"../data/course_dataset.csv\")", 
"exam_df <- read.csv(\"../data/exam_pairs.csv\")"), chunk_opts = list(
    label = "setup", include = FALSE)), setup = NULL, chunks = list(
    list(label = "ex4", code = "# Reshape baseline, week 4, and week 8 to long format:\nn_subjects <- nrow(course_df)\nlong_pain <- data.frame(\n  id = rep(1:n_subjects, times = 3),\n  time = rep(c(\"baseline\", \"week4\", \"week8\"), each = n_subjects),\n  pain = c(course_df$baseline_pain, course_df$week4_pain, course_df$week8_pain)\n)\n\n# 1. Run the Friedman test on long_pain\n\n\n# 2. Retrieve the chi-squared statistic Q and compute Kendall's W\n\n", 
        opts = list(label = "\"ex4\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("n_subjects <- nrow(course_df)", 
    "long_pain <- data.frame(", "  id = rep(1:n_subjects, times = 3),", 
    "  time = rep(c(\"baseline\", \"week4\", \"week8\"), each = n_subjects),", 
    "  pain = c(course_df$baseline_pain, course_df$week4_pain, course_df$week8_pain)", 
    ")", "", "# 1. Run the Friedman test", "res <- friedman.test(pain ~ time | id, data = long_pain)", 
    "res", "", "# 2. Compute Kendall's W", "Q <- res$statistic", 
    "W <- Q / (n_subjects * (3 - 1))", "names(W) <- \"Kendall's W\"", 
    "W"), chunk_opts = list(label = "ex4-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit5_nonparametric_tests_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit5_nonparametric_tests_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex4", exercise = TRUE, code = c("# Reshape baseline, week 4, and week 8 to long format:", 
        "n_subjects <- nrow(course_df)", "long_pain <- data.frame(", 
        "  id = rep(1:n_subjects, times = 3),", "  time = rep(c(\"baseline\", \"week4\", \"week8\"), each = n_subjects),", 
        "  pain = c(course_df$baseline_pain, course_df$week4_pain, course_df$week8_pain)", 
        ")", "", "# 1. Run the Friedman test on long_pain", "", 
        "", "# 2. Retrieve the chi-squared statistic Q and compute Kendall's W", 
        "", ""), out.width.px = 624, out.height.px = 384, params.src = "ex4, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-1", question = structure("What is the primary difference in data structure requirements between the Wilcoxon Signed-Rank test and the Wilcoxon Rank-Sum (Mann-Whitney U) test?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_ca85c3d", 
    option = "Signed-Rank requires independent groups, while Rank-Sum requires paired data.", 
    value = "Signed-Rank requires independent groups, while Rank-Sum requires paired data.", 
    label = structure("Signed-Rank requires independent groups, while Rank-Sum requires paired data.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, it’s the other way around!", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_d22c041", 
    option = "Signed-Rank requires paired/repeated measures (paired observations from the same subject), while Rank-Sum requires independent groups.", 
    value = "Signed-Rank requires paired/repeated measures (paired observations from the same subject), while Rank-Sum requires independent groups.", 
    label = structure("Signed-Rank requires paired/repeated measures (paired observations from the same subject), while Rank-Sum requires independent groups.", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_88227fa", 
    option = "Signed-Rank can only be run on categorical data, while Rank-Sum is for numeric data.", 
    value = "Signed-Rank can only be run on categorical data, while Rank-Sum is for numeric data.", 
    label = structure("Signed-Rank can only be run on categorical data, while Rank-Sum is for numeric data.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("Both tests are run on numeric or ordinal data.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("Pairing is critical: Signed-Rank works on paired differences, while Rank-Sum compares independent distributions.", html = TRUE, class = c("html", 
"character")), incorrect = structure("Pairing is critical: Signed-Rank works on paired differences, while Rank-Sum compares independent distributions.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-1-answer", question = "quiz-1"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 736172959.657193, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-2", question = structure("If your Friedman test is significant, what should you run next to locate which specific time points differ?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_954960", 
    option = "Pairwise independent t-tests.", value = "Pairwise independent t-tests.", 
    label = structure("Pairwise independent t-tests.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, the data is paired (repeated measures), and t-tests are parametric.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_d711274", 
    option = "Pairwise Wilcoxon signed-rank tests with a p-value adjustment (e.g. Bonferroni).", 
    value = "Pairwise Wilcoxon signed-rank tests with a p-value adjustment (e.g. Bonferroni).", 
    label = structure("Pairwise Wilcoxon signed-rank tests with a p-value adjustment (e.g. Bonferroni).", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_fa06330", 
    option = "A Kruskal-Wallis test.", value = "A Kruskal-Wallis test.", 
    label = structure("A Kruskal-Wallis test.", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, Kruskal-Wallis is for independent groups, not repeated measures.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("For repeated measures, follow up a significant Friedman test with pairwise paired Wilcoxon tests, adjusting the p-values to control family-wise error.", html = TRUE, class = c("html", 
"character")), incorrect = structure("For repeated measures, follow up a significant Friedman test with pairwise paired Wilcoxon tests, adjusting the p-values to control family-wise error.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-2-answer", question = "quiz-2"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 1207353393.93778, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
