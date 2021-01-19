require(truncdist)
require(ggplot2)
require(ggpubr)

iter<-1000
timestep<-0.001

source('defining_parameters.R')
source('defining_rates.R') #note that probabilities are defined within the simulation code function

source('simulation_code.R')

#----------------MODEL A--------------------------------------------

sim.function(type="primary",model="A",timestep=timestep,iter=iter)

mucous<-rep(NA,iter)
mucous.mean<-rep(NA,lengthsim)
mucous.sd<-rep(NA,lengthsim)

hands<-rep(NA,iter)
hands.mean<-rep(NA,lengthsim)
hands.sd<-rep(NA,lengthsim)

fomites<-rep(NA,iter)
fomites.mean<-rep(NA,lengthsim)
fomites.sd<-rep(NA,lengthsim)

for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]]$`mucous membranes`[i]
    hands[j]<-matrix.list[[j]]$hands[i]
    fomites[j]<-matrix.list[[j]]$fomites[i]
  }
  
  mucous.mean[i]<-mean(mucous)
  mucous.sd[i]<-sd(mucous)
  
  hands.mean[i]<-mean(hands)
  hands.sd[i]<-sd(hands)
  
  fomites.mean[i]<-mean(fomites)
  fomites.sd[i]<-sd(fomites)

}

means<-c(mucous.mean,hands.mean,fomites.mean)
sd<-c(mucous.sd,hands.sd,fomites.sd)
state<-c(rep("mucous membranes",lengthsim),rep("hands",lengthsim),
         rep("fomites",lengthsim))
time<-rep(1:lengthsim,3)

frame.model.A<-data.frame(means=means,sd=sd,state=state,time=time,
                          model="Model A")

#--------------- MODEL B---------------------------------------------

sim.function(type="primary",model="B",timestep=timestep,iter=iter)

mucous<-rep(NA,iter)
mucous.mean<-rep(NA,lengthsim)
mucous.sd<-rep(NA,lengthsim)

fingertip<-rep(NA,iter)
fingertip.mean<-rep(NA,lengthsim)
fingertip.sd<-rep(NA,lengthsim)

nonfingertip<-rep(NA,iter)
nonfingertip.mean<-rep(NA,lengthsim)
nonfingertip.sd<-rep(NA,lengthsim)

fomites<-rep(NA,iter)
fomites.mean<-rep(NA,lengthsim)
fomites.sd<-rep(NA,lengthsim)

for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]]$`mucous membranes`[i]
    fingertip[j]<-matrix.list[[j]]$fingertip[i]
    nonfingertip[j]<-matrix.list[[j]]$`non-fingertip`[i]
    fomites[j]<-matrix.list[[j]]$fomites[i]
  }
  
  mucous.mean[i]<-mean(mucous)
  mucous.sd[i]<-sd(mucous)
  
  fingertip.mean[i]<-mean(fingertip)
  fingertip.sd[i]<-sd(fingertip)
  
  nonfingertip.mean[i]<-mean(nonfingertip)
  nonfingertip.sd[i]<-sd(nonfingertip)
  
  fomites.mean[i]<-mean(fomites)
  fomites.sd[i]<-sd(fomites)
  
}


means<-c(mucous.mean,fingertip.mean,nonfingertip.mean,fomites.mean)
sd<-c(mucous.sd,fingertip.sd,nonfingertip.sd,fomites.sd)
state<-c(rep("mucous membranes",lengthsim),rep("fingertip hand area",lengthsim),
         rep("non-fingertip hand area",lengthsim),rep("fomites",lengthsim))
time<-rep(1:lengthsim,4)

frame.model.B<-data.frame(means=means,sd=sd,state=state,time=time,
                          model="Model B")


#----------------MODEL C---------------------------------------

sim.function(type="primary",model="C",timestep=timestep,iter=iter)


mucous<-rep(NA,iter)
mucous.mean<-rep(NA,lengthsim)
mucous.sd<-rep(NA,lengthsim)

fingertip<-rep(NA,iter)
fingertip.mean<-rep(NA,lengthsim)
fingertip.sd<-rep(NA,lengthsim)

nonfingertip<-rep(NA,iter)
nonfingertip.mean<-rep(NA,lengthsim)
nonfingertip.sd<-rep(NA,lengthsim)

smallfomite<-rep(NA,iter)
smallfomite.mean<-rep(NA,lengthsim)
smallfomite.sd<-rep(NA,lengthsim)

largefomite<-rep(NA,iter)
largefomite.mean<-rep(NA,lengthsim)
largefomite.sd<-rep(NA,lengthsim)

for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]]$`mucous membranes`[i]
    fingertip[j]<-matrix.list[[j]]$fingertip[i]
    nonfingertip[j]<-matrix.list[[j]]$`non-fingertip`[i]
    smallfomite[j]<-matrix.list[[j]]$`small fomite`[i]
    largefomite[j]<-matrix.list[[j]]$`large fomite`[i]
  }
  
  mucous.mean[i]<-mean(mucous)
  mucous.sd[i]<-sd(mucous)
  
  fingertip.mean[i]<-mean(fingertip)
  fingertip.sd[i]<-sd(fingertip)
  
  nonfingertip.mean[i]<-mean(nonfingertip)
  nonfingertip.sd[i]<-sd(nonfingertip)
  
  smallfomite.mean[i]<-mean(smallfomite)
  smallfomite.sd[i]<-sd(smallfomite)
  
  largefomite.mean[i]<-mean(largefomite)
  largefomite.sd[i]<-sd(largefomite)
  
}


means<-c(mucous.mean,fingertip.mean,nonfingertip.mean,
         smallfomite.mean,largefomite.mean)
sd<-c(mucous.sd,fingertip.sd,nonfingertip.sd,
      smallfomite.sd,largefomite.sd)
state<-c(rep("mucous membranes",lengthsim),rep("fingertip hand area",lengthsim),
         rep("non-fingertip hand area",lengthsim),rep("small fomite",lengthsim),
         rep("large fomite",lengthsim))
time<-rep(1:lengthsim,5)

frame.model.C<-data.frame(means=means,sd=sd,state=state,time=time,
                          model="Model C")

#-------------------------frame all---------------------------------------------------------------
frame.all<-rbind(frame.model.A,frame.model.B,frame.model.C)

windows()
ggplot(frame.all)+geom_line(aes(x=time,y=means,group=state,color=state))+
  geom_ribbon(aes(x=time,ymin=means-sd,ymax=means+sd,group=state,fill=state),alpha=0.3)+
  #scale_y_continuous(trans="log10")+
  #scale_x_continuous(trans="log10")+
  facet_wrap(~model,scales="free")

windows()
ggplot(frame.all[frame.all$state=="mucous membranes",])+geom_line(aes(x=time*timestep,y=means,group=model,color=model))+
  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=model,fill=model),alpha=0.3)
