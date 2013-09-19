program a9_11;
var dp:array[0..1,-5000..5000]of longint;
    ind:array[0..1001,1..2]of longint;
    x,ans,w,s,i,j,k,n,m,r,now,last,ma,mi:longint;
begin

readln(n);
for i:=1 to n do
 begin
 readln(ind[i,1],ind[i,2]);
 s:=s+ind[i,1];
 w:=w+ind[i,2];
 end;
fillchar(dp,sizeof(dp),63);
r:=dp[0,0];
dp[0,s-w]:=0;
x:=abs(s-w);
ma:=s-w;
mi:=s-w;
ans:=0;
for i:=1 to n do
 begin
  now:=i and 1;
  last:=1- now;
  dp[now]:=dp[last];
  for j:=ma downto mi do
  if dp[last,j]<>r then
   begin
   k:=(ind[i,1]-ind[i,2])*2;
   if  dp[now,j-k]>dp[last,j]+1 then
       dp[now,j-k]:=dp[last,j]+1;


   if abs(j-k)<x then
    begin
    ans:=dp[now,j-k];
    x:=abs(j-k);
    end
   else
   if (abs(j-k)=x)and(dp[now,j-k]<ans) then
    ans:=dp[now,j-k];
  if j-k>ma then ma:=j-k;
  if j-k<mi then mi:=j-k;
   end;
 end;
writeln(ans);
end.
