program skill;
var sum:Array[0..52,0..52]of longint;
    dp:array[0..52,0..52,0..502]of longint;
   ans,y,s,z,o,i,j,k,n,m,x:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'skill.in');reset(input);
assign(output,'skill.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
 x:=i;
 y:=1;
  for j:=1 to n-i+1 do
  begin
  read(z);
  sum[x,y]:=sum[x,y+1]+z;
  x:=x+1;
  y:=y+1;
  end;
end;

dp[1,1,1]:=sum[1,1];

for i:=2 to n do
for j:=1 to i+2 do
for o:=(i-j)*(i-j+1) div 2 to m do
if o+(i-j+1)<=m then
begin
 dp[i,j,o+(i-j+1)]:=dp[i,j-1,o+(i-j+1)];
 dp[i,j,o+(i-j+1)]:=max(dp[i,j,o+(i-j+1)],dp[i-1,j,o]+sum[i,j]);
if o+(i-j+1)=m then
 ans:=max(ans,dp[i,j,o+(i-j+1)]);
end;
writeln(ans);
close(output);
end.
