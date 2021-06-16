#' @title To conduct eHC test
#' @param Z_score GWAS summary statistics
#' @param Sigma the correlation matrix
#' @return pval.eHC
#' @export
#'
eHC = function(Z_score,Sigma){
  eigen.res = eigen(Sigma)
  lambdas = eigen.res$values
  eigen.vec = eigen.res$vectors
  z.tmp = Z_score
  K = length(z.tmp)
  PC.vec = t(eigen.vec) %*% z.tmp
  PC.std = PC.vec/sqrt(lambdas)
  pval.eHC=GBJ::HC(PC.std,diag(K))$HC_pvalue
  return(pval.eHC)
}
