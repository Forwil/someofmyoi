program force;
var dp:array[0..1001,0..1001]of longint;
    i,j,k,n,m,ans:longint;
    ind:array[0..1001]of longint;
function min(a,b:longint):longint;
begin if a>b then min :=b else min:=a;end;
begin
assign(input,'force.in');reset(input);
assign(output,'force.out');rewrite(output);
readln(n);
for i:=1 to n do
read(ind[i]);
fillchar(dp,sizeof(dp),$7f);
dp[1,0]:=0;
for i:=2 to n-1 do
  for j:=0 to i-2 do
   begin
   k:=abs(ind[i]-ind[i-1]);
   if dp[i,j]>dp[i-1,j]+k then
      dp[i,j]:=dp[i-1,j]+k;
   if dp[j,i]>dp[j,i-1]+k then
      dp[j,i]:=dp[j,i-1]+k;
   k:=abs(ind[i]-ind[j]);
   if j=0 then k:=0;
   if dp[i-1,i]>dp[i-1,j]+k then
      dp[i-1,i]:=dp[i-1,j]+k;
   if dp[i,i-1]>dp[j,i-1]+k then
      dp[i,i-1]:=dp[j,i-1]+k;
  end;
  ans:=maxlongint;
for i:=0 to n-2 do
 begin
 k:=abs(ind[n]-ind[i])+abs(ind[n]-ind[n-1]);
 if i=0 then k:=abs(ind[n]-ind[n-1]);
 if dp[i,n-1]+k<ans then
 ans:=dp[i,n-1]+k;
 if dp[n-1,i]+k<ans then
 ans:=dp[n-1,i]+k;
end;
writeln(ans);
close(output);
end.
