require(truncdist)
require(ggplot2)
require(ggpubr)
require(triangle)

#clear environment
rm(list = ls())

iter<-5000
timestep<-0.001
duration<-20

set.seed(30) #set after checking variabilty from one to another 
#with 5,000 iterations and 0.001 timestep

source('simulation_code_dilution_v2.R')

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
time<-rep(0:(lengthsim-1),3)

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
time<-rep(0:(lengthsim-1),4)

frame.model.B<-data.frame(means=means,sd=sd,state=state,time=time,
                          model="Model B")

#----------------MODEL C---------------------------------------

sim.function(type="primary",model="C",timestep=timestep,iter=iter)

mucous<-rep(NA,iter)
mucous.mean<-rep(NA,lengthsim)
mucous.sd<-rep(NA,lengthsim)

hands<-rep(NA,iter)
hands.mean<-rep(NA,lengthsim)
hands.sd<-rep(NA,lengthsim)

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
    mucous[j]<-matrix.list[[j]][5,i]
    hands[j]<-matrix.list[[j]][3,i]
    smallfomite[j]<-matrix.list[[j]][1,i]
    largefomite<-matrix.list[[j]][2,i]
    
    if(i==lengthsim){
      doseC[j]<-mucous[j]
    }
  }
  
  
  mucous.mean[i]<-mean(mucous)
  
  mucous.sd[i]<-sd(mucous)
  
  hands.mean[i]<-mean(hands)
  hands.sd[i]<-sd(hands)
  
  smallfomite.mean[i]<-mean(smallfomite)
  smallfomite.sd[i]<-sd(smallfomite)
  
  largefomite.mean[i]<-mean(largefomite)
  largefomite.sd[i]<-sd(largefomite)
  
}

largefomite.conc<-rep(NA,iter)
smallfomite.conc<-rep(NA,iter)
mucous.max<-rep(NA,iter)

for(j in 1:iter){
  mucous.max[j]<-max(matrix.list[[j]][5,])
  smallfomite.conc[j]<-matrix.list[[j]][1,1]
  largefomite.conc[j]<-matrix.list[[j]][2,1]
}


means<-c(mucous.mean,hands.mean,
         smallfomite.mean,largefomite.mean)
sd<-c(mucous.sd,hands.sd,
      smallfomite.sd,largefomite.sd)
state<-c(rep("mucous membranes",lengthsim),rep("hands",lengthsim),
         rep("small fomite",lengthsim),rep("large fomite",lengthsim))
time<-rep(0:(lengthsim-1),4)

frame.model.C<-data.frame(means=means,sd=sd,state=state,time=time,
                          model="Model C")

frame.ratio<-data.frame(mucousmax=mucous.max,smallfomite.conc=smallfomite.conc,
                        largefomite.conc=largefomite.conc)

ggplot(frame.ratio)+geom_point(aes(x=smallfomite.conc/200,y=mucousmax))+
  scale_y_continuous(trans="log10")



#----------------MODEL D---------------------------------------

sim.function(type="primary",model="D",timestep=timestep,iter=iter)


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

doseD<-rep(NA,iter)


for (i in 1:lengthsim){
  
  for(j in 1:iter){
    temp<-matrix.list[[j]]
    mucous[j]<-matrix.list[[j]][6,i]
    fingertip[j]<-matrix.list[[j]][4,i]
    nonfingertip[j]<-matrix.list[[j]][3,i]
    smallfomite[j]<-matrix.list[[j]][1,i]
    largefomite<-matrix.list[[j]][2,i]
    
    if(i==lengthsim){
      doseD[j]<-mucous[j]
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
time<-rep(0:(lengthsim-1),5)

frame.model.D<-data.frame(means=means,sd=sd,state=state,time=time,
                          model="Model D")

frame.ratio<-data.frame(mucousmax=mucous.max,smallfomite.conc=smallfomite.conc,
                        largefomite.conc=largefomite.conc)

ggplot(frame.ratio)+geom_point(aes(x=smallfomite.conc/200,y=mucousmax))+
  scale_y_continuous(trans="log10")

#-------------------------frame all---------------------------------------------------------------
frame.all<-rbind(frame.model.A,frame.model.B,frame.model.C,frame.model.D)

#windows()
#ggplot(frame.all)+geom_line(aes(x=time,y=means,group=state,color=state))+
#  geom_ribbon(aes(x=time,ymin=means-sd,ymax=means+sd,group=state,fill=state),alpha=0.3)+
#  scale_y_continuous(trans="log10")+
#  #scale_x_continuous(trans="log10")+
#  scale_y_continuous(trans="log10")+
#  scale_fill_discrete(name="")+
#  scale_color_discrete(name="")+
#  facet_wrap(~model)+
#  theme_pubr()+
#  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16))


#windows()
A<-ggplot(frame.all[frame.all$state=="mucous membranes",])+geom_line(aes(x=time*timestep,y=means,group=model,color=model))+
  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=model,fill=model),alpha=0.3)+
  scale_y_continuous(trans="log10",name="Dose (# Viral Particles)")+
  scale_x_continuous(name="Time (min)")+
  scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","grey"))+
  scale_color_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","grey"))+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),strip.text=element_text(size=16))


#windows()
B<-ggplot(frame.all[frame.all$state=="hands"|frame.all$state=="non-fingertip hand area" | frame.all$state=="fingertip hand area",])+
  geom_line(aes(x=time*timestep,y=means,group=interaction(model,state),color=state))+
  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=interaction(model,state),fill=state),alpha=0.3)+
  #geom_ribbon(aes(x=time*timestep,ymin=means-sd,ymax=means+sd,group=interaction(model,state),fill=state),alpha=0.3)+
  scale_y_continuous(trans="log10",name=expression("# Viral Particles/cm"^2))+
  scale_x_continuous(name="Time (min)")+
  scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","grey"))+
  scale_color_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","grey"))+
  facet_wrap(~model,nrow=1)+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),strip.text=element_text(size=16))


