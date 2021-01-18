

#state 1 = small fomite
#state 2 = large fomite
#state 3 = non-fingertip area of hands
#state 4 = fingertip area of hands
#state 5 = loss of viability
#state 6 = mucous membranes


# ROW 1------------------------------------------------------------------------------------

#All transitions away
lambdas.1<-c(0,lambda.1.3.C[l],lambda.1.4.C[l],lambda.1.5.C[l],0)

lambda.1.T<-sum(lambdas.1)

P.1.1<-exp(-lambda.1.T)

P.1<-(1-P.1.1)*(lambdas.1/lambda.1.T)

P.1.total<-c(P.1.1,P.1)


#ROW 2----------------------------------------------------------------------------------------

lambdas.2<-c(0,lambda.2.3.C,lambda.2.4.C[l],lambda.2.5.C[l],0)

lambda.2.T<-sum(lambdas.2)

P.2.2<-exp(-lambda.2.T)

P.2<-(1-P.2.2)*(lambdas.2/lambda.2.T)

P.2.total<-c(lambdas.2[1],P.2.2,lambdas.2[2:5])


#ROW 3----------------------------------------------------------------------------------------
lambdas.3<-c(lambda.3.1.C[l],lambda.3.2.C[l],0,lambda.3.5.B[l],0)

lambda.3.T<-sum(lambdas.3)

P.3.3<-exp(-lambda.3.T)

P.3<-(1-P.3.3)*(lambdas.3/lambda.3.T)

P.3.total<-c(lambdas.3[1:2],P.3.3,lambdas.3[3:5])

#ROW 4-----------------------------------------------------------------------------------------
lambdas.4<-c(lambda.4.1.C[l],lambda.4.2.C[l],0,lambda.3.5.C[l],lambda.3.6.C[l])

lambda.4.T<-sum(lambdas.4)

P.4.4<-exp(-lambda.4.T)

P.4<-(1-P.4.4)*(lambdas.4/lambda.4.T)

P.4.total<-c(lambdas.4[1:3],P.4.4,lambdas.4[4:5])


#ROWS 5 & 6----------------------------------------------------------------------------------

P.5.total<-c(0,0,0,0,1,0)

P.6.total<-c(0,0,0,0,0,1)

probs<-matrix(nrow=6,ncol=6)
probs[1,]<-P.1.total
probs[2,]<-P.2.total
probs[3,]<-P.3.total
probs[4,]<-P.4.total
probs[5,]<-P.5.total
probs[6,]<-P.5.total





