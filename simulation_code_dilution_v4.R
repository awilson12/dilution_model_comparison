sim.function3<-function(type=c("primary"),model=c("A"),timestep=0.001,iter=1000,sensitivitymodel=c("E")){
  
  matrix.all<-list()
  
  set.seed(30)
  
  lengthsim<<-(((1/timestep)*duration)+1)
    
    modeltype<<-model
    
    if(sensitivitymodel=="E"){
      
      source('defining_parameters_v3.R')
      
      source('defining_rates_sensitivity_E.R')
      
    }else{
      
      source('defining_parameters_v4.R')
      
      source('defining_rates_sensitivity_F.R')
    
    }
  
  
  for (l in 1:iter){
    
    l<<-l
    
      
      matrix.dim<-6
      
      #initialize matrix
      matrix.save<-matrix(nrow=matrix.dim,ncol=lengthsim)
      
      #initial conditions
      matrix.save[1,1]<-small.fome.virus
      matrix.save[2,1]<-large.fome.virus
      matrix.save[3:6,1]<-0
      
      rownames(matrix.save)<-c("small fomite","large fomite",
                               "hand 1","hand 2",
                               "loss of viability", "mucous membranes")
      
      source('defining_probabilities_modelC_sensitivityR.R')
      
      Ptemp<-PC
    
    
    for (i in 2:(((1/timestep)*duration)+1)){

        Ptemp<-Ptemp%*%PC
      
      matrix.save[,i]<-matrix.save[,1]%*%Ptemp
      
    } #end of exposure simulation loop
    
    
    matrix.save.temp<-matrix.save
    
      
      #hand2
      matrix.save.temp[4,]<-matrix.save[4,]/(A.hand[l])
      
      #hand1
      matrix.save.temp[3,]<-matrix.save[3,]/(A.hand[l])
      
      #small fomite
      matrix.save.temp[1,]<-matrix.save[1,]/SA.smallfomite
      
      #large fomite
      matrix.save.temp[2,]<-matrix.save[2,]/SA.largefomite
      
      matrix.all[[l]]<-matrix.save.temp
      
    } #end of iteration loop
    
  matrix.list<<-matrix.all
  
} #end of function