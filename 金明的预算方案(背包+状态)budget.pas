program budget;
var dp:Array[0..33000]of longint;
    ind:array[0..61,1..2]of longint;
    p:array[0..61,0..2]of integer;
    i,j,k,n,m,mon,x,ans:longint;
begin
assign(input,'budget.in');reset(input);
assign(output,'budget.out');rewrite(output);
readln(mon,n);
for i:=1 to n do
 begin
  readln(ind[i,1],ind[i,2],x);
  if x<>0 then
   if p[x,1]=0 then p[x,1]:=i
   else p[x,2]:=i;
 if x=0 then  p[i,0]:=i;
 end;
 m:=0;
for i:=1 to n do
if p[i,0]<>0 then
 for j:=m downto 0 do
  if (dp[j]>0)or(j=0) then
  begin
    k:=j+ind[p[i,0],1];
    if k<=mon then
     begin
     if dp[k]<dp[j]+ind[p[i,0],1]*ind[p[i,0],2] then
      dp[k]:=dp[j]+ind[p[i,0],1]*ind[p[i,0],2];
     if dp[k]>ans then ans:=dp[k];
     end;
    if (k>m)and(k<=mon) then m:=k;
{------------}
    k:=j+ind[p[i,0],1]+ind[p[i,1],1];
  if (p[i,1]<>0)and(k<=mon) then
      begin
     if dp[k]<dp[j]+ind[p[i,0],1]*ind[p[i,0],2]
                   +ind[p[i,1],1]*ind[p[i,1],2] then
       dp[k]:=dp[j]+ind[p[i,0],1]*ind[p[i,0],2]
                   +ind[p[i,1],1]*ind[p[i,1],2];
      if dp[k]>ans then ans:=dp[k];
      end;
    if (k>m)and(k<=mon) then m:=k;
{------------}
     k:=j+ind[p[i,0],1]+ind[p[i,2],1];
    if (p[i,2]<>0)and(k<=mon) then
     begin
     if dp[k]<dp[j]+ind[p[i,0],1]*ind[p[i,0],2]
                   +ind[p[i,2],1]*ind[p[i,2],2] then
       dp[k]:=dp[j]+ind[p[i,0],1]*ind[p[i,0],2]
                   +ind[p[i,2],1]*ind[p[i,2],2];
     if dp[k]>ans then ans:=dp[k];
     end;
    if (k>m)and(k<=mon) then m:=k;
{-------------}
     k:=j+ind[p[i,0],1]+ind[p[i,1],1]+ind[p[i,2],1];
    if (p[i,1]<>0)and(p[i,2]<>0)and(k<=mon)then
      begin
     if dp[k]<dp[j]+ind[p[i,0],1]*ind[p[i,0],2]
                   +ind[p[i,1],1]*ind[p[i,1],2]
                   +ind[p[i,2],1]*ind[p[i,2],2]then
       dp[k]:=dp[j]+ind[p[i,0],1]*ind[p[i,0],2]
                   +ind[p[i,1],1]*ind[p[i,1],2]
                   +ind[p[i,2],1]*ind[p[i,2],2];
      if dp[k]>ans then ans:=dp[k];
      end;
        if (k>m)and(k<=mon) then m:=k;
   end;
writeln(ans);
close(output);
end.