
#non-zero rates for model C

lambda.1.3.C<-(1/SA.smallfomite)*S.H*TE.FH*A.hand*H.sm.right*timestep
lambda.1.4.C<-(1/SA.smallfomite)*S.H*TE.FH*A.hand*H.sm.left*timestep
lambda.1.5.C<-k.fome*timestep

lambda.2.3.C<-(1/SA.largefomite)*S.H*TE.FH*A.hand*H.lg.right*timestep
lambda.2.4.C<-(1/SA.largefomite)*S.H*TE.FH*A.hand*H.lg.left*timestep
lambda.2.5.C<-k.fome*timestep

lambda.3.1.C<-S.H*TE.HF*H.sm.right*timestep
lambda.3.2.C<-S.H*TE.HF*H.lg.right*timestep
lambda.3.5.C<-k.skin*timestep
#lambda.3.6.C<-S.Face*TE.HM*H.face*0.25*timestep
lambda.3.6.C<-S.Face*TE.HM*H.face*0.5*timestep

lambda.4.1.C<-S.H*TE.HF*H.sm.left*timestep
lambda.4.2.C<-S.H*TE.HF*H.lg.left*timestep
lambda.4.5.C<-k.skin*timestep
#lambda.4.6.C<-S.Face*TE.HM*H.face*0.75*timestep
lambda.4.6.C<-S.Face*TE.HM*H.face*0.5*timestep

