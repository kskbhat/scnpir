---
title: "Unit 4: Analysis of Contingency Tables"
output: learnr::tutorial
runtime: shiny_prerendered
---



## Welcome

Welcome to the interactive tutorial for **Unit 4: Analysis of Contingency Tables**!

In this tutorial, you will practice:
1. Constructing contingency tables in R and adding marginal sums.
2. Performing Pearson's Chi-Square tests of independence.
3. Calculating Odds Ratios.
4. Evaluating agreement via Cohen's Kappa.
5. Performing advanced tests: Cochran-Armitage Trend test, McNemar's paired test, and Cochran-Mantel-Haenszel (CMH) test.

---

## Exercise 1: Creating Contingency Tables

A contingency table displays the frequency distribution of categorical variables.

### Practice Problem
Consider a clinical trial dataset with 180 subjects. We have two categorical vectors: `treatment` (New vs. Standard) and `pain_relief` (Relieved vs. Not Relieved).
1. Create a 2x2 contingency table named `tab` using the `table()` function.
2. Add marginal row and column totals using `addmargins()`.

<div class="tutorial-exercise" data-label="ex1" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
treatment <- rep(c("New", "Standard"), each = 90)
pain_relief <- c(rep(c("Relieved", "Not Relieved"), times = c(75, 15)),
                 rep(c("Relieved", "Not Relieved"), times = c(30, 60)))

# 1. Create contingency table tab


# 2. Add margins to tab
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex1-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
treatment <- rep(c("New", "Standard"), each = 90)
pain_relief <- c(rep(c("Relieved", "Not Relieved"), times = c(75, 15)),
                 rep(c("Relieved", "Not Relieved"), times = c(30, 60)))

# 1. Create contingency table tab
tab <- table(treatment, pain_relief)
tab

# 2. Add margins to tab
addmargins(tab)
```

</div>

---

## Exercise 2: Chi-Square and Odds Ratios

Let's test the association between treatment and pain relief.

### Practice Problem
Using the table `tab` created in Exercise 1:
1. Run a Pearson's Chi-Square test with Yates' continuity correction (R's default behavior).
2. Run a standard Pearson's Chi-Square test *without* continuity correction (disabling it).
3. Compute the **Odds Ratio (OR)** of achieving relief (New vs. Standard) using cell values.

<div class="tutorial-exercise" data-label="ex2" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
tab <- matrix(c(15, 75, 60, 30), nrow = 2, byrow = TRUE,
              dimnames = list(Treatment = c("New", "Standard"),
                              Relief = c("Not Relieved", "Relieved")))
tab

# 1. Run Yates-corrected Chi-Square


# 2. Run Chi-Square without correction


# 3. Calculate Odds Ratio manually
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex2-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
tab <- matrix(c(15, 75, 60, 30), nrow = 2, byrow = TRUE,
              dimnames = list(Treatment = c("New", "Standard"),
                              Relief = c("Not Relieved", "Relieved")))

# 1. Run Yates-corrected Chi-Square
chisq.test(tab)

# 2. Run Chi-Square without correction
chisq.test(tab, correct = FALSE)

# 3. Calculate Odds Ratio manually
a <- tab[1, 2]
b <- tab[1, 1]
c <- tab[2, 2]
d <- tab[2, 1]
odds_ratio <- (a * d) / (b * c)
odds_ratio
```

</div>

---

## Exercise 3: Cohen's Kappa

Cohen's Kappa measures inter-rater agreement for categorical items.

### Practice Problem
Two clinical observers rated 50 X-ray scans as "Normal" or "Abnormal".
- Observer A & B both Normal: 30
- Observer A Normal, Observer B Abnormal: 5
- Observer A Abnormal, Observer B Normal: 3
- Observer A & B both Abnormal: 12

1. Compute observed agreement ($p_o$) and expected agreement by chance ($p_e$).
2. Calculate Cohen's Kappa ($\kappa$):
   $$\kappa = \frac{p_o - p_e}{1 - p_e}$$

<div class="tutorial-exercise" data-label="ex3" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
kappa_tab <- matrix(c(30, 5, 3, 12), nrow = 2, byrow = TRUE)

# 1. Compute po and pe


# 2. Calculate Cohen's Kappa
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex3-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
kappa_tab <- matrix(c(30, 5, 3, 12), nrow = 2, byrow = TRUE)

N <- sum(kappa_tab)
po <- sum(diag(kappa_tab)) / N

