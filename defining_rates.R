#non-zero rates for model A

lambda.1.2.A<-(1/total.fomeSA)*S.H*TE.FH*A.hand*H.fome
lambda.1.3.A<-k.fome

lambda.2.1.A<-0.5*S.H*TE.HF*H.fome
lambda.2.3.A<-k.skin
lambda.2.4.A<-0.5*S.Face*TE.HM*H.face

#non-zero rates for model B

lambda.1.2.B<-(1/total.fomeSA)*S.NF*TE.FH*A.nonfingertip*H.fome.nonfinger
lambda.1.3.B<-(1/total.fomeSA)*S.F.fomite*TE.FH*A.fingertip*H.fome.finger
lambda.1.4.B<-k.fome

lambda.2.1.B<-0.5*S.NF*TE.HF*H.fome.nonfinger
lambda.2.4.B<-k.skin

lambda.3.1.B<-0.5*S.F.fomite*TE.HF*H.fome.finger
lambda.3.4.B<-k.skin
lambda.3.5.B<-0.5*S.Face*TE.HM*H.face

#non-zero rates for model C

lambda.1.3.C<-(1/SA.smallfomite)*S.NF*TE.FH*A.nonfingertip*H.sm.nonfinger
lambda.1.4.C<-(1/SA.smallfomite)*S.F.fomite*TE.FH*A.fingertip*H.sm.finger
lambda.1.5.C<-k.fome

lambda.2.3.C<-(1/SA.largefomite)*S.NF*TE.FH*A.nonfingertip*H.lg.nonfinger
lambda.2.4.C<-(1/SA.largefomite)*S.F.fomite*TE.FH*A.fingertip*H.lg.finger
lambda.2.5.C<-k.fome

lambda.3.1.C<-0.5*S.NF*TE.HF*H.sm.nonfinger
lambda.3.2.C<-0.5*S.NF*TE.HF*H.lg.nonfinger
lambda.3.5.C<-k.skin

lambda.4.1.C<-0.5*S.F.fomite*TE.HF*H.sm.finger
lambda.4.2.C<-0.5*S.F.fomite*TE.HF*H.lg.nonfinger
lambda.4.5.C<-k.skin
lambda.4.6.C<-0.5*S.F*TE.HM*H.face

