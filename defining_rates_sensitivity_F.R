
#non-zero rates for model C

lambda.1.3.C<-(1/SA.smallfomite)*S.NF*TE.FH*A.nonfingertip*H.sm.nonfinger*timestep
lambda.1.4.C<-(1/SA.smallfomite)*S.F.fomite*TE.FH*A.fingertip*H.sm.finger*timestep
lambda.1.5.C<-k.fome*timestep

lambda.2.3.C<-(1/SA.largefomite)*S.NF*TE.FH*A.nonfingertip*H.lg.nonfinger*timestep
lambda.2.4.C<-(1/SA.largefomite)*S.F.fomite*TE.FH*A.fingertip*H.lg.finger*timestep
lambda.2.5.C<-k.fome*timestep

lambda.3.1.C<-0.5*S.NF*TE.HF*H.sm.nonfinger*timestep
lambda.3.2.C<-0.5*S.NF*TE.HF*H.lg.nonfinger*timestep
lambda.3.5.C<-k.skin*timestep
lambda.3.6.C<-S.Face*TE.HM*H.face*0.1*timestep

lambda.4.1.C<-0.5*S.F.fomite*TE.HF*H.sm.finger*timestep
lambda.4.2.C<-0.5*S.F.fomite*TE.HF*H.lg.nonfinger*timestep
lambda.4.5.C<-k.skin*timestep
lambda.4.6.C<-S.Face*TE.HM*H.face*0.9*timestep


