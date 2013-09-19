program abrac;
var dp:Array[0..600,0..600]of longint;
     p:array[0..600,0..600]of longint;
    a,b:array[0..600]of longint;
  z,tt,t,i,j,k,n,m:longint;
begin
assign(input,'abrac.in');reset(input);
assign(output,'abrac.out');rewrite(output);
readln(t);
for tt:=1 to t do
begin
read(n);
for i:=1 to n do
 read(a[i]);
readln;
read(m);
for i:=1 to m do
 read(b[i]);
 readln;
 fillchar(p,sizeof(p),0);
 for i:=1 to n do
 for j:=1 to m do
 if a[i]=b[j]then p[i,j]:=j
 else p[i,j]:=p[i,j-1];
 fillchar(dp,sizeof(dp),0);
 for i:=1 to n do
 for j:=1 to m do
  begin
  if dp[i-1,j]>dp[i,j-1] then dp[i,j]:=dp[i-1,j]
  else dp[i,j]:=dp[i,j-1];

  if a[i]=b[j]then
   begin
   dp[i,j]:=1;
    for z:=i-1 downto 1 do
     if (a[z]<a[i])and(dp[i,j]<dp[z,p[z,j-1]]+1)then
       dp[i,j]:=dp[z,p[z,j-1]]+1;
   end;
  end;
writeln(dp[n,m]);
end;
close(output);
end.
