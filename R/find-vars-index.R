#' Return return indices of columns in opal dataframe
#' 
#' Some ds functions ask you to provide the index of variables as arguments.
#' This is highly susceptable to breaking! This is a simple function that will
#' return the index of variables for a given cohort. It is usefully used in 
#' combination the "keep.cols" argument of ds.dataFrameSubset.
#' 
#' @param df opal dataframe
#' @param vars vector of variable names in dataframe
#' @param cohorts cohort that you want to find indices for
#' 
#' @return list of indices where length of list is number of cohorts provided
#' 
#' @importFrom dsBaseClient ds.colnames
#' @importFrom purrr pmap
#' 
#' @export
dh.findVarsIndex <- function(df, vars, cohorts){
  
  dh.doVarsExist(df, vars)
  dh.doesDfExist(df)

ref_tab <- tibble(
  var = rep(vars, length(names(opals))),
  cohort = rep(names(opals), each = length(vars))
  )    
   
tmp <- ref_tab %>%
  pmap(
    function(var, cohort){
    
    which(
      ds.colnames(df, datasources = opals[cohort])[[1]] %in% var == TRUE)
  })

out <- split(unlist(tmp), ceiling(seq_along(unlist(tmp)) / length(vars)))
names(out) <- names(opals)

return(out)
}