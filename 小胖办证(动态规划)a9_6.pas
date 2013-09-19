program a9_6;
var dp:Array[0..101,0..501]of int64;
    p:Array[0..101,0..501,1..2]of integer;
    tab:Array[0..101,0..501]of longint;
    out:array[0..1200]of integer;
   x,y,i,j,k,l,n,m,t:longint;
   min:int64;
begin
assign(input,'a.in');reset(input);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
  begin
   read(tab[i,j]);
  end;

for i:=1 to n do
 begin
  for j:=1 to m do
   begin
   dp[i,j]:=dp[i-1,j]+tab[i,j];
   p[i,j,1]:=i-1;
   p[i,j,2]:=j;
   end;

   for j:=2 to m do
   if dp[i,j-1]+tab[i,j]<dp[i,j] then
      begin
      dp[i,j]:=dp[i,j-1]+tab[i,j];
      p[i,j,1]:=i;
      p[i,j,2]:=j-1;
      end;

  for j:=m-1 downto 1 do
   if dp[i,j+1]+tab[i,j]<dp[i,j] then
      begin
      dp[i,j]:=dp[i,j+1]+tab[i,j];
      p[i,j,1]:=i;
      p[i,j,2]:=j+1;
      end;

 end;

min:=dp[n,1];
y:=1;
for i:=2 to m do
if dp[n,i]<min then
   begin
   min:=dp[n,i];
   y:=i;
   end;
t:=0;
x:=n;
repeat
t:=t+1;
out[t]:=y;
k:=y;
l:=x;
x:=p[l,k,1];
y:=p[l,k,2];
until (x=0);
for i:=t downto 1 do
writeln(out[i]);
end.
