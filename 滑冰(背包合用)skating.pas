program skating;
var dp:array[0..101]of longint;
    bag:Array[0..101,0..10001]of longint;
   food:Array[0..101,0..2]of longint;
    ex:array[0..101,1..3]of longint;
  y,mm,x,ans,z,i,j,k,n,m,a,b:longint;

function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;

begin
assign(input,'skating.in');reset(input);
assign(output,'skating.out');rewrite(output);
readln(a,b,m,n);
for i:=1 to m do
 read(food[i,0],food[i,1],food[i,2]);
for i:=1 to n do
 read(ex[i,1],ex[i,2],ex[i,3]);

for i:=1 to m do
for z:=a downto 0 do
for j:=0 to food[i,0] do
if j*food[i,1]+z<=a then
 dp[z+food[i,1]*j]:=max(dp[z+food[i,1]*j],dp[z]+food[i,2]*j);

for i:=0 to a do
mm:=max(mm,dp[i]);
mm:=mm+b;
for i:=1 to n do
for j:=0 to a-ex[i,1] do
for z:=0 to mm-ex[i,2] do
begin
x:=j+ex[i,1];
y:=z+ex[i,2];
bag[x,y]:=max(bag[x,y],bag[j,z]+ex[i,3]);
end;

for i:=0 to a do
for j:=0 to mm do
if dp[i]+b-j>=0 then
  ans:=max(ans,bag[a-i,j]);
writeln(ans);
close(output);
end.
