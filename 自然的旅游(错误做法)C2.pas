program c;
var tab:array[0..1000,0..1000]of longint;
    dp:array[0..1000,0..1000]of longint;
    min,w,i,j,k,n,m:longint;
begin
assign(input,'c.in');reset(input);
assign(output,'c.out');rewrite(output);
readln(m,n,k,w);
for i:=1 to n do
for j:=1 to m do
read(tab[i,j]);

min:=maxlongint;
fillchar(dp,sizeof(dp),$7f);
for i:=1 to n do
begin
dp[1,i]:=tab[i,1];
if dp[1,i]<min then
 min:=dp[1,i];
end;

for i:=2 to m do
begin
 for j:=1 to n do
  begin
   dp[i,j]:=dp[i-1,j]+tab[j,i];
   if min+w+tab[j,i]<dp[i,j] then dp[i,j]:=min+w+tab[j,i];
  end;
  min:=maxlongint;
 for j:=1 to n do
   if dp[i,j]<min then
   min:=dp[i,j];
end;
writeln(min);
close(output);
end.
