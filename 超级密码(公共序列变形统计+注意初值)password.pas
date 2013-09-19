program password;
var  s1,s2:ansistring;
     dp:array[0..1,0..2001]of longint;
     scs:array[0..2001,0..2001]of longint;
    i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a<b then max:=b else max:=a;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'password.in');
reset(input);
assign(output,'password.out');
rewrite(output);
readln(s1);
readln(s2);
fillchar(dp,sizeof(dp),0);
for j:=0 to length(s2) do
begin
 dp[0,j]:=1;
 scs[0,j]:=j;
end;
dp[1,0]:=1;
for j:=0 to length(s1) do
begin
 scs[j,0]:=j;
end;
for i:=1 to length(s1) do
for j:=1 to length(s2)  do
if s1[i]=s2[j] then scs[i,j]:=scs[i-1,j-1]+1
else scs[i,j]:=min(scs[i-1,j],scs[i,j-1])+1;

for i:=1 to length(s1) do
for j:=1 to length(s2) do
 if s1[i]=s2[j] then
    dp[i and 1,j]:=dp[(i-1)and 1,j-1]
 else
begin
  if (scs[i,j]=scs[i,j-1]+1)and(scs[i,j]<>scs[i-1,j]+1) then
      dp[i and 1,j]:=dp[i and 1,j-1]
  else
  if (scs[i,j]=scs[i-1,j]+1)and(scs[i,j]<>scs[i,j-1]+1) then
       dp[i and 1,j]:=dp[(i-1)and 1 ,j]
   else
   dp[i and 1,j]:=(dp[(i-1) and 1,j]+dp[i and 1,j-1]) mod 1000000007;
end;
  writeln(dp[length(s1) and 1,length(s2)]);
close(output);
end.
