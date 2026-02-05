#' gather_results
#'
#' @return A tibble
#' @export
#'

gather_results <- function() {

  d <-
    read_mcmc("catch", "catch") |>
    dplyr::left_join(read_mcmc("ssb", "ssb"), by = c("iter", "year")) |>
    dplyr::left_join(read_mcmc("n1st", "rec"), by = c("iter", "year")) |>
    dplyr::left_join(read_mcmc("f", "refF"), by = c("iter", "year")) |>
    dplyr::left_join(read_mcmc("refbio1", "refbio1"), by = c("iter", "year"))
  #  catch <- dplyr::join(catch,readmcmcfile("refbiowerr.mcmc",cn="refbiowerr"))
  #  catch <- dplyr::join(catch,readmcmcfile("ssbwerr.mcmc",cn="ssbwerr"))
  if(file.exists("m7.mcmc")) {
    d <-
      dplyr::left_join(d, read_mcmc("m7", "m7"), by = c("iter", "year"))
  }

  return(d)

}