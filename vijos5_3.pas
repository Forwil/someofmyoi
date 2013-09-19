program vijos5_3;
var vi:array[0..1001]of longint;
    int:array[0..1001]of longint;
    out:array[0..1001]of longint;
   x,ans,min1,min2,s,c,l,r,i,j,k,n,m:longint;
begin
assign(input,'flower.in');
reset(input);
assign(output,'flower.out');rewrite(output);
readln(n,l,r);
for i:=1 to n do
read(int[i]);
for i:=1  to n do
read(out[i]);
for i:=1 to n do
begin
read(x);
s:=s+x;
end;
ans:=-maxlongint;
for i:=1 to n do
 begin
 min1:=-out[1];
 min2:=-out[n];
 for j:=2 to n do
 begin
  if min1<-(j-1)*r-out[j] then
    min1:=-(j-1)*r-out[j];
  if min2<-(n-j)*l-out[j] then
    min2:=-(n-j)*l-out[j];
 end;
 if -l*(n-i)-r*(n-i)-l*(i-1)+min1>-l*(i-1)-r*(i-1)-r*(n-i)+min2 then
  k:=-l*(n-i)-r*(n-i)-l*(i-1)+min1
 else
  k:=-l*(i-1)-r*(i-1)-r*(n-i)+min2;
if k-int[i]>ans then ans:=k-int[i];
end;
writeln(ans+s);
close(output);
end.
