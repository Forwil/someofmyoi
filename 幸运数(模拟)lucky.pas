program lucky;
var dat:array[0..35]of integer;
     dp:array[0..10001]of boolean;
    min,i,j,k,n,m,t:longint;
begin
assign(input,'lucky.in');reset(input);
assign(output,'lucky.out');rewrite(output);
readln(n,m);
min:=maxlongint;
for i:=1 to n do
begin
read(dat[i]);
dp[dat[i]]:=true;
end;

for i:=1 to n do
for j:=1 to m div dat[i] do
 dp[dat[i]*j]:=dp[dat[i]*j]or dp[j];

for i:=1 to m do
if dp[i]then inc(t);

if t<>0 then
begin
writeln(t);
for i:=1 to m do
if dp[i]then
begin
t:=t-1;
if t>0 then
 write(i,' ')
else writeln(i);
end;
end else writeln('No answer!');
close(output);
end.
