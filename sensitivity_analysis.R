#sensitivity analysis

require(truncdist)
require(ggplot2)
require(ggpubr)

iter<-5000
timestep<-0.001
set.seed(30)





# PART 1: Evaluation of how % virus on small fomite impacts dose---------------------------------------------------------------------------



#Must run main code first in order to plot what is below. If main code has already been run, then source main code v2 below.

source('main_code_v2.R')

#windows()
#ggplot(frame.ratio)+geom_point(aes(x=(smallfomite.conc*SA.smallfomite/200)*100,y=mucousmax),size=3,alpha=0.1)+
#  scale_y_continuous(name="Dose",trans="log10")+
#  scale_x_continuous(name="% Viral Particles on Small Fomite")+
  #geom_vline(xintercept=SA.smallfomite*100,size=2,linetype="dashed",color="black",alpha=0.5)+
  #geom_vline(xintercept=0.5*100,size=2,linetype="dashed",color="#00CCCC",alpha=0.5)+
#  geom_point(aes(x=SA.smallfomite/20100*100,y=mean(frame.all2$dose[frame.all2$model=="Model A"]),fill="Model A"),shape=22,size=8,alpha=0.3)+
#  geom_point(aes(x=SA.smallfomite/20100*100,y=mean(frame.all2$dose[frame.all2$model=="Model B"]),fill="Model B"),shape=23,size=8,alpha=0.3)+
#  geom_point(aes(x=0.5*100,y=mean(frame.all2$dose[frame.all2$model=="Model C"]),fill="Model C"),shape=22,size=8,alpha=0.3)+
  #geom_text(x=13,y=-1.32,label="SA Model B",size=6)+
  #geom_text(x=13,y=-1.57,label="SA Model A",size=6)+
  #geom_text(x=63,y=0.08,label="SA Model C",size=6)+
#  scale_shape_manual(labels=c("SA Model A","SA Model B","SA Model C"),values=c(22,23,22),name="")+
#  scale_fill_manual(labels=c("SA Model A","SA Model B","SA Model C"),values=c("#3333FF","#FFFF00","#00CCCC"),name="")+
#  theme_pubr()+
#  theme(axis.title = element_text(size=18),axis.text=element_text(size=18),legend.position = "none")

windows()
ggplot(frame.ratio)+geom_point(aes(x=(smallfomite.conc),y=mucousmax),size=3,alpha=0.1)+
  scale_y_continuous(name="Dose",trans="log10")+
  scale_x_continuous(name=expression("Viral Particles/cm"^2))+
  #geom_vline(xintercept=SA.smallfomite*100,size=2,linetype="dashed",color="black",alpha=0.5)+
  #geom_vline(xintercept=0.5*100,size=2,linetype="dashed",color="#00CCCC",alpha=0.5)+
  geom_point(aes(x=200/20100,y=mean(frame.all2$dose[frame.all2$model=="Model A"]),fill="Model A"),shape=22,size=8,alpha=0.3)+
  geom_point(aes(x=200/20100,y=mean(frame.all2$dose[frame.all2$model=="Model B"]),fill="Model B"),shape=23,size=8,alpha=0.3)+
  geom_point(aes(x=1,y=mean(frame.all2$dose[frame.all2$model=="Model C"]),fill="Model C"),shape=22,size=8,alpha=0.3)+
  geom_vline(aes(xintercept=1),linetype="dashed")+
  geom_vline(aes(xintercept=200/20100),linetype="dashed")+
  geom_label(x=1,y=-2,label=expression("1 viral particle/cm"^"2"),size=5)+
  geom_label(x=0.1,y=-2,label=expression("0.01 viral particle/cm"^"2"),size=5)+
  scale_shape_manual(labels=c("Model A","Model B","Model C"),values=c(22,23,22),name="")+
  scale_fill_manual(labels=c("Model A","Model B","Model C"),values=c("#3333FF","#FFFF00","#00CCCC"),name="")+
  theme_pubr()+
  theme(axis.title = element_text(size=18),axis.text=element_text(size=18),legend.position = "none")

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("frameratio",st, ".csv", sep = "")
write.csv(frame.ratio,filename)


# PART 2: Sensitivity models A, B, C, and D-----------------------------------------------------------------------------------



source('simulation_code_dilution_v2.R')

model.sensitivity.1<-c("A","B","C","D")

