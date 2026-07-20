test_that("all 5 unit tutorials exist in inst/tutorials", {
  tutorials <- c(
    "unit1_r_basics",
    "unit2_descriptive_stats",
    "unit3_confidence_intervals",
    "unit4_contingency_tables",
    "unit5_nonparametric_tests"
  )

  for (tut in tutorials) {
    rmd_file <- system.file("tutorials", tut, paste0(tut, ".Rmd"), package = "scnpir")
    if (!file.exists(rmd_file) || rmd_file == "") {
      rmd_file <- file.path("..", "..", "inst", "tutorials", tut, paste0(tut, ".Rmd"))
    }
    if (!file.exists(rmd_file) || rmd_file == "") {
      rmd_file <- file.path("inst", "tutorials", tut, paste0(tut, ".Rmd"))
    }

    expect_true(file.exists(rmd_file), info = paste("Missing Rmd file for", tut))
    expect_gt(file.info(rmd_file)$size, 100)
  }
})

test_that("tutorials can be discovered by learnr", {
  avail <- learnr::available_tutorials(package = "scnpir")
  expect_true(is.data.frame(avail))
})
