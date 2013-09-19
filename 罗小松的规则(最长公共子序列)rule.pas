program rule;
var dp:Array[0..500,0..500]of longint;
    ln:Array['A'..'z','A'..'z']of boolean;
   a,b:ansistring;
  ans1,ans2,i,j,k,n,m:longint;
  x,y:char;

function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;

begin
assign(input,'rule.in');reset(input);
assign(output,'rule.out');rewrite(output);
readln(m);
for i:=1 to m do
begin
read(x);
read(y);
while y=' ' do read(y);
readln;
ln[x,y]:=true;
end;

readln(a);
readln(b);
n:=length(a);
m:=length(b);
for i:=1 to n do
for j:=1 to m do
if ln[a[i],b[j]] then dp[i,j]:=dp[i-1,j-1]+1
else dp[i,j]:=max(dp[i,j-1],dp[i-1,j]);
ans1:=dp[n,m];
fillchar(dp,sizeof(dp),0);
for i:=1 to m do
for j:=1 to n do
if ln[b[i],a[j]] then dp[i,j]:=dp[i-1,j-1]+1
else dp[i,j]:=max(dp[i,j-1],dp[i-1,j]);
ans2:=dp[m,n];
writeln(ans1,' ',ans2);
close(output);
end.
