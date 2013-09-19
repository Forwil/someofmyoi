program d9_11;
type link=^red;
  red=record
  st,en:longint;
  nexT:link;
  end;
var dp:array[0..50,0..65000]of longint;
    ln:array[0..50]of link;
    ans,m,p,pp,t,w,x,y,o,i,j,k,z,n:longint;
    q,qq:link;
function cost(id,x,y:longint):longint;
var i,t:longint;
 q:link;
begin
q:=ln[id];
t:=0;
while q<>nil do
 begin
   if ((q^.st<x)and(y<q^.en))or
      ((q^.st>x)and(y>q^.en))or
       (y=q^.en) then
       inc(t);
  q:=q^.next;
 end;
cost:=t;
end;
begin

readln(n,m);
for i:=1 to m do
 begin
  o:=0;
  readln(x,y,z);
  new(q);
  o:=o+y mod 100;
  y:=y div 100;
  o:=o+60*(y mod 100);
  y:=y div 100;
  o:=o+60*60*y;
  q^.st:=o-21600;
  q^.en:=o+z-21600;
  q^.next:=ln[x];
  ln[x]:=q;
 end;
 fillchar(dp,sizeof(dp),63);
 dp[1,0]:=0;
 x:=0;
 y:=0;
 t:=0;
 w:=0;
 for i:=2 to n do
  begin
   x:=x+300;y:=y+600;
   for j:=x to y do
     begin
     if j-300>w then p:=w else p:=j-300;
     if j-600<t then pp:=t else pp:=j-600;
      for z:=pp to p do
       begin
       if dp[i-1,z]+cost(i-1,z,j)<dp[i,j] then
         dp[i,j]:=cost(i-1,z,j)+dp[i-1,z];
       if dp[i,j]=0 then break;
       end;
     end;
  t:=x;
  w:=y;
  end;
  ans:=maxlongint;
for i:=x to y do
if dp[n,i]<ans then
begin
 ans:=dp[n,i];
 k:=i;
end;
writeln(ans);
k:=k+21600;
y:=k div 3600;
k:=k-y*3600 ;
if y<10 then
write('0',y)
else write(y);
y:=k div 60;
k:=k-y *60;
if y<10 then
write('0',y)
else write(y);
if k<10 then
writeln('0',k)
else  writeln(k);
end.
