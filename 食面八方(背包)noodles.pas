program noodles;
var dat:array[0..10001,1..2]of longint;
      f:array[0..10001]of integer;
     dp:array[0..10001]of longint;
   x,y,i,j,k,n,m,v:longint;

function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;

function get(i:longint):longint;
begin
if f[i]=i then exit(i)
else
 begin
  f[i]:=get(f[i]);
  exit(f[i]);
 end;
end;

begin
assign(input,'noodles.in');reset(input);
assign(output,'noodles.out');rewrite(output);
readln(n,m,v);
for i:=1 to n do
 begin
 readln(x,y);
 dat[i,1]:=x;
 dat[i,2]:=y;
 f[i]:=i;
 end;
for i:=1 to m do
 begin
 readln(x,y);
 x:=get(x);
 y:=get(y);
 f[x]:=y;
 if x<>y then
 begin
 dat[y,1]:=dat[x,1]+dat[y,1];
 dat[y,2]:=dat[x,2]+dat[y,2];
 end;
 end;
 for i:=1 to n do
 if f[i]=i then
 for j:=v downto dat[i,1] do
 dp[j]:=max(dp[j],dp[j-dat[i,1]]+dat[i,2]);

 writeln(dp[v]);
close(output);
end.