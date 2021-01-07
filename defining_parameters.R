#Parameters relevant to all models

TE.HF<-runif(iter,0.01,0.406)
TE.FH<-runif(iter,0.01,0.406)
TE.HM<-rtrunc(iter,"norm",mean=0.3390,iter=0.1318,a=0,b=1)

k.fome<-runif(iter,0.085,0.151)
k.skin

#in contacts per hour and converted to min
H.face<-rtrunc(iter,"norm",mean=14,sd=5.4,a=0,b=1)/60

#Parameters for Model A only
A.hand<-runif(iter,445,535)
S.H<-runif(iter,0.008,0.24)

H.fome<-lnorm(meanlog=log(4.1),sdlog=log(1.6))

#Parameters for Model A & B

total.fomeSA<-

  
  
#Parameters for Model B & C
S.F<-0.20
S.NF<-runif(iter,0.11,0.18)
A.fingertip<-runif(iter,17.8,321)
A.nonfingertip<-runif(124,517.2)
H.fingertip
H.nonfingertip

#Paramters for Model C Only
SA.smallfomite<-100 #cm^2
SA.largefomite<-20000 #cm^2