row_sums <- rowSums(kappa_tab)
col_sums <- colSums(kappa_tab)
pe <- sum(row_sums * col_sums) / N^2

kappa <- (po - pe) / (1 - pe)
kappa
```

</div>

---

## Exercise 4: Advanced Contingency Table Tests

R offers specialized tests for trends, paired designs, and stratified analyses.

### Practice Problem
1. **Trend test**: Perform a Cochran-Armitage Trend Test using `prop.trend.test(x, n)` where successes are `x = c(10, 20, 35)` and sample sizes are `n = c(50, 50, 50)`.
2. **Paired design**: Perform a McNemar test on a paired matrix `paired_tab` (pre vs post results for same subjects).
3. **Stratified design**: Perform a Cochran-Mantel-Haenszel (CMH) test on a 2x2x2 stratified array `strat_array`.

<div class="tutorial-exercise" data-label="ex4" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# Paired table matrix:
paired_tab <- matrix(c(40, 10, 25, 15), nrow = 2)

# Stratified 2x2x2 array (Stratum 1 & 2):
strat_array <- array(c(10, 20, 15, 30,  # Stratum 1
                       5, 15, 8, 22),   # Stratum 2
                     dim = c(2, 2, 2))

# 1. Run Cochran-Armitage Trend Test


# 2. Run McNemar Paired Test on paired_tab


# 3. Run Cochran-Mantel-Haenszel Test on strat_array
```

<script type="application/json" data-ui-opts="1">{"engine":"r","has_checker":false,"caption":"<span data-i18n=\"text.enginecap\" data-i18n-opts=\"{&quot;engine&quot;:&quot;R&quot;}\">R Code<\/span>"}</script></div>

<div class="tutorial-exercise-support" data-label="ex4-solution" data-completion="1" data-diagnostics="1" data-startover="1" data-lines="0" data-pipe="|&gt;">

