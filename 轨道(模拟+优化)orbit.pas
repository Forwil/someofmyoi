program orbit;
var  ind:array[0..1000003,1..2]of longint;
     yyy:array[1..2,1..2]of longint;
    xx,yy,s,y,x,u,p,i,j,n,m:longint;
     flag:boolean;        k:longint;
function get(x:longint):longint;
var i:longint;
t,w,l:longint;
z:longint;
begin
t:=x*360+1;
w:=x*360+360;
z:=0;
if ((yyy[1,1]<=t)and(yyy[1,2]>=w))
 or((yyy[2,1]<=t)and(yyy[2,2]>=w)) then
  begin
  z:=-360*p;
  if z+k<0 then
   begin
   flag:=true;
   xx:=x;
   yy:=k div p+1;
   get:=0;
   exit;
   end;
  end
 else
if ((yyy[1,1]<=t)and(yyy[1,2]>=t))
 or((yyy[1,1]<=w)and(yyy[1,2]>=w))
 or((yyy[2,1]<=t)and(yyy[2,2]>=t))
 or((yyy[2,1]<=w)and(yyy[2,2]>=w))
 or((yyy[1,1]>=t)and(yyy[1,2]<=w))
 or((yyy[2,1]>=t)and(yyy[2,1]<=w))then
 begin
 for i:=1 to 360 do
  begin
  l:=x*360+i;
 if ((yyy[1,1]<=l)and(yyy[1,2]>=l))
  or((yyy[1,1]<=l)and(yyy[1,2]>=l))
  or((yyy[2,1]<=l)and(yyy[2,2]>=l))
  or((yyy[2,1]<=l)and(yyy[2,2]>=l))
  or((ind[x,1]<=i)and(ind[x,2]>=i))
then
   begin
   z:=z-p;
   if k+z<0 then
    begin
    flag:=true;
    xx:=x;
    yy:=i;
    get:=0;
    writeln(k);
    exit;
    end;
   end
   else
   z:=z+u-p;
  end;
 end
else
 if ind[x,1]>ind[x,2] then
   z:=(360)*(u-p)
  else
   begin
    z:=z+(ind[x,1]-1)*(u-p);
    z:=z-(ind[x,2]-ind[x,1]+1)*p;
  if k+z<0 then
    begin
    flag:=true;
    z:=z+(ind[x,2]-ind[x,1]+1)*p;
    xx:=x;
    yy:=ind[x,1]+(z+k)div p;
    get:=0;
    exit;
    end;
  z:=z+(360-ind[x,2])*(u-p);
  end;
  get:=z;
end;
begin
assign(input,'orbit.in');reset(input);
assign(output,'orbit.out');rewrite(output);
readln(n,k,p,u);
p:=p div 360;
for i:=1 to n do
begin
 readln(x,y);
 ind[i,1]:=x;
 ind[i,2]:=y;
end;
readln(x,y,xx,yy);
if (x<xx)or((x=xx)and(y<=yy)) then
begin
yyy[1,1]:=x*360+y;
yyy[1,2]:=xx*360+yy;
end;
readln(x,y,xx,yy);
if (x<xx)or((x=xx)and(y<=yy)) then
begin
yyy[2,1]:=x*360+y;
yyy[2,2]:=xx*360+yy;
end;
 for i:=1 to n do
 begin
   k:=k+get(i);
   if flag then break;
 end;
if flag then
 begin
 writeln('NO');
 writeln(xx,' ',yy);
 end
else
begin
writeln('YES');
writeln(k);
end;
 close(output);
end.
