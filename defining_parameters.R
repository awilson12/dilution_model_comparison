#Parameters relevant to all models----------------------------------------

TE.HF<-runif(iter,0.01,0.406)
TE.FH<-runif(iter,0.01,0.406)
TE.HM<-rtrunc(iter,"norm",mean=0.3390,iter=0.1318,a=0,b=1)

k.fome<-runif(iter,0.10,0.12)/60 #hr-1 so convert to min
k.skin<-runif(iter,0.05,0.77)/60 #hr-1 so convert to min

#in contacts per hour and converted to min
H.face<-rtrunc(iter,"norm",mean=14,sd=5.4,a=0,b=1)/60 #per hr so convert to per min


#Parameters for Model A only-------------------------------------------------------
A.hand<-runif(iter,445,535) #cm^2
S.H<-runif(iter,0.008,0.24)
S.F<-runif(iter,0.008,0.012)

H.fome<-lnorm(meanlog=log(4.1),sdlog=log(1.6))


#Parameters for Model A & B----------------------------------------------

total.fomeSA<-20100 #cm^2


#Parameters for Model B Only---------------------------------------------

H.fome.finger<-0.5*H.fome
H.fome.nonfinger<-0.5*H.fome
  
#Parameters for Model B & C-----------------------------------------------
S.F<-0.20
S.NF<-runif(iter,0.11,0.18)
A.fingertip<-runif(iter,17.8,321)
A.nonfingertip<-runif(124,517.2)
H.sm.finger<-(2/3)*H.fome.finger
H.lg.finger<-(1/3)*H.fome.finger
H.sm.nonfinger<-(2/3)*H.fome.nonfinger
H.lg.nonfinger<-(1/3)*H.fome.nonfinger

#Paramters for Model C Only
SA.smallfomite<-100 #cm^2
SA.largefomite<-20000 #cm^2