#' @title To conduct eBJ test
#' @param Z_score GWAS summary statistics
#' @param Sigma the correlation matrix
#' @return pval.eBJ
#' @export
eBJ = function(Z_score,Sigma){
  eigen.res = eigen(Sigma)
  lambdas = eigen.res$values
  eigen.vec = eigen.res$vectors
  z.tmp = Z_score
  K = length(z.tmp)
  PC.vec = t(eigen.vec) %*% z.tmp
  PC.std = PC.vec/sqrt(lambdas)
  pval.eBJ=GBJ::BJ(PC.std,diag(K))$BJ_pvalue
  return(pval.eBJ)
}
