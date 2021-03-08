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
                                 "non-fingertip","fingertip",
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
                               "non-fingertip","fingertip",
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
    
    #adjusting for SA
    
    matrix.save.temp<-matrix.save
    
    if(model=="A"){
      
      #fomites
      matrix.save.temp[2,]<-matrix.save[2,]/A.hand[l]
      
      #hands
      matrix.save.temp[1,]<-matrix.save[1,]/total.fomeSA
        
    }else if (model=="B"){
      
      #fingertip
      matrix.save.temp[2,]<-matrix.save[2,]/A.fingertip[l]
      
      #nonfingertip
      matrix.save.temp[3,]<-matrix.save[3,]/A.nonfingertip[l]
      
      #fomites
      matrix.save.temp[1,]<-matrix.save[1,]/total.fomeSA
  
      
    }else if (model=="C"){
      
      #fingertip/
      matrix.save.temp[4,]<-matrix.save[4,]/A.fingertip[l]
      
      #nonfingertip
      matrix.save.temp[3,]<-matrix.save[3,]/A.nonfingertip[l]
      
      #small fomite
      matrix.save.temp[1,]<-matrix.save[1,]/SA.smallfomite
      
      #large fomite
      matrix.save.temp[2,]<-matrix.save[2,]/SA.largefomite
      
    }
    
    matrix.all[[l]]<-matrix.save.temp
    
  } #end of iteraiton loop
  matrix.list<<-matrix.all
  
} #end of function