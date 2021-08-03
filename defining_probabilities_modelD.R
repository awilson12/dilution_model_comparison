

#state 1 = small fomite
#state 2 = large fomite
#state 3 = non-fingertip area of hands
#state 4 = fingertip area of hands
#state 5 = loss of viability
#state 6 = mucous membranes


# ROW 1------------------------------------------------------------------------------------

#All transitions away
lambdas.1<-c(0,lambda.1.3.D[l],lambda.1.4.D[l],lambda.1.5.D[l],0)

lambda.1.T<-sum(lambdas.1)

P.1.1<-exp(-lambda.1.T)

P.1<-(1-P.1.1)*(lambdas.1/lambda.1.T)

P.1.total<-c(P.1.1,P.1)


#ROW 2----------------------------------------------------------------------------------------

lambdas.2<-c(0,lambda.2.3.D[l],lambda.2.4.D[l],lambda.2.5.D[l],0)

lambda.2.T<-sum(lambdas.2)

P.2.2<-exp(-lambda.2.T)

P.2<-(1-P.2.2)*(lambdas.2/lambda.2.T)

P.2.total<-c(P.2[1],P.2.2,P.2[2:5])


#ROW 3----------------------------------------------------------------------------------------
lambdas.3<-c(lambda.3.1.D[l],lambda.3.2.D[l],0,lambda.3.5.D[l],0)

lambda.3.T<-sum(lambdas.3)

P.3.3<-exp(-lambda.3.T)

P.3<-(1-P.3.3)*(lambdas.3/lambda.3.T)

P.3.total<-c(P.3[1:2],P.3.3,P.3[3:5])

#ROW 4-----------------------------------------------------------------------------------------
lambdas.4<-c(lambda.4.1.D[l],lambda.4.2.D[l],0,lambda.4.5.D[l],lambda.4.6.D[l])

lambda.4.T<-sum(lambdas.4)

P.4.4<-exp(-lambda.4.T)

P.4<-(1-P.4.4)*(lambdas.4/lambda.4.T)

P.4.total<-c(P.4[1:3],P.4.4,P.4[4:5])


#ROWS 5 & 6----------------------------------------------------------------------------------

P.5.total<-c(0,0,0,0,1,0)

P.6.total<-c(0,0,0,0,0,1)

PD<-matrix(nrow=6,ncol=6)
PD[1,]<-P.1.total
PD[2,]<-P.2.total
PD[3,]<-P.3.total
PD[4,]<-P.4.total
PD[5,]<-P.5.total
PD[6,]<-P.6.total





