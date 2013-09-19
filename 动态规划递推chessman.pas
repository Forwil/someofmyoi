program chessman;
var dp:array[0..50,0..50]of qword;
    z,i,j,k,n,m:longint;
    ans:qword;
begin
assign(input,'chessman.in');reset(input);
assign(output,'chessman.out');rewrite(output);
readln(n,m);
for j:=1 to m+1 do
  dp[1,j]:=1;
for i:=2 to n do
for j:=1 to m+1 do
for z:=j to m+1 do
dp[i,j]:=dp[i,j]+dp[i-1,z];
for j:=1 to m+1 do
ans:=ans+dp[n,j];
writeln(ans);
close(output);
end.
