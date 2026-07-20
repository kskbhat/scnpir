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
