#sensitivity analysis

require(truncdist)
require(ggplot2)
require(ggpubr)

iter<-1000
timestep<-0.001





# PART 1: Evaluation of how % virus on small fomite impacts dose---------------------------------------------------------------------------



#Must run main code first in order to plot what is below. If main code has already been run, then source main code v2 below.

source('main_code_v2.R')

windows()
ggplot(frame.ratio)+geom_point(aes(x=(smallfomite.conc/200)*100,y=mucousmax),size=3,alpha=0.1)+
  scale_y_continuous(name="Dose",trans="log10")+
  scale_x_continuous(name="% Viral Particles on Small Fomite")+
  geom_vline(xintercept=SA.smallfomite/20100*100,size=2,linetype="dashed",color="black",alpha=0.5)+
  geom_vline(xintercept=0.5*100,size=2,linetype="dashed",color="#00CCCC",alpha=0.5)+
  geom_point(aes(x=SA.smallfomite/20100*100,y=mean(frame.all2$dose[frame.all2$model=="Model A"]),fill="Model A"),shape=22,size=8,alpha=0.3)+
  geom_point(aes(x=SA.smallfomite/20100*100,y=mean(frame.all2$dose[frame.all2$model=="Model B"]),fill="Model B"),shape=23,size=8,alpha=0.3)+
  geom_point(aes(x=0.5*100,y=mean(frame.all2$dose[frame.all2$model=="Model C"]),fill="Model C"),shape=22,size=8,alpha=0.3)+
  geom_text(x=13,y=-1.32,label="Model B",size=6)+
  geom_text(x=13,y=-1.57,label="Model A",size=6)+
  geom_text(x=63,y=0.08,label="Model C",size=6)+
  scale_shape_manual(labels=c("Model A","Model B","Model C"),values=c(22,23,22),name="")+
  scale_fill_manual(labels=c("Model A","Model B","Model C"),values=c("#3333FF","#FFFF00","#00CCCC"),name="")+
  theme_pubr()+
  theme(axis.title = element_text(size=18),axis.text=element_text(size=18),legend.position = "none")



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
  
  for (i in 1:lengthsim){
    
    for(j in 1:iter){
      temp<-matrix.list[[j]]
      mucous[j]<-matrix.list[[j]][6,i]
      fingertip[j]<-matrix.list[[j]][4,i]
      nonfingertip[j]<-matrix.list[[j]][3,i]
      smallfomite[j]<-matrix.list[[j]][1,i]
      largefomite<-matrix.list[[j]][2,i]
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
  }else{
    temp<-data.frame(means=means,sd=sd,state=state,time=time,
                     model=model.sensitivity.1[a])
    
    frame.model.sensitivity<-rbind(frame.model.sensitivity,temp)
  }
  
}


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
  
  for (i in 1:lengthsim){
    
    for(j in 1:iter){
      temp<-matrix.list[[j]]
      mucous[j]<-matrix.list[[j]][6,i]
      fingertip[j]<-matrix.list[[j]][4,i]
      nonfingertip[j]<-matrix.list[[j]][3,i]
      smallfomite[j]<-matrix.list[[j]][1,i]
      largefomite[j]<-matrix.list[[j]][2,i]
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
  }else{
    temp<-data.frame(means=means,sd=sd,state=state,time=time,
                     model=model.sensitivity.2[a])
    
    frame.model.sensitivity2<-rbind(frame.model.sensitivity2,temp)
  }
  
}

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("sensitivity_E_and_F",st, ".csv", sep = "")
write.csv(frame.model.sensitivity2,filename)


windows()
B<-ggplot(data=frame.model.sensitivity2[frame.model.sensitivity2$state=="mucous membranes",])+
  geom_line(aes(x=time*timestep,y=means,color=model),size=1)+
  geom_ribbon(aes(x=time*timestep,ymax=means+sd*1.96/sqrt(iter),ymin=means-sd*1.96/sqrt(iter),fill=model),alpha=0.2)+
  scale_x_continuous(name="Time (minutes)")+
  scale_y_continuous(name="Mean Dose")+
  scale_color_discrete(name="")+
  scale_fill_discrete(name="")+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),title=element_text(size=18))+
  ggtitle("B")

ggarrange(A,B)

#frame.model.sensitivity<-subset(frame.model.sensitivity,select=c(-X))
frame.sensitivity.all<-rbind(frame.model.sensitivity,frame.model.sensitivity2)

st=format(Sys.time(), "%Y-%m-%d")
filename<-paste("sensitivity_all",st, ".csv", sep = "")
write.csv(frame.sensitivity.all,filename)

windows()
ggplot(data=frame.sensitivity.all[frame.sensitivity.all$state=="mucous membranes",])+
  geom_line(aes(x=time*timestep,y=means,color=model),size=1)+
  geom_ribbon(aes(x=time*timestep,ymax=means+sd*1.96/sqrt(iter),ymin=means-sd*1.96/sqrt(iter),fill=model),alpha=0.2)+
  scale_x_continuous(name="Time (min)")+
  scale_y_continuous(name="Dose (# viral particles)")+
  scale_color_discrete(name="")+
  scale_fill_discrete(name="")+
  theme_pubr()+
  theme(axis.text=element_text(size=16),axis.title=element_text(size=16),legend.text=element_text(size=16),title=element_text(size=18))