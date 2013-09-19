program b9_16;
var dp:Array[0..1,0..3,0..3,0..3,0..3]of longint;
   ans,z,o,i,j,k,n,m,x,y,l,now,last:longint;
   ch:char;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function pa(a,b,c:longint):longint;
var su:set of 1..3;
 i,z:longint;
begin
su:=[];
if a<>0 then su:=su+[a];
if b<>0 then su:=su+[b];
if c<>0 then su:=su+[c];
z:=0;
for i:=1 to 3 do
 if i in su then inc(z);
 exit(z);
end;
begin
assign(input,'b.in');reset(input);
readln(n);
read(ch);
case ch of
'M':x:=1;
'B':x:=2;
'F':x:=3;
end;
read(ch);
case ch of
'M':y:=1;
'B':y:=2;
'F':y:=3;
end;
if x=y then
begin
dp[0,y,x,0,0]:=2;
dp[0,0,0,y,x]:=2;
end
else
begin
dp[0,y,x,0,0]:=3;
dp[0,0,0,y,x]:=3;
end;
dp[0,x,0,y,0]:=2;
dp[0,y,0,x,0]:=2;
for i:=3 to n do
 begin
 now:=i and 1;
 last:=1- now;
 for j:=0 to 3 do
 for z:=0 to 3 do
 for o:=0 to 3 do
 for k:=0 to 3 do
 dp[now,j,z,o,k]:=0;
  read(ch);
  case ch of
  'M':x:=1;
  'B':x:=2;
  'F':x:=3;
  end;
  for j:=1 to 3 do
  for z:=0 to 3 do
  begin
  m:=pa(x,j,z);
   for o:=0 to 3 do
   for k:=0 to 3 do
   begin
    if dp[last,j,z,o,k]>0 then
    dp[now,x,j,o,k]:=max(dp[now,x,j,o,k],dp[last,j,z,o,k]+m);
   if dp[last,o,k,j,z]>0 then
    dp[now,o,k,x,j]:=max(dp[now,o,k,x,j],dp[last,o,k,j,z]+m);
   end;
  end;
end;
for i:=0 to 3 do
for j:=0 to 3 do
for o:=0 to 3 do
for k:=0 to 3 do
if dp[n and 1,i,j,o,k]>ans then
 ans:=dp[n and 1,i,j,o,k];
 writeln(ans);
end.
