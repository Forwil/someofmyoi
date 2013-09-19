program rq_4;
var min,max:array[1..9]of longint;
    d:array[0..10001,0..9]of longint;
    t:array[0..10001]of integer;
    l,z,ans,i,j,k,n,m:longint;
begin
readln(n,m);
fillchar(min,sizeof(min),$7f);
 for i:=1 to n do
 for j:=1 to m do
 begin
 read(d[i,j]);
 if d[i,j]>max[j] then max[j]:=d[i,j];
 if d[i,j]<min[j] then min[j]:=d[i,j];
 end;
 k:=0;
for i:=1 to m do
for j:=1 to n do
 if ((max[i]=d[j,i])or(min[i]=d[j,i]))and(d[j,0]=0) then
   begin
   k:=k+1;
   t[k]:=j;
   d[j,0]:=1;
   end;

for i:=1 to k do
for j:=i+1 to k do
 begin
 l:=0;
  for z:=1 to m do
  l:=l+abs(d[t[i],z]-d[t[j],z]);
  if l>ans then ans:=l;
 end;
 writeln(ans);
end.