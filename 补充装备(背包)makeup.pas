program makeup;
var dp:Array[0..1000]of longint;
   v,s,q:array[0..400]of longint;
   i,j,k,n,m,z:longint;
begin
assign(input,'makeup.in');reset(input);
assign(output,'makeup.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 readln(v[i],s[i],q[i]);

for i:=1 to n do
for j:=v[i] to m do
 begin
 if dp[j]< dp[j-v[i]]+s[i] then
    dp[j]:=dp[j-v[i]]+s[i];
  if j div v[i]>=5 then
  for z:=5 to j div v[i] do
  if j-v[i]*z-q[i]*z>=0 then
  if dp[j]< dp[j-v[i]*z-q[i]*z]+s[i]*z+q[i]*z then
     dp[j]:=dp[j-v[i]*z-q[i]*z]+s[i]*z+q[i]*z;
 end;
 writeln(dp[m]);
 close(output);
end.