for(a in 1:length(model.sensitivity.1)){
  sim.function(type="sensitivity",model=model.sensitivity.1[a],timestep=timestep,iter=iter)
  
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
  
  final.dose<-rep(NA,iter)
  
  for (i in 1:lengthsim){
    
    for(j in 1:iter){
      temp<-matrix.list[[j]]
      mucous[j]<-matrix.list[[j]][6,i]
      fingertip[j]<-matrix.list[[j]][4,i]
      nonfingertip[j]<-matrix.list[[j]][3,i]
      smallfomite[j]<-matrix.list[[j]][1,i]
      largefomite<-matrix.list[[j]][2,i]
      
      if (i==lengthsim){
        final.dose[j]<-matrix.list[[j]][6,i]
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
  
  
  means<-c(mucous.mean,fingertip.mean,nonfingertip.mean,
           smallfomite.mean,largefomite.mean)
  sd<-c(mucous.sd,fingertip.sd,nonfingertip.sd,
        smallfomite.sd,largefomite.sd)
  state<-c(rep("mucous membranes",lengthsim),rep("fingertip hand area",lengthsim),
           rep("non-fingertip hand area",lengthsim),rep("small fomite",lengthsim),
           rep("large fomite",lengthsim))
  time<-rep(1:lengthsim,5)
  
  if(a==1){
    frame.model.sensitivity<-data.frame(means=means,sd=sd,state=state,time=time,
                                        model=model.sensitivity.1[a])
    finaldoseall<-data.frame(dose=final.dose,model=model.sensitivity.1[a])
  }else{
    temp<-data.frame(means=means,sd=sd,state=state,time=time,
                     model=model.sensitivity.1[a])
    finaldosealltemp<-data.frame(dose=final.dose,model=model.sensitivity.1[a])
    
    frame.model.sensitivity<-rbind(frame.model.sensitivity,temp)
    finaldoseall<-rbind(finaldoseall,finaldosealltemp)
  }
  
}

summary(finaldoseall$dose[finaldoseall$model=="A"])
IQR(finaldoseall$dose[finaldoseall$model=="A"])
sd(finaldoseall$dose[finaldoseall$model=="A"])

summary(finaldoseall$dose[finaldoseall$model=="B"])
IQR(finaldoseall$dose[finaldoseall$model=="B"])
sd(finaldoseall$dose[finaldoseall$model=="B"])

summary(finaldoseall$dose[finaldoseall$model=="C"])
IQR(finaldoseall$dose[finaldoseall$model=="C"])
sd(finaldoseall$dose[finaldoseall$model=="C"])

summary(finaldoseall$dose[finaldoseall$model=="D"])
IQR(finaldoseall$dose[finaldoseall$model=="D"])
sd(finaldoseall$dose[finaldoseall$model=="D"])


#windows()
A<-ggplot(data=frame.model.sensitivity[frame.model.sensitivity$state=="mucous membranes",])+
  geom_line(aes(x=time*timestep,y=means,color=model),size=1)+
  geom_ribbon(aes(x=time*timestep,ymax=means+sd*1.96/sqrt(iter),ymin=means-sd*1.96/sqrt(iter),fill=model),alpha=0.2)+
  scale_x_continuous(name="Time (minutes)")+
  scale_y_continuous(name="Dose (# viral particles)")+
  scale_color_discrete(name="")+
  scale_fill_discrete(name="")+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),title=element_text(size=18))+
  ggtitle("A")

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("sensitivity_A_thru_D",st, ".csv", sep = "")
write.csv(frame.model.sensitivity,filename)


windows()
ggplot(data=frame.model.sensitivity[frame.model.sensitivity$state=="mucous membranes",])+
  geom_line(aes(x=time*timestep,y=means,color=model),size=1)+
  geom_ribbon(aes(x=time*timestep,ymax=means+sd*1.96/sqrt(iter),ymin=means-sd*1.96/sqrt(iter),fill=model),alpha=0.2)+
  scale_x_continuous(name="Time (min)")+
  scale_y_continuous(name="Dose (# viral particles)")+
  scale_color_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","black"))+
  scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","black"))+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),title=element_text(size=18))

#change labels for clarity
finaldoseall$model[finaldoseall$model=="A"]<-"SA Model A"
finaldoseall$model[finaldoseall$model=="B"]<-"SA Model B"
finaldoseall$model[finaldoseall$model=="C"]<-"SA Model C"
finaldoseall$model[finaldoseall$model=="D"]<-"SA Model D"


windows()
ggplot(data=finaldoseall)+geom_violin(aes(x=model,y=dose,fill=model),draw_quantiles = c(0.25,0.5,0.75),alpha=0.2)+
  scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","black"))+
  scale_y_continuous(name="Dose (# viral particles)",trans="log10")+
  scale_x_discrete(name="")+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),title=element_text(size=18),legend.position = "none")


# PART 3: Sensitivity models E and F ---------------------------------------------------------------------------------------------------------


source('simulation_code_dilution_v4.R')

model.sensitivity.2<-c("E","F")