``` text
# 1. Run Cochran-Armitage Trend Test
prop.trend.test(x = c(10, 20, 35), n = c(50, 50, 50))

# 2. Run McNemar Paired Test
mcnemar.test(paired_tab)

# 3. Run Cochran-Mantel-Haenszel Test
mantelhaen.test(strat_array)
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
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server-start">
library(learnr)
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
"knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(label = "setup", 
    include = FALSE)), setup = NULL, chunks = list(list(label = "ex1", 
    code = "treatment <- rep(c(\"New\", \"Standard\"), each = 90)\npain_relief <- c(rep(c(\"Relieved\", \"Not Relieved\"), times = c(75, 15)),\n                 rep(c(\"Relieved\", \"Not Relieved\"), times = c(30, 60)))\n\n# 1. Create contingency table tab\n\n\n# 2. Add margins to tab\n\n", 
    opts = list(label = "\"ex1\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("treatment <- rep(c(\"New\", \"Standard\"), each = 90)", 
    "pain_relief <- c(rep(c(\"Relieved\", \"Not Relieved\"), times = c(75, 15)),", 
    "                 rep(c(\"Relieved\", \"Not Relieved\"), times = c(30, 60)))", 
    "", "# 1. Create contingency table tab", "tab <- table(treatment, pain_relief)", 
    "tab", "", "# 2. Add margins to tab", "addmargins(tab)"), chunk_opts = list(
        label = "ex1-solution")), tests = NULL, options = list(
        eval = FALSE, echo = TRUE, results = "markup", tidy = FALSE, 
        tidy.opts = NULL, collapse = FALSE, prompt = FALSE, comment = NA, 
        highlight = FALSE, size = "normalsize", background = "#F7F7F7", 
        strip.white = TRUE, cache = 0, cache.path = "unit4_contingency_tables_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit4_contingency_tables_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex1", exercise = TRUE, code = c("treatment <- rep(c(\"New\", \"Standard\"), each = 90)", 
        "pain_relief <- c(rep(c(\"Relieved\", \"Not Relieved\"), times = c(75, 15)),", 
        "                 rep(c(\"Relieved\", \"Not Relieved\"), times = c(30, 60)))", 
        "", "# 1. Create contingency table tab", "", "", "# 2. Add margins to tab", 
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
"knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(label = "setup", 
    include = FALSE)), setup = NULL, chunks = list(list(label = "ex2", 
    code = "tab <- matrix(c(15, 75, 60, 30), nrow = 2, byrow = TRUE,\n              dimnames = list(Treatment = c(\"New\", \"Standard\"),\n                              Relief = c(\"Not Relieved\", \"Relieved\")))\ntab\n\n# 1. Run Yates-corrected Chi-Square\n\n\n# 2. Run Chi-Square without correction\n\n\n# 3. Calculate Odds Ratio manually\n\n", 
    opts = list(label = "\"ex2\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("tab <- matrix(c(15, 75, 60, 30), nrow = 2, byrow = TRUE,", 
    "              dimnames = list(Treatment = c(\"New\", \"Standard\"),", 
    "                              Relief = c(\"Not Relieved\", \"Relieved\")))", 
    "", "# 1. Run Yates-corrected Chi-Square", "chisq.test(tab)", 
    "", "# 2. Run Chi-Square without correction", "chisq.test(tab, correct = FALSE)", 
    "", "# 3. Calculate Odds Ratio manually", "a <- tab[1, 2]", 
    "b <- tab[1, 1]", "c <- tab[2, 2]", "d <- tab[2, 1]", "odds_ratio <- (a * d) / (b * c)", 
    "odds_ratio"), chunk_opts = list(label = "ex2-solution")), 
    tests = NULL, options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit4_contingency_tables_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit4_contingency_tables_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex2", exercise = TRUE, code = c("tab <- matrix(c(15, 75, 60, 30), nrow = 2, byrow = TRUE,", 
        "              dimnames = list(Treatment = c(\"New\", \"Standard\"),", 
        "                              Relief = c(\"Not Relieved\", \"Relieved\")))", 
        "tab", "", "# 1. Run Yates-corrected Chi-Square", "", 
        "", "# 2. Run Chi-Square without correction", "", "", 
        "# 3. Calculate Odds Ratio manually", "", ""), out.width.px = 624, 
        out.height.px = 384, params.src = "ex2, exercise=TRUE", 
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
"knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(label = "setup", 
    include = FALSE)), setup = NULL, chunks = list(list(label = "ex3", 
    code = "kappa_tab <- matrix(c(30, 5, 3, 12), nrow = 2, byrow = TRUE)\n\n# 1. Compute po and pe\n\n\n# 2. Calculate Cohen's Kappa\n\n", 
    opts = list(label = "\"ex3\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("kappa_tab <- matrix(c(30, 5, 3, 12), nrow = 2, byrow = TRUE)", 
    "", "N <- sum(kappa_tab)", "po <- sum(diag(kappa_tab)) / N", 
    "", "row_sums <- rowSums(kappa_tab)", "col_sums <- colSums(kappa_tab)", 
    "pe <- sum(row_sums * col_sums) / N^2", "", "kappa <- (po - pe) / (1 - pe)", 
    "kappa"), chunk_opts = list(label = "ex3-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit4_contingency_tables_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit4_contingency_tables_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex3", exercise = TRUE, code = c("kappa_tab <- matrix(c(30, 5, 3, 12), nrow = 2, byrow = TRUE)", 
        "", "# 1. Compute po and pe", "", "", "# 2. Calculate Cohen's Kappa", 
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
"knitr::opts_chunk$set(echo = FALSE)"), chunk_opts = list(label = "setup", 
    include = FALSE)), setup = NULL, chunks = list(list(label = "ex4", 
    code = "# Paired table matrix:\npaired_tab <- matrix(c(40, 10, 25, 15), nrow = 2)\n\n# Stratified 2x2x2 array (Stratum 1 & 2):\nstrat_array <- array(c(10, 20, 15, 30,  # Stratum 1\n                       5, 15, 8, 22),   # Stratum 2\n                     dim = c(2, 2, 2))\n\n# 1. Run Cochran-Armitage Trend Test\n\n\n# 2. Run McNemar Paired Test on paired_tab\n\n\n# 3. Run Cochran-Mantel-Haenszel Test on strat_array\n\n", 
    opts = list(label = "\"ex4\"", exercise = "TRUE"), engine = "r")), 
    code_check = NULL, error_check = NULL, check = NULL, solution = structure(c("# 1. Run Cochran-Armitage Trend Test", 
    "prop.trend.test(x = c(10, 20, 35), n = c(50, 50, 50))", 
    "", "# 2. Run McNemar Paired Test", "mcnemar.test(paired_tab)", 
    "", "# 3. Run Cochran-Mantel-Haenszel Test", "mantelhaen.test(strat_array)"
    ), chunk_opts = list(label = "ex4-solution")), tests = NULL, 
    options = list(eval = FALSE, echo = TRUE, results = "markup", 
        tidy = FALSE, tidy.opts = NULL, collapse = FALSE, prompt = FALSE, 
        comment = NA, highlight = FALSE, size = "normalsize", 
        background = "#F7F7F7", strip.white = TRUE, cache = 0, 
        cache.path = "unit4_contingency_tables_cache/html/", 
        cache.vars = NULL, cache.lazy = TRUE, dependson = NULL, 
        autodep = FALSE, cache.rebuild = FALSE, fig.keep = "high", 
        fig.show = "asis", fig.align = "default", fig.path = "unit4_contingency_tables_files/figure-html/", 
        dev = "png", dev.args = NULL, dpi = 192, fig.ext = "png", 
        fig.width = 6.5, fig.height = 4, fig.env = "figure", 
        fig.cap = NULL, fig.scap = NULL, fig.lp = "fig:", fig.subcap = NULL, 
        fig.pos = "", out.width = 624, out.height = NULL, out.extra = NULL, 
        fig.retina = 2, external = TRUE, sanitize = FALSE, interval = 1, 
        aniopts = "controls,loop", warning = TRUE, error = FALSE, 
        message = TRUE, render = NULL, ref.label = NULL, child = NULL, 
        engine = "r", split = FALSE, include = TRUE, purl = TRUE, 
        max.print = 1000, label = "ex4", exercise = TRUE, code = c("# Paired table matrix:", 
        "paired_tab <- matrix(c(40, 10, 25, 15), nrow = 2)", 
        "", "# Stratified 2x2x2 array (Stratum 1 & 2):", "strat_array <- array(c(10, 20, 15, 30,  # Stratum 1", 
        "                       5, 15, 8, 22),   # Stratum 2", 
        "                     dim = c(2, 2, 2))", "", "# 1. Run Cochran-Armitage Trend Test", 
        "", "", "# 2. Run McNemar Paired Test on paired_tab", 
        "", "", "# 3. Run Cochran-Mantel-Haenszel Test on strat_array", 
        "", ""), out.width.px = 624, out.height.px = 384, params.src = "ex4, exercise=TRUE", 
        fig.num = 0, exercise.df_print = "paged", exercise.checker = "NULL"), 
    engine = "r", version = "4"), class = c("r", "tutorial_exercise"
)))
</script>
<!--/html_preserve-->
<!--html_preserve-->
<script type="application/shiny-prerendered" data-context="server">
learnr:::question_prerendered_chunk(structure(list(type = "learnr_radio", label = "quiz-1", question = structure("Which test is appropriate for evaluating differences in categorical outcomes from paired observations (e.g. before/after on the same patients)?", html = TRUE, class = c("html", 
"character")), answers = list(structure(list(id = "lnr_ans_64a541a", 
    option = "Pearson's Chi-Square test", value = "Pearson's Chi-Square test", 
    label = structure("Pearson’s Chi-Square test", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, standard Chi-Square assumes independent observations.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_b36ab1d", 
    option = "McNemar's test", value = "McNemar's test", label = structure("McNemar’s test", html = TRUE, class = c("html", 
    "character")), correct = TRUE, message = NULL, type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer")), structure(list(id = "lnr_ans_6256bc8", 
    option = "Cochran-Mantel-Haenszel test", value = "Cochran-Mantel-Haenszel test", 
    label = structure("Cochran-Mantel-Haenszel test", html = TRUE, class = c("html", 
    "character")), correct = FALSE, message = structure("No, CMH is for stratified independent tables.", html = TRUE, class = c("html", 
    "character")), type = "literal"), class = c("tutorial_question_answer", 
"tutorial_quiz_answer"))), button_labels = list(submit = structure("<span data-i18n=\"button.questionsubmit\">Submit Answer<\u002fspan>", html = TRUE, class = c("html", 
"character")), try_again = structure("<span data-i18n=\"button.questiontryagain\">Try Again<\u002fspan>", html = TRUE, class = c("html", 
"character"))), messages = list(correct = structure("Correct!", html = TRUE, class = c("html", 
"character")), try_again = structure("McNemar’s test checks marginal homogeneity in paired contingency tables.", html = TRUE, class = c("html", 
"character")), incorrect = structure("McNemar’s test checks marginal homogeneity in paired contingency tables.", html = TRUE, class = c("html", 
"character")), message = NULL, post_message = NULL), ids = list(
    answer = "quiz-1-answer", question = "quiz-1"), loading = NULL, 
    random_answer_order = FALSE, allow_retry = FALSE, seed = 1073900719.49993, 
    options = list()), class = c("learnr_radio", "tutorial_question"
)), session = session)
</script>
<!--/html_preserve-->
