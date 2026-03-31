#' set_prognosis
#'
#' @param infile
#' @param outfile
#' @param fbar
#' @param hr
#' @param w.rho
#' @param w.cv
#' @param rec.rho
#' @param ass.cv
#' @param ass.rho
#' @param ass.bias
#' @param Btrigger
#' @param MaxChange
#' @param mW.years
#' @param LastYearsTacRatio
#'
#' @export
set_prognosis <- function(infile,
                          outfile,
                          fbar,
                          hr,
                          w.rho,
                          w.cv,
                          rec.rho,
                          ass.cv,
                          ass.rho,
                          ass.bias,
                          Btrigger,
                          MaxChange,
                          mW.years,
                          LastYearsTacRatio) {



  readLines(infile) |> 
    line_replace(fbar,'# FishingMortality') |> 
    line_replace(hr,'# HarvestRate') |> 
    line_replace(w.rho,'# WeightCorr') |> 
    line_replace(w.cv,'# WeightCV') |> 
    line_replace(rec.rho,'# RecrCorr') |> 
    line_replace(ass.cv,"# AssessmentCV") |> 
    line_replace(ass.rho,"# AssessmentCorr") |> 
    line_replace(ass.bias,"# AssessmentBias") |> 
    line_replace(Btrigger,"# Btrigger") |> 
    line_replace(MaxChange,"# MaxChange") |> 
    line_replace(mW.years,"# Meanwtyears") |> 
    line_replace(LastYearsTacRatio,"# LastYearsTacRatio") |> 
    write.table(file = outfile,
                row.names = F, col.names = F, quote = F)

}
