
# Returns full path to the runner binary. Works when package is loaded the
# normal way, and when loaded with devtools::load_all().
# from r-lib/processx pkg
runner_path <- function() {

  runner_name <- "runner"

  # Detect if package was loaded via devtools::load_all()
  dev_meta <- parent.env(environment())$.__DEVTOOLS__
  devtools_loaded <- !is.null(dev_meta)

  if (devtools_loaded) {
    subdir <- file.path("src", "runner")
  } else {
    subdir <- paste0("bin", Sys.getenv("R_ARCH"))
  }

  system.file(subdir, runner_name, package = "rmpi3", mustWork = TRUE)
}
