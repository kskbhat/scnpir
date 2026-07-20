test_that("all 5 unit tutorials exist in inst/tutorials", {
  tutorials <- c(
    "unit1_r_basics",
    "unit2_descriptive_stats",
    "unit3_confidence_intervals",
    "unit4_contingency_tables",
    "unit5_nonparametric_tests"
  )

  tut_dir <- system.file("tutorials", package = "scnpir")
  expect_true(dir.exists(tut_dir))

  for (tut in tutorials) {
    rmd_file <- system.file("tutorials", tut, paste0(tut, ".Rmd"), package = "scnpir")
    expect_true(file.exists(rmd_file), info = paste("Missing Rmd file for", tut))
    expect_gt(file.info(rmd_file)$size, 100)
  }
})

test_that("tutorials can be discovered by learnr", {
  avail <- learnr::available_tutorials(package = "scnpir")
  expect_true("name" %in% names(avail))
  expect_gte(nrow(avail), 5)
})

test_that("all 5 learnr tutorials pre-render and validate cleanly without errors", {
  tutorials <- c(
    "unit1_r_basics",
    "unit2_descriptive_stats",
    "unit3_confidence_intervals",
    "unit4_contingency_tables",
    "unit5_nonparametric_tests"
  )

  for (tut in tutorials) {
    rmd_file <- system.file("tutorials", tut, paste0(tut, ".Rmd"), package = "scnpir")
    expect_true(file.exists(rmd_file))

    out_file <- tempfile(fileext = ".html")
    on.exit(unlink(out_file), add = TRUE)

    # Test knitting/pre-rendering the learnr tutorial Rmd
    expect_no_error({
      rmarkdown::render(
        input = rmd_file,
        output_file = out_file,
        quiet = TRUE,
        run_pandoc = FALSE
      )
    })
  }
})
