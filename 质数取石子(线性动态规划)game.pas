program game;
var pr:Array[0..5000]of longint;
    dp:array[0..20000]of longint;
    ind:array[0..11]of integer;
    b:array[0..20000]of boolean;
  x, t,i,j,k,n,m:longint;
   flag:boolean;
begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
pr[1]:=2;
t:=1;
for i:=3 to 20000 do
  begin
  flag:=true;
   for j:=2 to trunc(sqrt(i)) do
    if i mod j= 0 then
      begin
      flag:=false;
      break;
      end;
 if flag then
   begin
   t:=t+1;
   pr[t]:=i;
   end;
  end;
  readln(n);
for i:=1 to n do
 begin
 readln(ind[i]);
 if ind[i]>m then m:=ind[i];
 end;
 fillchar(b,sizeof(b),true);
 b[1]:=false;
 b[0]:=false;
 dp[1]:=0;
 dp[0]:=0;
for i:=2 to m do
  begin
  dp[i]:=maxlongint;
  for j:=1to t  do
   begin
   if (i-pr[j]>=0)then
     if (b[i-pr[j]]=false)and(dp[i-pr[j]]+1<dp[i]) then
       dp[i]:=dp[i-pr[j]]+1;
   if i-pr[j]<0 then break;
   end;
  if dp[i]=maxlongint then
    begin
    dp[i]:=0;
   for j:=1 to t do
   if (i-pr[j]>=0) then
     if (b[i-pr[j]]) and(dp[i-pr[j]]+1>dp[i]) then
      dp[i]:=dp[i-pr[j]]+1;
     b[i]:=false;
    end;
  end;
for i:=1 to n do
 begin
 if b[ind[i]]=false then writeln(-1)
 else writeln(dp[ind[i]]);
 end;
 close(output);
end.
