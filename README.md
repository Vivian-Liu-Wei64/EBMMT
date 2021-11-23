# EBMMT：The Eigen Based Tests for Testing Effects of Multiple Traits based on Summary Statistics
EBMMT includs nine approches (i.e., the OMNI, eHC, eBJ, iHC, GHC, GBJ, MinP, Wald and PCFisher tests) for detecting the association between a single SNP and multiple traits based on GWAS summary statistics while accounting for the correlation structure among multiple traits.

## Setup

Please use the following command in R to install the package:
```
library(usethis)
library(devtools)
install_github("Vivian-Liu-Wei64/EBMMT")
```
## Usage

The EBMMT performs the multiple traits association test based on GWAS summary statistics.

The eHC function is used to calculate the P_values of the eHC test.

The eBJ function is used to calculate the P_values of the eBJ test.

The iHC function is used to calculate the P_values of the iHC test.

The Wald function is used to calculate the P_values of the Wald test.

The PCFisher function is used to calculate the P_values of the PCFisher tests.

The Eigen_ana function is used to calculate the P_values of the eHC, eBJ, iHC, GHC, GBJ, MinP, Wald and PCFisher tests. 

# The P_values of the GBJ, GHC and MinP tests can be implemented in the GBJ package.

```
Eigen_ana(Z_score, Sigma)
```
Given Z_score and Sigma, the Eigen_ana function provids the P-values of the eHC, eBJ, iHC, GHC, GBJ, MinP, Wald and PCFisher tests. 


## Example 
```
library(EBMMT)  # load the EBMMT package

# Z_score shold be a vector of test statistics for each factor in the set (i.e. marginal test statistic for each trait).

# Sigma shpuld be a matrix of the correlations between all the test statistics in the set.

#example 

library(mvtnorm)

Sigma<-matrix(c(1,-0.08,-0.42,-0.08,1,0.27,-0.42,0.27,1),3,3)  

Z_score<- as.vector(rmvnorm(1,mean=c(1.3,1.3,1.3),sigma=Sigma) )

Eigen_ana(Z_score,Sigma) 


-----------The p_values of eHC, eBJ, iHC, GHC, GBJ, MinP, Wald and PCFisher tests-----------

        OMNI_p      eHC_p       eBJ_p       iHC_p       GHC_p      GBJ_p        MinP_p     Wald_p    PCFisher_p
[1] 0.027059710 0.013585974 0.024266871 0.023478188 0.045186983 0.066075545 0.036742809 0.008783658 0.009267857

```

## Reference
Liu, W., Xu, Y., Wang, A., Huang, T.# and Liu, Z.#,  2021. The Eigen Higher Criticism and Eigen Berk-Jones tests for Testing Effects of Multiple Traits based on Summary Statistics (Published)
