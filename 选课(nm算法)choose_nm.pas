program choose_nm;
var dp:Array[0..1002,0..1002]of longint;
    c,v,z:array[0..1002]of integer;
    son:Array[0..1002,0..1002]of integer;
    p:array[0..100,0..100]of set of byte;
   t,f,i,j,k,n,m:longint;

procedure go(x:longint);
var i,nn:longint;
begin
t:=t+1;
z[t]:=x;
nn:=c[x];
for i:=1 to nn do go(son[x,i]);
for i:=1 to nn do c[x]:=c[x]+c[son[x,i]];
end;

begin
assign(input,'choose.in');reset(input);
assign(output,'choose.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
readln(f,v[i]);
inc(c[f]);
son[f,c[f]]:=i;
end;
go(0);
for i:=n+1 downto 1 do
if not((i<>1)and(z[i]=0)) then
for j:=1 to m+1 do
if dp[z[i+1],j-1]+v[z[i]]>dp[z[i+c[z[i]]+1],j] then
 begin
 dp[z[i],j]:=dp[z[i+1],j-1]+v[z[i]];
 if n<=99 then  p[z[i],j]:=p[z[i+1],j-1]+[z[i]];
 end
else
 begin
 dp[z[i],j]:=dp[z[i+c[z[i]]+1],j];
 if n<=99 then  p[z[i],j]:=p[z[i+c[z[i]]+1],j];
 end;
writeln(dp[0,m+1]);
if n<=99 then
for i:=1 to n do
if i in p[0,m+1] then writeln(i);
close(output);
end.