for(a in 1:length(model.sensitivity.2)){
  
  sim.function3(type="sensitivity",model=C,timestep=timestep,iter=iter,sensitivitymodel=model.sensitivity.2[a])
  
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
  
  final.dose<-rep(NA,iter)
  
  for (i in 1:lengthsim){
    
    for(j in 1:iter){
      temp<-matrix.list[[j]]
      mucous[j]<-matrix.list[[j]][6,i]
      fingertip[j]<-matrix.list[[j]][4,i]
      nonfingertip[j]<-matrix.list[[j]][3,i]
      smallfomite[j]<-matrix.list[[j]][1,i]
      largefomite[j]<-matrix.list[[j]][2,i]
      
      if (i==lengthsim){
        final.dose[j]<-matrix.list[[j]][6,i]
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
  
  
  means<-c(mucous.mean,fingertip.mean,nonfingertip.mean,
           smallfomite.mean,largefomite.mean)
  sd<-c(mucous.sd,fingertip.sd,nonfingertip.sd,
        smallfomite.sd,largefomite.sd)
  state<-c(rep("mucous membranes",lengthsim),rep("hand 2",lengthsim),
           rep("hand 1",lengthsim),rep("small fomite",lengthsim),
           rep("large fomite",lengthsim))
  time<-rep(1:lengthsim,5)
  
  if(a==1){
    frame.model.sensitivity2<-data.frame(means=means,sd=sd,state=state,time=time,
                                        model=model.sensitivity.2[a])
    finaldoseall2<-data.frame(dose=final.dose,model=model.sensitivity.2[a])
  }else{
    temp<-data.frame(means=means,sd=sd,state=state,time=time,
                     model=model.sensitivity.2[a])
    
    frame.model.sensitivity2<-rbind(frame.model.sensitivity2,temp)
    finaldoseall2temp<-data.frame(dose=final.dose,model=model.sensitivity.2[a])
    finaldoseall2<-rbind(finaldoseall2,finaldoseall2temp)
  }
  
}

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("sensitivity_E_and_F",st, ".csv", sep = "")
write.csv(frame.model.sensitivity2,filename)

summary(finaldoseall2$dose[finaldoseall2$model=="E"])
IQR(finaldoseall2$dose[finaldoseall2$model=="E"])
sd(finaldoseall2$dose[finaldoseall2$model=="E"])

summary(finaldoseall2$dose[finaldoseall2$model=="F"])
IQR(finaldoseall2$dose[finaldoseall2$model=="F"])
sd(finaldoseall2$dose[finaldoseall2$model=="F"])

windows()
#A<-ggplot(data=frame.model.sensitivity2[frame.model.sensitivity2$state=="mucous membranes",])+
#  geom_line(aes(x=time*timestep,y=means,color=model),size=1)+
#  geom_ribbon(aes(x=time*timestep,ymax=means+sd*1.96/sqrt(iter),ymin=means-sd*1.96/sqrt(iter),fill=model),alpha=0.2)+
#  scale_x_continuous(name="Time (minutes)")+
#  scale_y_continuous(name="Dose (# viral particles)")+
#  scale_color_discrete(name="")+
#  scale_fill_discrete(name="")+
#  theme_pubr()+
#  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),title=element_text(size=18))+
#  ggtitle("A")

finaldoseall2$model[finaldoseall2$model=="E"]<-"SA Model E"
finaldoseall2$model[finaldoseall2$model=="F"]<-"SA Model F"


A<-ggplot(data=finaldoseall2)+geom_violin(aes(x=model,y=dose,fill=model),draw_quantiles = c(0.25,0.5,0.75),alpha=0.2)+
  #scale_fill_manual(name="",values=c("#3333FF","#FF3311","#00CCCC","black"))+
  scale_y_continuous(name="Dose (# viral particles)",trans="log10")+
  scale_x_discrete(name="")+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),title=element_text(size=18),legend.position = "none")

B<-ggplot(data=frame.model.sensitivity2[frame.model.sensitivity2$state=="hand 1" | frame.model.sensitivity2$state=="hand 2",])+
  geom_line(aes(x=time*timestep,y=means,color=state,group=state),size=1,alpha=0.5)+
  geom_ribbon(aes(x=time*timestep,ymax=means+sd*1.96/sqrt(iter),ymin=means-sd*1.96/sqrt(iter),fill=state,group=state),alpha=0.2)+
  scale_x_continuous(name="Time (minutes)")+
  scale_y_continuous(name=expression("# viral particles/cm"^2),trans="log10")+
  scale_color_discrete(name="")+
  scale_fill_discrete(name="")+
  facet_wrap(~model)+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),title=element_text(size=18))+
  ggtitle("B")

ggarrange(A,B)

#frame.model.sensitivity<-subset(frame.model.sensitivity,select=c(-X))
frame.sensitivity.all<-rbind(frame.model.sensitivity,frame.model.sensitivity2)

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("sensitivity_all",st, ".csv", sep = "")
write.csv(frame.sensitivity.all,filename)
