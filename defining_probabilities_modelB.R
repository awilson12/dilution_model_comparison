

#state 1 = fomites
#state 2 = non-fingertip area of hands
#state 3 = fingertip area of hands
#state 4 = loss of viability
#state 5 = mucous membranes


# ROW 1------------------------------------------------------------------------------------

#All transitions away
lambdas.1<-c(lambda.1.2.B[l],lambda.1.3.B[l],lambda.1.4.B[l],0)

lambda.1.T<-sum(lambdas.1)

P.1.1<-exp(-lambda.1.T)

P.1<-(1-P.1.1)*(lambdas.1/lambda.1.T)

P.1.total<-c(P.1.1,P.1)


#ROW 2----------------------------------------------------------------------------------------

lambdas.2<-c(lambda.2.1.B[l],0,lambda.2.4.B[l],0)

lambda.2.T<-sum(lambdas.2)

P.2.2<-exp(-lambda.2.T)

P.2<-(1-P.2.2)*(lambdas.2/lambda.2.T)

P.2.total<-c(P.2[1],P.2.2,P.2[2:4])


#ROW 3----------------------------------------------------------------------------------------
lambdas.3<-c(lambda.3.1.B[l],0,lambda.3.4.B[l],lambda.3.5.B[l])

lambda.3.T<-sum(lambdas.3)

P.3.3<-exp(-lambda.3.T)

P.3<-(1-P.3.3)*(lambdas.3/lambda.3.T)

P.3.total<-c(P.3[1:2],P.3.3,P.3[3:4])

#ROWs 4 & 5----------------------------------------------------------------------------------

P.4.total<-c(0,0,0,1,0)

P.5.total<-c(0,0,0,0,1)

PB<-matrix(nrow=5,ncol=5)
PB[1,]<-P.1.total
PB[2,]<-P.2.total
PB[3,]<-P.3.total
PB[4,]<-P.4.total
PB[5,]<-P.5.total




