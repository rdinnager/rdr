make_package <- function(github = NULL, dir = ".", pipe = FALSE, rlang = FALSE, ...) {
  if(!is.null(github)) {
    usethis::create_from_github(github, ...)
  } else {
    usethis::create_package(".", ...)
  }
  usethis::use_package_doc()
}

#' Create a package extending torch
#'
#' @export
create_torch_package <- function() {
  name <- basename(getwd())
  usethis::create_package(paste0("../", name))
  usethis::use_readme_rmd()
  usethis::use_github_action_check_standard()
  workflow <- yaml::read_yaml(".github/workflows/R-CMD-check.yaml")
  names(workflow)[1] <- "on"
  workflow$jobs$`R-CMD-check`$env$TORCH_INSTALL <- 1L
  #workflow$jobs$`R-CMD-check`$env$TORCH_TEST <- 1L
  new_workflow <- yaml::as.yaml(workflow)
  new_workflow <- gsub("'on'", "on", new_workflow, fixed = TRUE)
  readr::write_lines(new_workflow, ".github/workflows/R-CMD-check.yaml")
  usethis::use_testthat()
}
