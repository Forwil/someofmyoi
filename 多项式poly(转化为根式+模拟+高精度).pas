program poly;
type node=array[0..100]of integer;
var z,zz:array[0..101]of node;
   i,j,k,n,m:longint;
function cf(s1:node;x:integer):node;
var i,j,l:longint;
begin
fillchar(cf,sizeof(cf),0);
if x=0 then
 begin
 cf[0] :=1;
 exit;
 end;
l:=s1[0];
for i:=1 to l do
 cf[i]:=s1[i]*x;

for i:=1 to l do
 begin
 cf[i+1]:=cf[i+1]+cf[i] div 10;
 cf[i]:=cf[i] mod 10;
 end;

while cf[l+1]<>0 do
begin
l:=l+1;
cf[l+1]:=cf[l+1]+Cf[l] div 10 ;
cf[l]:=cf[l] mod 10;
end;
cf[0]:=l;

end;

function  ad(s1,s2:node):node;
var i,j,jin:longint;
begin
fillchar(ad,sizeof(ad),0);
if s1[0]>s2[0] then ad[0]:=s1[0]
else ad[0]:=s2[0];
jin:=0;
for i:=1 to ad[0] do
 begin
 ad[i]:=(s1[i]+s2[i]+jin)  mod 10;
 jin:=(s1[i]+s2[i]+jin) div 10;
 end;

if jin<>0 then
begin
ad[0]:=ad[0]+1;
ad[ad[0]]:=jin;
end;

end;
begin
assign(input,'poly.in');reset(input);
assign(output,'poly.out');rewrite(output);
readln(n);
z[0][0]:=1;
z[0][1]:=1;
for i:=1 to n do
begin
read(k);
k:=-k;
zz:=z;
for j:=i downto 1 do
 z[j]:=z[j-1];
fillchar(z[0],sizeof(z[0]),0);
for j:=0 to i-1 do
 zz[j]:=cf(zz[j],k);
for j:=0 to i do
 z[j]:=ad(z[j],zz[j]);
end;

for i:=n-1 downto 0 do
begin
for j:=z[i][0] downto 1 do
write(z[i][j]);
writeln;
end;
close(output);
end.