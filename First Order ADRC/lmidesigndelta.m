clear all

A=[0 1 0; 0 0 1;0 0 0];
B=[0;1;0]
C=[1 0 0;0 1 0];

delta=0.1;

% (1) initialize the LMI system to void
setlmis([]);


% (2) define the matrix variables
P=lmivar(1,[3 1]);
X=lmivar(2,[3 2]);

% (3) specify the terms appearing in each LMI
lmiterm([1 1 1 P],A',1,'s');
lmiterm([1 1 1 X],-1,C,'s');
lmiterm([1 1 1 P],2*delta,1);


%lmiterm([1 2 2 Z],2*mu,1);

lmiterm([-2 1 1 P],1,1);;                        % LMI #5: R

lmisys=getlmis;

[tmin,xfeas]=feasp(lmisys);

P=dec2mat(lmisys,xfeas,P);
X=dec2mat(lmisys,xfeas,X);

L=P\X