#windows()
#ggplot(frame.model.B[frame.model.B$state=="hands"|frame.model.B$state=="non-fingertip hand area" | frame.model.B$state=="fingertip hand area",])+
#  geom_line(aes(x=time*timestep,y=means,group=state,color=state))+
#  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=state,fill=state),alpha=0.3)+
#  scale_y_continuous(trans="log10")

#windows()
#ggplot(frame.model.B[frame.model.C$state=="hands"|frame.model.C$state=="non-fingertip hand area" | frame.model.C$state=="fingertip hand area",])+
#  geom_line(aes(x=time*timestep,y=means,group=state,color=state))+
#  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=state,fill=state),alpha=0.3)+
#  scale_y_continuous(trans="log10")

#windows()
frame.all$state[frame.all$state=="small fomite"]<-"small env surf"
frame.all$state[frame.all$state=="large fomite"]<-"large env surf"

frame.all$state[frame.all$state=="fomites"]<-"combined env surf"

C<-ggplot(frame.all[frame.all$state=="small env surf"|frame.all$state=="large env surf" | frame.all$state=="combined env surf",])+
  geom_line(aes(x=time*timestep,y=means,group=interaction(model,state),color=state))+
  geom_ribbon(aes(x=time*timestep,ymin=means-sd*1.96/sqrt(1000),ymax=means+sd*1.96/sqrt(1000),group=interaction(model,state),fill=state),alpha=0.3)+
  #geom_ribbon(aes(x=time*timestep,ymin=means-sd,ymax=means+sd,group=interaction(model,state),fill=state),alpha=0.3)+
  scale_y_continuous(trans="log10",name=expression("# Viral Particles/cm"^2))+
  scale_x_continuous(name="Time (min)")+
  scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC"))+
  scale_color_manual(name="",values=c("#3333FF","#FF3311","#00CCCC"))+
  theme_pubr()+
  facet_wrap(~model)+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),strip.text=element_text(size=16))

windows()
C


st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("frameall_",st, ".csv", sep = "")
write.csv(frame.all,filename)

frame.all2<-data.frame(dose=c(doseA,doseB,doseC,doseD),
                       model=c(rep("Model A",iter),rep("Model B",iter),rep("Model C",iter),rep("Model D",iter)))

my_comparisons<-list(c("Model A","Model B"),
                  c("Model B","Model C"),
                  c("Model A","Model C"),
                  c("Model A","Model D"),
                  c("Model B","Model D"),
                  c("Model C"),"Model D")

frame.all3<-data.frame(model=c("Model A","Model B","Model C","Model D"),
                       meandose=c(mean(doseA),mean(doseB),mean(doseC),mean(doseD)))

windows()
ggplot(frame.all2)+geom_violin(aes(x=model,y=dose,fill=model),draw_quantiles=c(0.25,0.5,0.75),alpha=0.2)+
  geom_point(data=frame.all3,aes(x=model,y=meandose,fill=model),size=3)+
  scale_y_continuous(trans="log10",name="Dose (# of viral particles)")+
  scale_x_discrete(name="")+
  scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","grey"))+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text = element_text(size=16),legend.position='none')


signif(summary(frame.all2$dose[frame.all2$model=="Model A"]),2)
signif(IQR((frame.all2$dose[frame.all2$model=="Model A"])),2)
signif(sd(frame.all2$dose[frame.all2$model=="Model A"]),2)

signif(summary(frame.all2$dose[frame.all2$model=="Model B"]),2)
signif(IQR((frame.all2$dose[frame.all2$model=="Model B"])),2)
signif(sd(frame.all2$dose[frame.all2$model=="Model B"]),2)

signif(summary(frame.all2$dose[frame.all2$model=="Model C"]),2)
signif(IQR((frame.all2$dose[frame.all2$model=="Model C"])),2)
signif(sd(frame.all2$dose[frame.all2$model=="Model C"]),2)

signif(summary(frame.all2$dose[frame.all2$model=="Model D"]),2)
signif(IQR((frame.all2$dose[frame.all2$model=="Model D"])),2)
signif(sd(frame.all2$dose[frame.all2$model=="Model D"]),2)