\name{wage.rates}
\alias{wage.rates}
\docType{data}
\title{Wage Rates of 753 Women}
\description{Wage rates of 753 married white women with left censoring.
}
\usage{data(wage.rates)}
\format{
A data frame with 753 observed wage rates of married white women in 1975. Some wage rates are set equal to zero, this means that those wives did not work in 1975, therefore, these observations are considered left censored at zero.
}

\encoding{latin1}

\source{
Mroz, T.A. 1987. "The sesitivity of an empirical model of married women´s hours of work to economic and statistical assumptions".
}

\examples{
\dontrun{
##Load the data
 library(CensRegMod)
 data(wage.rates)

##Set the response y and covariate x

#Set the response y and covariate x
 y    <- wage.rates$wage
 x1   <- cbind(1,wage.rates$age,wage.rates$educ,wage.rates$hours/1000)
 cc   <- c(rep(0,428),rep(1,325))

##Fits a left mixture censored Student-t model to the data
 fitT <- HeavyC.mixR(cc, -y, -x1, Abetas = NULL, medj= NULL, sigma2 = NULL, nu=NULL, pii = NULL,
 g = 2, get.init = TRUE, criteria = TRUE,  group = FALSE, family = "T", error = 0.00000001,
 iter.max = 500, obs.prob= FALSE, kmeans.param = NULL)

##Fits a left mixture censored Normal model to the data
 fitN <- HeavyC.mixR(cc, -y, -x1, Abetas = NULL, medj= NULL, sigma2 = NULL, nu=NULL, pii = NULL,
 g = 2, get.init = TRUE, criteria = TRUE, group = FALSE, family = "Normal", error = 0.000000001,
 iter.max = 500, obs.prob= FALSE, kmeans.param = NULL)

#Standard error for T
 IFmixRegT<- imm.fmcr(y,x1,cc, fitT)
 SEmixT   <- sqrt(diag(solve(IFmixRegT$IM)))

#Standard error for N
 IFmixRegN<- imm.fmcr(y,x1,cc, fitN)
 SEmixN   <- sqrt(diag(solve(IFmixRegN$IM)))
 }
}


\keyword{datasets}



