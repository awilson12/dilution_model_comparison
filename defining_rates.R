#non-zero rates for model A

lambda.1.2.A<-(1/total.fomeSA)*S.H*TE.FH*A.hand*H.fome*timestep
lambda.1.3.A<-k.fome*timestep

lambda.2.1.A<-0.5*S.H*TE.HF*H.fome*timestep
lambda.2.3.A<-k.skin*timestep
lambda.2.4.A<-0.5*S.Face*TE.HM*H.face*timestep

#non-zero rates for model B

lambda.1.2.B<-(1/total.fomeSA)*S.NF*TE.FH*A.nonfingertip*H.fome.nonfinger*timestep
lambda.1.3.B<-(1/total.fomeSA)*S.F.fomite*TE.FH*A.fingertip*H.fome.finger*timestep
lambda.1.4.B<-k.fome*timestep

lambda.2.1.B<-0.5*S.NF*TE.HF*H.fome.nonfinger*timestep
lambda.2.4.B<-k.skin*timestep

lambda.3.1.B<-0.5*S.F.fomite*TE.HF*H.fome.finger*timestep
lambda.3.4.B<-k.skin*timestep
lambda.3.5.B<-0.5*S.F*TE.HM*H.face*timestep

#non-zero rates for model C

lambda.1.3.C<-(1/SA.smallfomite)*S.H*TE.FH*A.hand*H.sm.fome*timestep
lambda.1.4.C<-k.fome*timestep

lambda.2.3.C<-(1/SA.largefomite)*S.H*TE.FH*A.hand*H.lg.fome*timestep
lambda.2.4.C<-k.fome*timestep

lambda.3.1.C<-0.5*S.H*TE.HF*H.sm.fome*timestep
lambda.3.2.C<-0.5*S.H*TE.HF*H.lg.fome*timestep
lambda.3.4.C<-k.skin*timestep
lambda.3.5.C<-0.5*S.Face*TE.HM*H.face*timestep

#non-zero rates for model D

lambda.1.3.D<-(1/SA.smallfomite)*S.NF*TE.FH*A.nonfingertip*H.sm.nonfinger*timestep
lambda.1.4.D<-(1/SA.smallfomite)*S.F.fomite*TE.FH*A.fingertip*H.sm.finger*timestep
lambda.1.5.D<-k.fome*timestep

lambda.2.3.D<-(1/SA.largefomite)*S.NF*TE.FH*A.nonfingertip*H.lg.nonfinger*timestep
lambda.2.4.D<-(1/SA.largefomite)*S.F.fomite*TE.FH*A.fingertip*H.lg.finger*timestep
lambda.2.5.D<-k.fome*timestep

lambda.3.1.D<-0.5*S.NF*TE.HF*H.sm.nonfinger*timestep
lambda.3.2.D<-0.5*S.NF*TE.HF*H.lg.nonfinger*timestep
lambda.3.5.D<-k.skin*timestep

lambda.4.1.D<-0.5*S.F.fomite*TE.HF*H.sm.finger*timestep
lambda.4.2.D<-0.5*S.F.fomite*TE.HF*H.lg.nonfinger*timestep
lambda.4.5.D<-k.skin*timestep
lambda.4.6.D<-0.5*S.F*TE.HM*H.face*timestep

