#Parameters relevant to all models----------------------------------------

TE.HF<-rtriangle(iter,a=0.01,b=0.406,c=0.208)
TE.FH<-rtriangle(iter,a=0.01,b=0.406,c=0.208)
TE.HM<-rtrunc(iter,"norm",mean=0.3390,sd=0.1318,a=0,b=1)

k.fome<-runif(iter,0.10,0.12)/60 #hr-1 so convert to min
k.skin<-runif(iter,0.05,0.77)/60 #hr-1 so convert to min

#in contacts per hour and converted to min
H.face<-rtrunc(iter,"norm",mean=14,sd=5.4,a=0,b=30)/60 #per hr so convert to per min


#Parameters for Model A only-------------------------------------------------------
A.hand<-runif(iter,445,535) #cm^2
S.H<-runif(iter,0.008,0.25)
S.Face<-runif(iter,0.008,0.012)

H.fome<-rlnorm(iter,meanlog=log(4.1),sdlog=log(1.6))

H.sm.fome<-(2/3)*H.fome
H.lg.fome<-(1/3)*H.fome
#Parameters for Model A & B----------------------------------------------

total.fomeSA<-20100 #cm^2

group.virus<-200 #virus on surfaces total


#Parameters for Model B Only---------------------------------------------

H.fome.finger<-0.5*H.fome
H.fome.nonfinger<-0.5*H.fome
  
#Parameters for Model B & C-----------------------------------------------
S.F<-0.20
S.F.fomite<-runif(iter,0.2,1)
S.NF<-runif(iter,0.03,0.18)
A.fingertip<-runif(iter,17.8,32.1)
A.nonfingertip<-runif(iter,412.9,517.2)
#frac.small<-runif(iter,0,1)

#H.sm.finger<-(frac.small)*H.fome.finger
#H.lg.finger<-(1-frac.small)*H.fome.finger
#H.sm.nonfinger<-(frac.small)*H.fome.nonfinger
#H.lg.nonfinger<-(1-frac.small)*H.fome.nonfinger


H.sm.finger<-(2/3)*H.fome.finger
H.lg.finger<-(1/3)*H.fome.finger
H.sm.nonfinger<-(2/3)*H.fome.nonfinger
H.lg.nonfinger<-(1/3)*H.fome.nonfinger

#Paramters for Model C Only
SA.smallfomite<-100 #cm^2
SA.largefomite<-20000 #cm^2

#small.fome.virus<-runif(iter,0,200) #changed on 1/25 to test sensitivity
#large.fome.virus<-200-small.fome.virus #changed on 1/25 to test sensitivity

small.fome.virus<-100
large.fome.virus<-100