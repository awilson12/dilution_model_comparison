require(truncdist)
require(ggplot2)
require(ggpubr)

iter<-5000
timestep<-0.001
set.seed(30)

source('simulation_code_dilution_v3.R')

#----------------MODEL A--------------------------------------------

sim.function2(type="primary",model="A",timestep=timestep,iter=iter)

mucous<-rep(NA,iter)
mucous.mean<-rep(NA,lengthsim)
mucous.sd<-rep(NA,lengthsim)

hands<-rep(NA,iter)
hands.mean<-rep(NA,lengthsim)
hands.sd<-rep(NA,lengthsim)

fomites<-rep(NA,iter)
fomites.mean<-rep(NA,lengthsim)
fomites.sd<-rep(NA,lengthsim)

doseA<-rep(NA,iter)

for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]][4,i]
    hands[j]<-matrix.list[[j]][2,i]
    fomites[j]<-matrix.list[[j]][1,i]
    
    if(i==lengthsim){
      doseA[j]<-mucous[j]
    }
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

sim.function2(type="primary",model="B",timestep=timestep,iter=iter)

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

doseB<-rep(NA,iter)

for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]][5,i]
    fingertip[j]<-matrix.list[[j]][3,i]
    nonfingertip[j]<-matrix.list[[j]][2,i]
    fomites[j]<-matrix.list[[j]][1,i]
    
    if(i==lengthsim){
      doseB[j]<-mucous[j]
    }
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

sim.function2(type="primary",model="C",timestep=timestep,iter=iter)


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

doseC<-rep(NA,iter)


for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]][6,i]
    fingertip[j]<-matrix.list[[j]][4,i]
    nonfingertip[j]<-matrix.list[[j]][3,i]
    smallfomite[j]<-matrix.list[[j]][1,i]
    largefomite[j]<-matrix.list[[j]][2,i]
    
    if(i==lengthsim){
      doseC[j]<-mucous[j]
    }
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

largefomite.conc<-rep(NA,iter)
smallfomite.conc<-rep(NA,iter)
mucous.max<-rep(NA,iter)

for(j in 1:iter){
  mucous.max[j]<-max(matrix.list[[j]][6,])
  smallfomite.conc[j]<-matrix.list[[j]][1,1]
  largefomite.conc[j]<-matrix.list[[j]][2,1]
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


frame.ratio<-data.frame(mucousmax=mucous.max,smallfomite.conc=smallfomite.conc,
                        largefomite.conc=largefomite.conc)

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("frameratio_",st, ".csv", sep = "")
write.csv(frame.ratio,filename)


#-------------------------frame all---------------------------------------------------------------
#frame.all<-rbind(frame.model.A,frame.model.B,frame.model.C)

#windows()
#ggplot(frame.all)+geom_line(aes(x=time,y=means,group=state,color=state))+
#  geom_ribbon(aes(x=time,ymin=means-sd,ymax=means+sd,group=state,fill=state),alpha=0.3)+
  #scale_y_continuous(trans="log10")+
  #scale_x_continuous(trans="log10")+
#  facet_wrap(~model,scales="free")

#windows()
#ggplot(frame.all[frame.all$state=="mucous membranes",])+geom_line(aes(x=time*timestep,y=means,group=model,color=model))+
#  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=model,fill=model),alpha=0.3)+
#  scale_y_continuous(trans="log10")



#Note to self to redo this so we have max doses for all iters (not mean of all iter)

#frame.all2<-data.frame(dose=c(doseA,doseB,doseC),
#                       model=c(rep("Model A",iter),rep("Model B",iter),rep("Model C",iter)))

#windows()
#ggplot(frame.all2)+geom_violin(aes(x=model,y=dose,fill=model),draw_quantiles=c(0.25,0.5,0.75),alpha=0.2)+
#  scale_y_continuous(trans="log10",name="Dose")+
#  scale_x_discrete(name="")+
#  scale_fill_manual(name="",values=c("#3333FF","#FFFF00","#00CCCC"))+
#  theme_pubr()+
#  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text = element_text(size=16))

#mean(frame.all2$dose[frame.all2$model=="Model C"])
#sd(frame.all2$dose[frame.all2$model=="Model C"])

#mean(frame.all2$dose[frame.all2$model=="Model B"])
#sd(frame.all2$dose[frame.all2$model=="Model B"])