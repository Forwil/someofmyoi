program n1002;
var ind:Array[0..101]of longint;
    dp:array[0..1000001]of longint;
    b:array[0..1000001]of boolean;
    r:array[0..1000001]of boolean;
    ans,now,last,s,e,i,j,k,n,m,l:longint;
begin
readln(l);
readln(e,s,n);
for i:=1 to n do
read(ind[i]);
for i:=1 to n do
for j:=i+1 to n do
if ind[i]>ind[j] then
  begin
  ind[0]:=ind[i];
  ind[i]:=ind[j];
  ind[j]:=ind[0];
  end;
if s=e then
 begin
 for i:=1 to n do
  if ind[i] mod s =0 then  inc(ans);
  writeln(ans);
  halt;
 end;
  ind[0]:=0;
  last:=0;
  ind[n+1]:=maxlongint;
for i:=1 to n+1 do
if ind[i]<=l then
begin
  k:=ind[i]-ind[i-1];
  if k>(s*10) then
   begin
   k:=last+10*s+k mod (s*10);
   now:=k;
   end
  else
   begin
   k:=last+k;
   now:=k;
   end;
 last:=now;
 b[now]:=true;
end
else break;
l:=lst+100;
fillchar(dp,sizeof(dp),63);
r[0]:=true;
dp[0]:=0;
for i:=0 to l+10*s do
if r[i] then
  for j:=i+e to i+s do
    if (b[j])and(dp[i]+1<dp[j]) then
      begin
      dp[j]:=dp[i]+1;
      r[j]:=true;
      end
   else
    if (b[j]=false)and(dp[i]<dp[j]) then
      begin
      dp[j]:=dp[i];
      r[j]:=true;
      end;
      ans:=maxlongint;
for i:=l to l+10*s do
 if r[i] and(dp[i]<ans) then ans:=dp[i];
writeln(ans);
end.
