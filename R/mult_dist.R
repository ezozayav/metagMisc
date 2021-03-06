
#' @title Average multiple distance matrices.
#' @description This function can be used in order to avergage beta diversity over multiple rarefaction iterations.
#' @param dlist List of distance matrices (class 'dist' or 'matrix')
#'
#' @return Distance matrix of the same class as input matrices ('dist' or 'matrix') with averaged values.
#' @export
#'
#' @examples
#' library(plyr)
#' # Generate dummy data (list with 3 5x5 matrices)
#' ddd <- rlply(.n = 3, .expr = function(){ as.dist( matrix(sample(1:1000, size = 25, replace = T), ncol = 5)) })
#' ddd
#'
#' # Average matrices
#' mult_dist_average(ddd)
#'
mult_dist_average <- function(dlist){
  # dlist = list of `dist` or `matrix` objects

  ## Input = list of matrices
  if(class(dlist[[1]]) %in% "matrix"){
    res <- Reduce("+", dlist) / length(dlist)
  }

  ## Input = list of dist
  if(class(dlist[[1]]) %in% "dist"){
    res <- Reduce("+", plyr::llply(.data = dlist, .fun = as.matrix)) / length(dlist)
    res <- as.dist(res)
  }

  return(res)
}


#' @title Compute beta diversity for each rarefaction iteration.
#'
#' @param x List of phyloseq objects (result of \code{\link{phyloseq_mult_raref}})
#' @param method A character string with the name of supported dissimilarity index (see \code{\link{distanceMethodList}})
#' @param average Logical; if TRUE, dissimilarity averaged over rarefication iterations will be returned; if FALSE, list of dissimilarity matrices will be returned.
#' @param ... Additional arguments will be passed to \code{\link[phyloseq]{distance}}
#'
#' @return List of 'dist'-matrices (if average = FALSE) or a single 'dist' (if average = TRUE).
#' @export
#'
#' @examples
#' # Load data
#' data(esophagus)
#' sample_sums(esophagus)  # samples has different number of sequences
#'
#' # Perform multiple rarefaction (sample 200 sequences from each sample, repeat the procedure 100 times)
#' esor <- phyloseq_mult_raref(esophagus, SampSize = 200, iter = 100)
#' sample_sums(esor[[1]])  # rarefied data
#'
#' # Estimate sample dissimilarity independently for each iteration
#' eso_dis <- mult_dissim(esor, method = "unifrac", average = F)
#' eso_dis[[1]]   # unweighted UniFrac distances for the first rarefaction iteration
#'
#' # Average sample dissimilarities over all rarefaction iterations
#' eso_dis_avg <- mult_dissim(esor, method = "unifrac", average = T)
#' eso_dis_avg    # mean unweighted UniFrac distances
#'
mult_dissim <- function(x, method = "bray", average = T, ...){

  # require(phyloseq)
  # require(plyr)

  physeq_dissim <- plyr::llply(
    .data = x,
    .fun = function(z, ...){ phyloseq::distance(physeq = z, type = "samples", ...) },
    method = method,
    .progress = "text")

  if(average == TRUE){
    physeq_dissim_avg <- mult_dist_average(dlist = physeq_dissim)
    return(physeq_dissim_avg)
  } else {
    return(physeq_dissim)
  }
}

