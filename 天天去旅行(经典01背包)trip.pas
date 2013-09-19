program trip;
var dp:array[0..1001]of longint;
    v,m:array[0..101]of longint;
   i,j,k,n,mm:longint;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
begin
assign(input,'trip.in');reset(input);
assign(output,'trip.out');rewrite(output);
readln(n,mm);
for i:=1 to n do
 readln(v[i],m[i]);
for i:=1 to n do
for j:=mm downto v[i] do
  dp[j]:=max(dp[j],dp[j-v[i]]+m[i]);
writeln(dp[mm]);
close(output);
end.
