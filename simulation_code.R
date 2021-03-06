sim.function<-function(type=c("primary"),model=c("A"),timestep=0.001,iter=1000){
  
  matrix.all<-list()
  
  lengthsim<<-(((1/timestep)*duration)+1)
  
  source('defining_parameters.R')
  
  if (type=="sensitivity"){
    
    modeltype<<-model
    
    source('sensitivity_param.R') 
    
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
        matrix.save<-matrix(nrow=lengthsim,ncol=matrix.dim)
        
        colnames(matrix.save)<-c("fomites","hands","loss of viability","mucous membranes")
        
        #initial conditions
        matrix.save[1,1]<-group.virus
        matrix.save[1,2:4]<-0
        
        source('defining_probabilities_modelA.R')
        
      }else if (model=="B"){
        matrix.dim<-5
        
        #initialize matrix
        matrix.save<-matrix(nrow=lengthsim,ncol=matrix.dim)
        colnames(matrix.save)<-c("fomites","non-fingertip","fingertip",
                                 "loss of viability","mucous membranes")
        #initial conditions
        matrix.save[1,1]<-group.virus
        matrix.save[1,2:5]<-0
        
        source('defining_probabilities_modelB.R')
        
      }else{
        matrix.dim<-6
        
        #initialize matrix
        matrix.save<-matrix(nrow=lengthsim,ncol=matrix.dim)
        colnames(matrix.save)<-c("small fomite","large fomite",
                                 "non-fingertip","fingertip",
                                 "loss of viability", "mucous membranes")
        
        #initial conditions
        matrix.save[1,1]<-small.fome.virus
        matrix.save[1,2]<-large.fome.virus
        matrix.save[1,3:6]<-0
        
        source('defining_probabilities_modelC.R')
        
      }
    }else{
      #sensitivity analysis models (A through F)
      matrix.dim<-6
      
      #initialize matrix
      matrix.save<-matrix(nrow=lengthsim,ncol=matrix.dim)
      
      #initial conditions
      matrix.save[1,1]<-small.fome.virus
      matrix.save[1,2]<-large.fome.virus
      matrix.save[1,3:6]<-0
      
      colnames(matrix.save)<-c("small fomite","large fomite",
                               "non-fingertip","fingertip",
                               "loss of viability", "mucous membranes")
      
      source('defining_probabilities_modelC.R')
      
     
    }
    
    
    for (i in 2:(((1/timestep)*duration)+1)){
      
      if (type=="primary"){
        
        if(model=="A"){
          
        matrix.save[i,1]<-matrix.save[i-1,1]-matrix.save[i-1,1]*sum(probs[1,2:3])+
          matrix.save[i-1,2]*probs[2,1]
        
        matrix.save[i,2]<-matrix.save[i-1,2]-matrix.save[i-1,2]*sum(probs[2,1],probs[2,3:4])+
          matrix.save[i-1,1]*probs[1,2]
        
        matrix.save[i,3]<-matrix.save[i-1,3]+matrix.save[i-1,1]*probs[1,3]+matrix.save[i-1,2]*probs[2,3]
        
        matrix.save[i,4]<-matrix.save[i-1,4]+matrix.save[i-1,2]*probs[2,4]
          
        }else if (model=="B"){
          
        matrix.save[i,1]<-matrix.save[i-1,1]-matrix.save[i-1,1]*sum(probs[1,2:5])+
          matrix.save[i-1,2]*probs[2,1]+matrix.save[i-1,3]*probs[3,1]
        
        matrix.save[i,2]<-matrix.save[i-1,2]-matrix.save[i-1,2]*sum(probs[2,1],probs[2,3:5])+
          matrix.save[i-1,1]*probs[1,2]
        
        matrix.save[i,3]<-matrix.save[i-1,3]-matrix.save[i-1,3]*sum(probs[3,1:2],probs[3,4:5])+
          matrix.save[i-1,1]*probs[1,3]
        
        matrix.save[i,4]<-matrix.save[i-1,4]+matrix.save[i-1,1]*probs[1,4]+matrix.save[i-1,2]*probs[2,4]+
          matrix.save[i-1,3]*probs[3,4]
        
        matrix.save[i,5]<-matrix.save[i-1,5]+matrix.save[i-1,3]*probs[3,5]
          
        }else{
          
        #model C
          
        matrix.save[i,1]<-matrix.save[i-1,1]-matrix.save[i-1,1]*sum(probs[1,2:6])+
          matrix.save[i-1,3]*probs[3,1]+matrix.save[i-1,4]*probs[4,1]
        
        matrix.save[i,2]<-matrix.save[i-1,2]-matrix.save[i-1,2]*sum(probs[2,1],probs[2,3:6])+
          matrix.save[i-1,3]*probs[3,2]+matrix.save[i-1,4]*probs[4,2]
        
        matrix.save[i,3]<-matrix.save[i-1,3]-matrix.save[i-1,3]*sum(probs[3,1:2],probs[3,4:6])+
          matrix.save[i-1,1]*probs[1,3]+matrix.save[i-1,2]*probs[2,3]
        
        matrix.save[i,4]<-matrix.save[i-1,4]-matrix.save[i-1,4]*sum(probs[4,1:3],probs[4,5:6])+
          matrix.save[i-1,1]*probs[1,4]+matrix.save[i-1,2]*probs[2,4]
        
        matrix.save[i,5]<-matrix.save[i-1,5]+matrix.save[i-1,1]*probs[1,5]+matrix.save[i-1,2]*probs[2,5]+
          matrix.save[i-1,3]*probs[3,5]+matrix.save[i-1,4]*probs[4,5]
        
        matrix.save[i,6]<-matrix.save[i-1,6]+matrix.save[i-1,4]*probs[4,6]
          
        }
        
      }else{
        matrix.save[i,1]<-matrix.save[i-1,1]-matrix.save[i-1,1]*sum(probs[1,2:6])+
          matrix.save[i-1,3]*probs[3,1]+matrix.save[i-1,4]*probs[4,1]
        
        matrix.save[i,2]<-matrix.save[i-1,2]-matrix.save[i-1,2]*sum(probs[2,1],probs[2,3:6])+
          matrix.save[i-1,3]*probs[3,2]+matrix.save[i-1,4]*probs[4,2]
        
        matrix.save[i,3]<-matrix.save[i-1,3]-matrix.save[i-1,3]*sum(probs[3,1:2],probs[3,4:6])+
          matrix.save[i-1,1]*probs[1,3]+matrix.save[i-1,2]*probs[2,3]
        
        matrix.save[i,4]<-matrix.save[i-1,4]-matrix.save[i-1,4]*sum(probs[4,1:3],probs[4,5:6])+
          matrix.save[i-1,1]*probs[1,4]+matrix.save[i-1,2]*probs[2,4]
        
        matrix.save[i,5]<-matrix.save[i-1,5]+matrix.save[i-1,1]*probs[1,5]+matrix.save[i-1,2]*probs[2,5]+
          matrix.save[i-1,3]*probs[3,5]+matrix.save[i-1,4]*probs[4,5]
        
        matrix.save[i,6]<-matrix.save[i-1,6]+matrix.save[i-1,4]*probs[4,6]
      }
      
    } #end of exposure simulation loop
    
    matrix.all[[l]]<-as.data.frame(matrix.save)
    
  } #end of iteraiton loop
  matrix.list<<-matrix.all
  
} #end of function