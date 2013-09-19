program heart;
var a,b:Array[0..251,0..251]of longint;
    r,ans,x,y,z,i,j,k,n,m:longint;
begin
assign(input,'heart.in');reset(input);
assign(output,'heart.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to n do
a[i,j]:=100000000;
for i:=1 to m do
  begin
   readln(x,y,z);
   a[x,y]:=z;
   a[y,x]:=z;
  end;
  b:=a;
  ans:=maxlongint;
for k:=1 to n do
begin
for i:=1 to n do
for j:=1 to n do
begin
if (i<>j)and(i<>k)and(k<>j)then
if ans> a[i,j]+b[i,k]+b[k,j] then
   ans:=a[i,j]+b[i,k]+b[k,j];
if  a[i,j]> a[i,k]+a[k,j] then
     a[i,j]:=a[i,k]+a[k,j];
end;
end;
if ans>=100000000 then
 writeln('He will never come back.')
 else writeln(ans);
 close(output);
end.
