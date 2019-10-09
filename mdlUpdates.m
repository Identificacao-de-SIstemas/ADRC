%**flag=2,update variables of discrete system state**
function sys=mdlUpdates(x,u,r,h0,h)
sys(1,1)=x(1)+h*x(2);
sys(2,1)=x(2)+h*fhan(x(1)-u,x(2),r,h0);
end