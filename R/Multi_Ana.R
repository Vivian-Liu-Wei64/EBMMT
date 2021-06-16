#' @title To perform multiple trait analysis
#' @param Z_score GWAS summary statistics
#' @param Sigma the correlation matrix
#' @return the p-values of multi-trait tests
#' @import compiler
#' @export
Eigen_ana<-function(Z_score,Sigma){
  #compiler::enableJIT(9)

  eHC_p<-eHC(Z_score,Sigma)

  eBJ_p<-eBJ(Z_score,Sigma)

  iHC_p<-iHC(Z_score,Sigma)

  GHC_p<-GBJ::GHC(Z_score,Sigma)$GHC_pvalue

  GBJ_p<-GBJ::GBJ(Z_score, Sigma)$GBJ_pvalue

  MinP_p<-GBJ::minP(Z_score, Sigma)$minP_pvalue

  Wald_p<-Wald(Z_score,Sigma)

  PCFisher_p<-PCFisher(Z_score,Sigma)

  OMNI_p<-CCT(c(eHC_p,eBJ_p,iHC_p, GHC_p,GBJ_p,MinP_p))

  out <- c(OMNI_p,eHC_p,eBJ_p,iHC_p,GHC_p,GBJ_p,MinP_p,Wald_p,PCFisher_p)

  names(out)<-c("OMNI_p","eHC_p","eBJ_p","iHC_p","GHC_p","GBJ_p","MinP_p","Wald_p","PCFisher_p")

  return(out)
}
