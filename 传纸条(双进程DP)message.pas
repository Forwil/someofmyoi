program message;
var tab:Array[0..51,0..51]of longint;
    dp:Array[0..101,0..51,0..51]of longint;
   z,x,y,i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
begin
assign(input,'message.in');reset(input);
assign(output,'message.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(tab[i,j]);
 if j=m then readln;
 end;

for i:=2 to n+m-2 do
 begin
  if i<=n then y:=i
  else y:=n;
  if i<=m then x:=1
  else x:=i-m+1;

 for j:=x to y do
 for z:=x to y do
 if j<>z then
  begin
  dp[i,j,z]:=max(dp[i,j,z],dp[i-1,j,z]);
  dp[i,j,z]:=max(dp[i,j,z],dp[i-1,j-1,z-1]);
  if j-1<>z then
  dp[i,j,z]:=max(dp[i,j,z],dp[i-1,j-1,z]);
  if z-1<>j then
  dp[i,j,z]:=max(dp[i,j,z],dp[i-1,j,z-1]);
  inc(dp[i,j,z],tab[j,i-j+1]+tab[z,i-z+1]);
  end;
 end;
 writeln(dp[n+m-2,n-1,n]);
 close(output);
end.
