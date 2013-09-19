program party;
var a,b:array[0..1001]of longint;
    la,lb:array[0..1001,0..1001]of longint;
    pass:array[0..1001]of boolean;
  ans,min,o,x,y,z,i,j,k,n,m,r:longint;
begin
assign(input,'party.in');reset(input);
assign(output,'party.out');rewrite(output);
readln(n,m,o);
fillchar(la,sizeof(la),63);
fillchar(lb,sizeof(lb),63);
r:=la[0,0];
for i:=1 to m do
 begin
 readln(x,y,z);
 if (la[x,y]=r)or(z>la[x,y]) then
  begin
  la[x,y]:=z;
  lb[y,x]:=z;
  end;
 end;

fillchar(a,sizeof(a),63);
a[o]:=0;
for i:=1 to n do
 begin
  min:=maxlongint;k:=0;
  for j:=1 to n do
  if not(pass[j])and(a[j]<min) then
   begin
   min:=a[j];
   k:=j;
   end;
  pass[k]:=true;
  for j:=1 to n do
  if (la[k,j]<>R)and(not pass[j])and(a[j]>min+la[k,j]) then
   a[j]:=min+la[k,j];
 end;

fillchar(pass,sizeof(pass),false);
fillchar(b,sizeof(b),63);
b[o]:=0;
for i:=1 to n do
 begin
  min:=maxlongint;k:=0;
  for j:=1 to n do
  if not(pass[j])and(b[j]<min) then
   begin
   min:=b[j];
   k:=j;
   end;
  pass[k]:=true;
  for j:=1 to n do
  if (lb[k,j]<>R)and(not pass[j])and(b[j]>min+lb[k,j]) then
   b[j]:=min+lb[k,j];
 end;

for i:=1 to n do
if (i<>o)and(a[i]+b[i]>ans) then ans:=a[i]+b[i];
writeln(ans);

close(output);
end.