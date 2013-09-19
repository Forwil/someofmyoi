program book;
var dp:Array[0..101,0..101,0..101]of longint;
    a,b,c:array[0..101]of longint;
    z,ta,tb,tc,i,j,k,n,m,x:longint;

function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;

begin
assign(input,'book.in');reset(input);
assign(output,'book.out');rewrite(output);
readln(ta,tb,tc);
for i:=1 to ta do
read(a[i]);readln;
for i:=1 to tb do
read(b[i]);readln;
for i:=1 to tc do
read(c[i]);readln;
for i:=ta downto 0 do
for j:=tb downto 0 do
for z:=tc downto 0 do
 begin
 x:=ta+tb+tc-i-j-z;
 dp[i,j,z]:=max(dp[i,j,z],dp[i+1,j,z]+a[i+1]*x);
 dp[i,j,z]:=max(dp[i,j,z],dp[i,j+1,z]+b[j+1]*x);
 dp[i,j,z]:=max(dp[i,j,z],dp[i,j,z+1]+c[z+1]*x);
 end;
writeln(dp[0,0,0]);
close(output);
end.