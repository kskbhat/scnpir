test_that("all package datasets exist in extdata and load cleanly", {
  datasets <- c(
    "student_scores.csv",
    "survey_income.csv",
    "course_dataset.csv",
    "exam_pairs.csv"
  )

  for (ds in datasets) {
    ds_path <- system.file("extdata", ds, package = "scnpir")
    if (!file.exists(ds_path) || ds_path == "") {
      ds_path <- file.path("..", "..", "inst", "extdata", ds)
    }
    if (!file.exists(ds_path) || ds_path == "") {
      ds_path <- file.path("inst", "extdata", ds)
    }

    expect_true(file.exists(ds_path), info = paste("Missing dataset:", ds))

    df <- read.csv(ds_path)
    expect_true(is.data.frame(df))
    expect_gt(nrow(df), 0)
    expect_gt(ncol(df), 0)
  }
})
