#' List all available interactive tutorials in scnpir
#'
#' @return A data frame of available tutorials
#' @export
#' @examples
#' \dontrun{
#' list_tutorials()
#' }
list_tutorials <- function() {
  learnr::available_tutorials(package = "scnpir")
}

#' Get file path to a packaged dataset
#'
#' @param name Name of dataset CSV file (e.g. "course_dataset.csv")
#' @return Absolute file path to the dataset
#' @export
#' @examples
#' \dontrun{
#' get_dataset_path("course_dataset.csv")
#' }
get_dataset_path <- function(name) {
  path <- system.file("extdata", name, package = "scnpir")
  if (!file.exists(path) || path == "") {
    stop(paste("Dataset", name, "not found in scnpir package."))
  }
  path
}

#' Run Unit 1 Interactive Tutorial
#' @export
run_unit1 <- function() {
  learnr::run_tutorial("unit1_r_basics", package = "scnpir")
}

#' Run Unit 2 Interactive Tutorial
#' @export
run_unit2 <- function() {
  learnr::run_tutorial("unit2_descriptive_stats", package = "scnpir")
}

#' Run Unit 3 Interactive Tutorial
#' @export
run_unit3 <- function() {
  learnr::run_tutorial("unit3_confidence_intervals", package = "scnpir")
}

#' Run Unit 4 Interactive Tutorial
#' @export
run_unit4 <- function() {
  learnr::run_tutorial("unit4_contingency_tables", package = "scnpir")
}

#' Run Unit 5 Interactive Tutorial
#' @export
run_unit5 <- function() {
  learnr::run_tutorial("unit5_nonparametric_tests", package = "scnpir")
}
