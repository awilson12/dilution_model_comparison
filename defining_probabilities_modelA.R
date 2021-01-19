

#state 1 = fomites
#state 2 = hands
#state 3 = loss of viability
#state 4 = mucous membranes


# ROW 1------------------------------------------------------------------------------------

#All transitions away
lambdas.1<-c(lambda.1.2.A[l],lambda.1.3.A[l],0)

lambda.1.T<-sum(lambdas.1)

P.1.1<-exp(-lambda.1.T)

P.1<-(1-P.1.1)*(lambdas.1/lambda.1.T)

P.1.total<-c(P.1.1,P.1)


#ROW 2----------------------------------------------------------------------------------------

lambdas.2<-c(lambda.2.1.A[l],lambda.2.3.A[l],lambda.2.4.A[l])

lambda.2.T<-sum(lambdas.2)

P.2.2<-exp(-lambda.2.T)

P.2<-(1-P.2.2)*(lambdas.2/lambda.2.T)

P.2.total<-c(P.2[1],P.2.2,P.2[2:3])

#ROWs 3 & 4----------------------------------------------------------------------------------

P.3.total<-c(0,0,1,0)

P.4.total<-c(0,0,0,1)

probs<-matrix(nrow=4,ncol=4)
probs[1,]<-P.1.total
probs[2,]<-P.2.total
probs[3,]<-P.3.total
probs[4,]<-P.4.total




