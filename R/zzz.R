
#' A short title line describing what the package does
#' 
#' A more detailed description of what the package does. A length  of about
#' one to five lines is recommended.
#' 
#' @import methods Rcpp
#' @useDynLib rmpi3, .registration = TRUE
#' @name rmpi3-package
NULL

loadModule("ompi", TRUE)
