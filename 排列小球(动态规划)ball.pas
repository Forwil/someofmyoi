program ball;
const co:array[1..3,1..3,1..3]of 0..40=
   (((4,12,17),(11,22,24),(27,37,30)),
    ((6,18,21),(12,3,16),(19,22,24)),
    ((10,13,7),(6,3,4),(7,15,2)));
var dp:array[0..1,1..3,1..3]of longint;
    ind:array[0..100000,1..3]of integer;
      now,last,ans,x,y,z,i,j,k,n,m:longint;
begin
assign(input,'ball.in');reset(input);
assign(output,'ball.out');rewrite(output);
readln(n);
for i:=1 to n do
 readln(ind[i,1],ind[i,2],ind[i,3]);

for i:=1 to 3 do
for j:=1 to 3 do
for z:=1 to 3 do
   if dp[1,j,i]< co[z,j,i]+ind[1,z]+ind[2,j]+ind[3,i] then
      dp[1,j,i]:=co[z,j,i]+ind[1,z]+ind[2,j]+ind[3,i];

for i:=4 to n do
 begin
 now:=i and 1;
 last:=1-now;
 for x:=1 to 3 do
 for y:=1 to 3 do
 begin
 dp[now,y,x]:=0;
  for z:=1 to 3 do
   begin
   k:=dp[last,z,y]+co[z,y,x]+ind[i,x];
   if k>dp[now,y,x] then
   dp[now,y,x]:=k;
   end;
 end;
 end;

 ans:=0;
for i:=1 to 3 do
for j:=1 to 3 do
 if dp[n and 1,j,i]>ans then
 ans:=dp[n and 1,j,i];

 writeln(ans);
 close(output);
end.