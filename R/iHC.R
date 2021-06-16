#' @title To conduct iHC
#' @param Z_score GWAS summary statistics
#' @param Sigma the correlation matrix
#' @return pval.iHC
#' @export
#'
iHC = function(Z_score,Sigma){
  U = chol(Sigma)     #### Cholesky decompozition
  z.tmp = Z_score
  K = length(z.tmp)
  UC=solve(t(U))%*%z.tmp
  pval.iHC=GBJ::HC(UC,diag(K))$HC_pvalue
  return(pval.iHC)
}
