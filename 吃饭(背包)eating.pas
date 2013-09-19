program eating;
var dp:array[0..1001,0..1001,1..2]of longint;
    dat:array[0..100,1..3]of longint;
 tt,l,z,i,j,k,n,m,v,x,y:longint;
begin
assign(input,'eating.in');reset(input);
assign(output,'eating.out');rewrite(output);
readln(n,m,v);
for i:=1 to n do
readln(dat[i,1],dat[i,2],dat[i,3]);

for i:=1 to n do
for j:=0 to m-dat[i,1] do
for z:=0 to v-dat[i,2] do
begin
 x:=j+dat[i,1];
 y:=z+dat[i,2];
for l:=1 to 2 do
 begin
 tt:=dp[j,z,l]+dat[i,3];
 if tt>dp[x,y,1] then
  begin
  dp[x,y,2]:=dp[x,y,1];
  dp[x,y,1]:=tt;
  end
 else if (tt<>dp[x,y,1])and(tt>dp[x,y,2]) then
       dp[x,y,2]:=tt;
 end;
end;
 if dp[m,v,2]<>0 then
writeln(dp[m,v,2])
else writeln('error');
close(output);
end.