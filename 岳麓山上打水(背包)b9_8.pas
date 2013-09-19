program b9_8;
var ind:array[0..101]of longint;
   //  dp:array[0..20001]of longint;
     p:array[0..20001]of integer;
     a:array[0..2000]of longint;
     t,i,j,k,n,m,v,r,o:longint;
procedure out;
var i:longint;
begin
write(r,' ');
for i:=1 to r-1 do
write(ind[a[i]],' ');
writeln(ind[a[r]]);
halt;
end;
procedure pan;
var i,j,z:longint;
    d:array[0..20001]of boolean;
begin
fillchar(d,sizeof(d),false);
z:=0;
for i:=1 to r do
z:=z+ind[a[i]];
d[z]:=true;
for i:=1 to r do
for j:=0 to v do
if j+ind[a[i]]<=v then
if d[j]=true then d[j+ind[a[i]]]:=true;

if d[v] then out;
end;
procedure dfs(y,z:longint);
var i:longint;
begin
if z<=r then
for i:=y to n-(r-z) do
  begin
  a[z]:=i;
  dfs(i+1,z+1);
  end
else pan;
end;
begin
assign(input,'b.in');reset(input);
readln(v);
readln(n);
for i:=1 to n do
 readln(ind[i]);

for i:=1 to n do
for j:=i+1 to n do
if ind[i]>ind[j] then
  begin
  ind[0]:=ind[i];
  ind[i]:=ind[j];
  ind[j]:=ind[0];
  end;
{fillchar(dp,sizeof(dp),63);
r:=dp[0];
dp[0]:=0;
for i:=1 to n do
for j:=0 to v do
if (dp[j]<>R)and(j+ind[i]<=v)  then
begin
 if i=p[j] then
  begin
  if dp[j]<dp[j+ind[i]] then
    begin
    dp[j+ind[i]]:=dp[j];
     p[j+ind[i]]:=i;
    end;
  end
else
  if dp[j]+1<dp[j+ind[i]] then
   begin
   dp[j+ind[i]]:=dp[j]+1;
    p[j+ind[i]]:=i;
   end;
end;}
for r:=1 to 10 do
dfs(1,1);
end.
