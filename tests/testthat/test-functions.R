test_that("list_tutorials returns available scnpir tutorials", {
  avail <- list_tutorials()
  expect_true(is.data.frame(avail) || "name" %in% names(avail))
})

test_that("get_dataset_path returns valid path for existing datasets", {
  datasets <- c("student_scores.csv", "survey_income.csv", "course_dataset.csv", "exam_pairs.csv")
  for (ds in datasets) {
    p <- get_dataset_path(ds)
    expect_true(file.exists(p))
  }
})

test_that("get_dataset_path throws error for non-existent dataset", {
  expect_error(get_dataset_path("non_existent_dataset.csv"))
})

test_that("unit launcher functions execute learnr::run_tutorial", {
  # Temporarily trace learnr::run_tutorial to execute functions without launching browser
  suppressMessages(trace(learnr::run_tutorial, tracer = quote(return(invisible(TRUE))), print = FALSE))
  on.exit(suppressWarnings(untrace(learnr::run_tutorial)), add = TRUE)

  expect_invisible(run_unit1())
  expect_invisible(run_unit2())
  expect_invisible(run_unit3())
  expect_invisible(run_unit4())
  expect_invisible(run_unit5())
})
