
program d;
 var ind:array[0..100000]of longint;
     id:array[0..100000]of longint;
     ans:array[0..100000,1..2]of longint;
   i,j,k,n,m,m1,l1,t,tot,w:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
procedure kuaipai(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1];
repeat
 while z<ind[y] do dec(y);
 while z>ind[x] do inc(x);
 if x<=y then
 begin
 ind[0]:=ind[x];ind[x]:=ind[y];ind[y]:=ind[0];
  id[0]:= id[x]; id[x]:= id[y]; id[y]:= id[0];
  inc(x);dec(y);
 end;
until x>y;
if i<y then kuaipai(i,y);
if x<j then kuaipai(x,j);
end;
begin
assign(input,'d.in');
reset(input);
assign(output,'d.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
begin
 read(ind[i]);
 ans[i,1]:=-maxlongint;
 ans[i,2]:=maxlongint;
 id[i]:=i;
end;
kuaipai(1,n);
for i:=n downto 1  do
begin
 for j:=max(1,id[i]-k+1) to min(n-k+1,id[i]) do
  if ind[i]>ans[j,1] then
  begin
  if ans[j,1]=-maxlongint then tot:=tot+1;
  ans[j,1]:=ind[i];
  end;
  if tot=n-k+1 then break;
end;
tot:=0;
for i:=1 to n do
begin
  for j:=max(1,id[i]-k+1) to min(n-k+1,id[i]) do
  if ind[i]<ans[j,2] then
  begin
  if ans[j,2]=maxlongint then tot:=tot+1;
  ans[j,2]:=ind[i];
  end;
  if tot=n-k+1 then break;
end;
for i:=1 to n-k+1 do
 writeln(ans[i,1],' ',ans[i,2]);
 close(output);
end.
