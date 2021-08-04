
#state 1 = small fomite
#state 2 = large fomite
#state 3 = hands
#state 4 = loss of viability
#state 5 = mucosal membrane


# ROW 1------------------------------------------------------------------------------------

#All transitions away
lambdas.1<-c(0,lambda.1.3.C[l],lambda.1.4.C[l],0)
lambda.1.T<-sum(lambdas.1)

P.1.1<-exp(-lambda.1.T)

P.1<-(1-P.1.1)*(lambdas.1/lambda.1.T)

P.1.total<-c(P.1.1,P.1)


#ROW 2----------------------------------------------------------------------------------------

lambdas.2<-c(0,lambda.2.3.C[l],lambda.2.4.C[l],0)

lambda.2.T<-sum(lambdas.2)

P.2.2<-exp(-lambda.2.T)

P.2<-(1-P.2.2)*(lambdas.2/lambda.2.T)

P.2.total<-c(P.2[1],P.2.2,P.2[2:4])

#ROW 3----------------------------------------------------------------------------------------

lambdas.3<-c(lambda.3.1.C[l],lambda.3.2.C[l],lambda.3.4.C[l],lambda.3.5.C[l])

lambda.3.T<-sum(lambdas.2)

P.3.3<-exp(-lambda.2.T)

P.3<-(1-P.2.2)*(lambdas.2/lambda.2.T)

P.3.total<-c(P.3[1:2],P.3.3,P.3[3:4])

#ROWs 4 & 5----------------------------------------------------------------------------------

P.4.total<-c(0,0,0,1,0)

P.5.total<-c(0,0,0,0,1)

PC<-matrix(nrow=5,ncol=5)
PC[1,]<-P.1.total
PC[2,]<-P.2.total
PC[3,]<-P.3.total
PC[4,]<-P.4.total
PC[5,]<-P.5.total




