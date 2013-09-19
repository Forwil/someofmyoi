program robot;
const ax:Array[1..4]of -1..1=(-1,0,1,0);
      ay:array[1..4]of -1..1=(0,-1,0,1);
var mom:Array[-3..55,-3..55,1..4]of longint;
     can:Array[-3..55,-3..55]of boolean;
     z:array[0..55*55*4,0..2]of longint;
   ans,xx,yy,r,y,f,l,i,j,k,n,m,x,t,w,ll:longint;
   ch:char;
   find:boolean;
begin
assign(input,'robot.in');reset(input);
assign(output,'robot.out');rewrite(output);
readln(n,m);
fillchar(mom,sizeof(mom),63);
r:=mom[0,0,1];
for i:=1 to n-1 do
for j:=1 to m-1 do
can[i,j]:=true;

for i:=1 to n do
for j:=1 to m do
 begin
 read(x);
 if x=1 then
  begin
  can[i,j]:=false;
  can[i-1,j]:=false;
  can[i,j-1]:=false;
  can[i-1,j-1]:=false;
  end;
 if j=m then readln;
 end;
read(x,y,xx,yy);
read(ch);read(ch);
z[1,1]:=x;
z[1,2]:=y;
if ch='N'then z[1,0]:=1;
if ch='W'then z[1,0]:=2;
if ch='S'then z[1,0]:=3;
if ch='E'then z[1,0]:=4;
mom[x,y,z[1,0]]:=0;
w:=1;t:=0;
find:=false;
repeat
t:=t+1;
f:=z[t,0] mod 4+1;
x:=z[t,1];
y:=z[t,2];
if (x>=1)and(x<=n+1)and(y>=1)and(y<=m+1) then
if (mom[x,y,f]=r)and(can[x,y]) then
 begin
 mom[x,y,f]:=mom[z[t,1],z[t,2],z[t,0]]+1;
 w:=w+1;
 z[w,1]:=x;
 z[w,2]:=y;
 z[w,0]:=f;
 if (x=xx)and(y=yy)then find:=true;
 end;if find then break;

f:=(z[t,0]-1-1+4) mod 4+1;
x:=z[t,1];
y:=z[t,2];
if (x>=1)and(x<=n+1)and(y>=1)and(y<=m+1) then
if (mom[x,y,f]=r)and(can[x,y]) then
 begin
 mom[x,y,f]:=mom[z[t,1],z[t,2],z[t,0]]+1;
 w:=w+1;
 z[w,1]:=x;
 z[w,2]:=y;
 z[w,0]:=f;
 if (x=xx)and(y=yy)then find:=true;
 end;if find then break;

for l:=1 to 3 do
begin
f:=z[t,0];
x:=z[t,1]+ax[f]*l;
y:=z[t,2]+ay[f]*l;
if can[x,y]=false then break;
if (x>=1)and(x<=n+1)and(y>=1)and(y<=m+1) then
if mom[x,y,f]=r then
 begin
 mom[x,y,f]:=mom[z[t,1],z[t,2],z[t,0]]+1;
 w:=w+1;
 z[w,1]:=x;
 z[w,2]:=y;
 z[w,0]:=f;
 if (x=xx)and(y=yy)then find:=true;
 end;
end;
if find then break;
until t>=w;
ans:=maxlongint;
if mom[xx,yy,1]<ans then ans:=mom[xx,yy,1];
if mom[xx,yy,2]<ans then ans:=mom[xx,yy,2];
if mom[xx,yy,3]<ans then ans:=mom[xx,yy,3];
if mom[xx,yy,4]<ans then ans:=mom[xx,yy,4];
if (ans=maxlongint)or(ans=r)then writeln(-1)
else writeln(ans);
close(output);
end.
