program fruit;
const ax:Array[1..4]of -1..1=(0,1,-1,0);
      ay:Array[1..4]of -1..1=(1,0,0,-1);
var d:Array[0..21,1..2]of longint;
    dis:Array[0..51,0..51]of longint;
    b:array[0..51,0..51]of longint;
 ans,tt,ttt,t,i,j,k,n,m,x,y,ff,f,r:longint;
   ch:char;
procedure go(x,y,z:longint);
var i,xx,yy:longint;
begin
if dis[x,y]<=z then exit;
dis[x,y]:=z;
for i:=1 to 4 do
 begin
 xx:=x+ax[i];
 yy:=y+ay[i];
 if b[xx,yy]<>-1 then
  begin
  if (b[xx,yy]=-2)or(b[xx,yy]=-1)or(b[x,y]=-2)or(b[x,y]=-1) then
  begin go(xx,yy,z+2);continue;end;
  if b[xx,yy]=b[x,y] then
  begin go(xx,yy,z+1);continue;end;
  if abs(b[xx,yy]-b[x,y])=1 then
  begin go(xx,yy,z+3);continue;end;
  end;
 end;
end;

begin
assign(input,'fruit8.in');reset(input);
//assign(output,'fruit.out');rewrite(output);
readln(n,m);
fillchar(b,sizeof(b),$ff);
for i:=1 to n do
for j:=1 to m do
begin
read(ch);
if (ch<>'X')and(ch<>'$')then b[i,j]:=ord(ch)-48;
if ch='X' then
 begin
 b[i,j]:=-1;
 x:=i;y:=j;
 end;
if ch='$' then
 begin
 t:=t+1;
 b[i,j]:=-2;
 d[t,1]:=i;
 d[t,2]:=j;
 end;
if j=m then readln;
end;

fillchar(dis,sizeof(dis),63);
r:=dis[0,0];
go(x,y,0);

for i:=1 to t do
if dis[d[i,1],d[i,2]]=r then
begin
writeln(-1);
close(output);
halt;
end;
if t=0 then
begin
writeln(0);
close(output);
halt;
end;
for i:=1 to t do
for j:=i+1 to t do
if dis[d[i,1],d[i,2]]>dis[d[j,1],d[j,2]] then
begin
d[0]:=d[i];d[i]:=d[j];d[j]:=d[0];
end;

ans:=maxlongint;
 for i:=0 to 1 shl t-1 do
 begin
 tt:=0;
 ttt:=0;
 for j:=0 to t-1 do
 if i and (1 shl (j))<>0 then
  begin
  tt:=tt+dis[d[j+1,1],d[j+1,2]];
  f:=j+1;
  end
 else
  begin
  ttt:=ttt+dis[d[j+1,1],d[j+1,2]];
  ff:=j+1;
  end;
 tt:=tt*2-dis[d[f,1],d[f,2]];
 ttt:=ttt*2-dis[d[ff,1],d[ff,2]];
 if ttt>tt then
   tt:=ttt;
 if tt<ans then ans:=tt;
 end;
 writeln(ans);
 close(output);
end.
