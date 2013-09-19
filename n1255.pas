program n1255;
var sum:array[0..500,0..500]of longint;
    ind:array[0..500,0..500]of integer;
    l,r,h:array[0..500]of longint;
    x,i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n,m);
for i:=1 to n do
for j:=1 to m do
begin
read(ind[i,j]);
sum[i,j]:=ind[i,j]+sum[i-1,j]+sum[i,j-1]-sum[i-1,j-1];
if j=m then readln;
end;

for i:=1 to n do
begin

 for j:=1 to m do
  begin
  if ind[i,j]<>0 then inc(h[j])
  else h[j]:=0;
  k:=j;
  while (h[k-1]>=h[j])and(k>1) do k:=l[k-1];
  l[j]:=k;
  end;
 for j:=m downto 1 do
  begin
  k:=j;
  while (h[k+1]>=h[j])and(k<m) do k:=r[k+1];
  r[j]:=k;
  if ind[i,j]<>0 then
  x:=sum[i,r[j]]-sum[i,l[j]-1]-sum[i-h[j],r[j]]+sum[i-h[j],l[j]-1]
  else x:=0;
  if x>ans then ans:=x;
  end;
 end;
 writeln(ans);
end.
