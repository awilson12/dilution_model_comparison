
if(modeltype=="A"){
  H.fome.finger<-(1/3)*H.fome
  H.fome.nonfinger<-(2/3)*H.fome
  
  H.sm.finger<-(1/2)*H.fome.finger
  H.lg.finger<-(1/2)*H.fome.finger
  H.sm.nonfinger<-(1/2)*H.fome.nonfinger
  H.lg.nonfinger<-(1/2)*H.fome.nonfinger
  
  source('defining_rates.R')
  
}else if (modeltype=="B"){
  H.fome.finger<-(2/3)*H.fome
  H.fome.nonfinger<-(1/3)*H.fome
  
  H.sm.finger<-(1/2)*H.fome.finger
  H.lg.finger<-(1/2)*H.fome.finger
  H.sm.nonfinger<-(1/2)*H.fome.nonfinger
  H.lg.nonfinger<-(1/2)*H.fome.nonfinger
  
  source('defining_rates.R')
  
}else if (modeltype=="C"){
  H.fome.finger<-(1/3)*H.fome
  H.fome.nonfinger<-(2/3)*H.fome
  
  H.sm.finger<-(1/3)*H.fome.finger
  H.lg.finger<-(2/3)*H.fome.finger
  H.sm.nonfinger<-(1/3)*H.fome.nonfinger
  H.lg.nonfinger<-(2/3)*H.fome.nonfinger
  
  source('defining_rates.R')
  
}else if (modeltype=="D"){
  H.fome.finger<-(2/3)*H.fome
  H.fome.nonfinger<-(1/3)*H.fome
  
  H.sm.finger<-(1/3)*H.fome.finger
  H.lg.finger<-(2/3)*H.fome.finger
  H.sm.nonfinger<-(1/3)*H.fome.nonfinger
  H.lg.nonfinger<-(2/3)*H.fome.nonfinger
  
  source('defining_rates.R')
  
}else if (model=="E"){
  H.fome.finger<-0.1*H.fome
  H.fome.nonfinger<-0.9*H.fome
  
  A.fingertip<-A.hand
  A.nonfingertip<-A.hand
  S.NF<-S.H
  S.F.fomite<-S.H
  
  source('defining_rates_sensitivity_E.R')
  
}else{
  H.fome.finger<-0.9*H.fome
  H.fome.nonfinger<-0.1*H.fome
  
  A.fingertip<-A.hand
  A.nonfingertip<-A.hand
  S.NF<-S.H
  S.F.fomite<-S.H
  
  source('defining_rates_sensitivity_F.R')
  
}
