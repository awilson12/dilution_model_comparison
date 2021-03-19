sim.function3<-function(type=c("primary"),model=c("A"),timestep=0.001,iter=1000,sensitivitymodel=c("E")){
  
  matrix.all<-list()
  
  lengthsim<<-(((1/timestep)*duration)+1)
  
  source('defining_parameters_v2.R')
  
  if (type=="sensitivity"){
    
    modeltype<<-model
    
    if(sensitivitymodel=="E"){
      
      source('defining_parameters_v3.R')
      
      source('defining_rates_sensitivity_E.R')
      
    }else{
      
      source('defining_parameters_v4.R')
      
      source('defining_rates_sensitivity_F.R')
    
    }
  
    
  }else{
    
    source('defining_rates.R') #note that probabilities are defined within the simulation code function
    
  }
  
  for (l in 1:iter){
    
    l<<-l
    
    if (type=="primary"){
      
      #primary models (A through C)
      
      if(model=="A"){
        
        matrix.dim<-4
        
        #initialize matrix
        matrix.save<-matrix(nrow=matrix.dim,ncol=lengthsim)
        
        rownames(matrix.save)<-c("fomites","hands","loss of viability","mucous membranes")
        
        #initial conditions
        matrix.save[1,1]<-group.virus
        matrix.save[2:4,1]<-0
        
        source('defining_probabilities_modelA.R')
        
        Ptemp<-PA
        
      }else if (model=="B"){
        matrix.dim<-5
        
        #initialize matrix
        matrix.save<-matrix(nrow=matrix.dim,ncol=lengthsim)
        rownames(matrix.save)<-c("fomites","non-fingertip","fingertip",
                                 "loss of viability","mucous membranes")
        #initial conditions
        matrix.save[1,1]<-group.virus
        matrix.save[2:5,1]<-0
        
        source('defining_probabilities_modelB.R')
        
        Ptemp<-PB
        
      }else{
        matrix.dim<-6
        
        #initialize matrix
        matrix.save<-matrix(nrow=matrix.dim,ncol=lengthsim)
        rownames(matrix.save)<-c("small fomite","large fomite",
                                 "hand 1","hand 2",
                                 "loss of viability", "mucous membranes")
        
        #initial conditions
        matrix.save[1,1]<-small.fome.virus
        matrix.save[2,1]<-large.fome.virus
        matrix.save[3:6,1]<-0
        
        source('defining_probabilities_modelC.R')
        
        Ptemp<-PC
        
      }
    }else{
      #sensitivity analysis models (A through F)
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
      
      source('defining_probabilities_modelC.R')
      
      Ptemp<-PC
     
    }
    
    
    for (i in 2:(((1/timestep)*duration)+1)){
      
      if (type=="primary"){
        
        if(model=="A"){
          
          Ptemp<-Ptemp%*%PA
          
        }else if (model=="B"){
          
          Ptemp<-Ptemp%*%PB
          
        }else{
          Ptemp<-Ptemp%*%PC
        }
        
      }else{
        Ptemp<-Ptemp%*%PC
      }
      
      matrix.save[,i]<-matrix.save[,1]%*%Ptemp
      
    } #end of exposure simulation loop
    
    
    matrix.all[[l]]<-matrix.save
    
  } #end of iteraiton loop
  matrix.list<<-matrix.all
  
} #end of function