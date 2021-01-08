#Model A probabilities
A<-matrix(nrow=4,ncol=4)

lambdas.1.A<-c(lambda.1.2.A[l],lambda.1.3.A[l],0)
lambdas.1.A.T<-sum(lambdas.1.A)
P.1.1.A<-exp(-lambda.1.A.T)
P.1.A<-(1-P.1.A)*(lambdas.1.A/lambdas.1.A.T)
P.1.A.total<-c(P.1.1.A,P.1.A)

lambdas.2.A<-c(lambda.2.1.A[l],lambda.2.3.A[l],lambda.2.4.A[l])
lambdas.2.A.T<-sum(lambdas.2.A)
P.2.2.A<-exp(-lambda.2.A.T)
P.2.A<-(1-P.2.A)*(lambdas.2.A/lambdas.2.A.T)
P.2.A.total<-c(P.2.A[1],P.2.2.A,P.2.A[3:4])

P.3.A.total<-c(0,0,1,0)

P.4.A.total<-c(0,0,0,1)

A[1,]<-P.1.A.total
A[2,]<-P.2.A.total
A[3,]<-P.3.A.total
A[4,]<-P.4.A.total

#Model B probabilities
B<-matrix(nrow=5,ncol=5)

lambdas.1.B<-c(lambda.1.2.B[l],lambda.1.3.B[l],lambda.1.4.B[l],0)
lambdas.1.B.T<-sum(lambdas.1.B)
P.1.1.B<-exp(-lambda.1.B.T)
P.1.B<-(1-P.1.B)*(lambdas.1.B/lambdas.1.B.T)
P.1.B.total<-c(P.1.1.B,P.1.B)

lambdas.2.B<-c(lambda.2.1.B[l],0,lambda.2.4.B[l],0)
lambdas.2.B.T<-sum(lambdas.2.B)
P.2.2.B<-exp(-lambda.2.B.T)
P.2.B<-(1-P.2.B)*(lambdas.2.B/lambdas.2.B.T)
P.2.B.total<-c(P.2.B[1],P.2.2.B,P.2.B[3:5])

lambdas.3.B<-c(lambda.3.1.B[l],0,lambda.3.4.B[l],lambda.3.5.B[l])
lambdas.3.B.T<-sum(lambdas.3.B)
P.3.3.B<-exp(-lambda.3.B.T)
P.3.B<-(1-P.3.B)*(lambdas.3.B/lambdas.3.B.T)
P.3.B.total<-c(P.3.B[1:2],P.3.3.B,P.3.B[4:5])

P.4.B.total<-c(0,0,0,1,0)
P.5.B.total<-c(0,0,0,0,1)

B[1,]<-P.1.B.total
B[2,]<-P.2.B.total
B[3,]<-P.3.B.total
B[4,]<-P.4.B.total
B[5,]<-P.5.B.total

#Model C probabilities
C<-matrix(nrow=6,ncol=6)

lambdas.1.C<-c(0,lambda.1.3.C[l],lambda.1.4.C[l],lambda.1.5.C[l],0)
lambdas.1.C.T<-sum(lambdas.1.C)
P.1.1.C<-exp(-lambda.1.C.T)
P.1.C<-(1-P.1.C)*(lambdas.1.C/lambdas.1.C.T)
P.1.C.total<-c(P.1.1.C,P.1.C)

lambdas.2.C<-c(0,lambda.2.3.C[l],lambda.2.4.C[l],lambda.2.5.C[l],0)
lambdas.2.C.T<-sum(lambdas.2.C)
P.2.2.C<-exp(-lambda.2.C.T)
P.2.C<-(1-P.2.C)*(lambdas.2.C/lambdas.2.C.T)
P.2.C.total<-c(P.2.C[1],P.2.2.C,P.2.C[3:6])

lambdas.3.C<-c(lambda.3.1.C[l],lambda.3.2.C[l],0,lambda.3.5.C[l],0)
lambdas.3.C.T<-sum(lambdas.3.C)
P.3.3.C<-exp(-lambda.3.C.T)
P.3.C<-(1-P.3.C)*(lambdas.3.C/lambdas.3.C.T)
P.3.C.total<-c(P.3.C[1],P.3.3.C,P.3.C[3:6])

lambdas.4.C<-c(lambda.4.1.C[l],lambda.4.2.C[l],0,lambda.4.5.C[l],lambda.4.6.C[l])
lambdas.4.C.T<-sum(lambdas.4.C)
P.4.4.C<-exp(-lambda.4.C.T)
P.4.C<-(1-P.4.C)*(lambdas.4.C/lambdas.4.C.T)
P.4.C.total<-c(P.4.C[1:3],P.4.4.C,P.4.C[5:6])

P.5.C.total<-c(0,0,0,0,1,0)

P.6.C.total<-c(0,0,0,0,0,1)


C[1,]<-P.1.C.total
C[2,]<-P.2.C.total
C[3,]<-P.3.C.total
C[4,]<-P.4.C.total
C[5,]<-P.5.C.total
C[6,]<-P.6.C.total