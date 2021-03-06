% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prod_affine_registration.R
\name{prod_affine_registration}
\alias{prod_affine_registration}
\title{Product of affine transformations}
\usage{
prod_affine_registration(x)
}
\arguments{
\item{x}{tibble of Registrations as issued from \code{\link{read_ViewRegistration}}}
}
\description{
Product of affine transformations
}
\examples{
v1 <- round(rnorm(12), digits = 2)
v2 <- sample(1:10, 12, replace = TRUE)
good_res <- crossprod(matrix(c(v1, 0, 0, 0, 1), 4, 4, byrow = TRUE),
  matrix(c(v2, 0, 0, 0, 1), 4, 4, byrow = TRUE))
x <- tibble::tibble(
  regis_name = c(1,1),
  Timepoint = c(1,1),
  Setup = c(1,1),
  vector_Affine = list(v1 = v1, v2 = v2))
identical(good_res, prod_affine_registration(x)$prod_affine[[1]])
# Both should be equal but solve uses approximations
identical(solve(good_res), prod_affine_registration(x)$prod_affine_inv[[1]])

}
