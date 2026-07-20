test_that("list_tutorials returns available scnpir tutorials", {
  avail <- list_tutorials()
  expect_true(is.data.frame(avail))
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

test_that("unit launcher functions are valid functions", {
  expect_true(is.function(run_unit1))
  expect_true(is.function(run_unit2))
  expect_true(is.function(run_unit3))
  expect_true(is.function(run_unit4))
  expect_true(is.function(run_unit5))
})
