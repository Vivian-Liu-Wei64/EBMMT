#' @title To conduct Wald test
#' @param Z_score GWAS summary statistics
#' @param Sigma the correlation matrix
#' @return pval.Wald
#' @importFrom stats pchisq
#' @export
#'
#'
Wald <-function(Z_score,Sigma){
    K = length(Z_score)
    R.inv = solve(Sigma) ## inverse
    z.tmp =as.matrix(Z_score) # column vector
    T.Wald = t(z.tmp)%*%R.inv%*%z.tmp # Quadratic form
    pval.Wald = pchisq(T.Wald,df=K,lower.tail=FALSE) #
    return(pval.Wald)
  }
