program c9_18;
var ind:array[0..102,1..2]of longint;
    o,x,y,l,r,u,d,t,i,j,k,n,m,ans:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a end;
begin
assign(input,'cricket.in');reset(input);
assign(output,'cricket.out');rewrite(output);
readln(t,n,m);
for i:=1 to t do
 readln(ind[i,1],ind[i,2]);

t:=t+1;
ind[t,1]:=0;
ind[t,2]:=0;
t:=t+1;
ind[t,1]:=n;
ind[t,2]:=m;
for i:=1 to t do
for j:=i+1 to t do
 if ind[i,2]>ind[j,2] then
   begin
   ind[0]:=ind[i];
   ind[i]:=ind[j];
   ind[j]:=ind[0];
   end;
for i:=1 to  t do
begin
u:=0;
d:=n;
l:=ind[i,2];
 for j:=i+1 to t do
  begin
  r:=ind[j,2];
  o:=min((r-l),(d-u));
  if o>ans then
   begin
   ans:=o;
   x:=(l+r)shr 1;
   y:=(u+d)shr 1;
   end;
  if (ind[j,1]>u)and(ind[j,1]<=ind[i,1]) then
     u:=ind[j,1];
  if (ind[j,1]<d)and(ind[j,1]>=ind[i,1]) then
     d:=ind[j,1];
  if u=d then break;
  end;
end;

for i:=t downto 1 do
begin
u:=0;
d:=n;
r:=ind[i,2];
 for j:=i-1 downto 1  do
  begin
  l:=ind[j,2];
  o:=min((r-l),(d-u));
  if o>ans then
   begin
   ans:=o;
   x:=(l+r)shr 1;
   y:=(u+d)shr 1;
   end;
  if (ind[j,1]>u)and(ind[j,1]<=ind[i,1]) then
     u:=ind[j,1];
  if (ind[j,1]<d)and(ind[j,1]>=ind[i,1]) then
     d:=ind[j,1];
  if u=d then break;
  end;
end;

for i:=1 to t do
for j:=i+1 to t do
 if ind[i,1]>ind[j,1] then
  begin
  ind[0]:=ind[i];
  ind[i]:=ind[j];
  ind[j]:=ind[0];
  end;

for i:=2 to t do
 begin
 o:=min(m,ind[i,1]-ind[i-1,1]);
 if o>ans then
  begin
  ans:=o;
  x:=(ind[i-1,1]+ind[i,1])shr 1;
  y:=m shr 1;
  end;
 end;
writeln(x,' ',y,' ',ans);
close(output);
end.
