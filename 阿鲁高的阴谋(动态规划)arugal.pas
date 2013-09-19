program arugal;
var n,b:array[0..1001]of longint;
    dp:array[0..1001,0..101]of longint;
     p:array[0..1001,0..101,1..2]of longint;
  ans,z,r,v,a,w,i,j,k,t,m:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
procedure out(x,y:longint);
begin
if x<>1 then out(x-1,p[x,y,1]);
writeln(p[x,y,2]);
end;
begin
assign(input,'arugal.in');reset(input);
assign(output,'arugal.out');rewrite(output);
 readln(t,v,a,w);
for i:=1 to t do
 readln(n[i],b[i]);
fillchar(dp,sizeof(dp),63);
r:=dp[0,0];
dp[0,0]:=0;
for i:=1 to t do
 for j:=v downto 0 do
  if dp[i-1,j]<>r then
   for z:=0 to a do
   if (j+z-n[i]>=0)and(j+z-n[i]<=v) then
   if dp[i-1,j]+z*b[i]+(j+z-n[i])*w<dp[i,j+z-n[i]] then
    begin
    dp[i,j+z-n[i]]:=dp[i-1,j]+z*b[i]+(j+z-n[i])*w;
    p[i,j+z-n[i],1]:=j;
    p[i,j+z-n[i],2]:=z;
    end;
ans:=maxlongint;
for i:=0 to v do
if ans>dp[t,i]  then
 begin
 ans:=dp[t,i];
 j:=i;
 end;
writeln(ans);
out(t,j);
close(output);
end.