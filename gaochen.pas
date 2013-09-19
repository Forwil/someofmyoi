program gaochen;
type node=array[0..10000]of longint;
var i,j,k,n,m:longint;
 a,b,c:node;
s,ss:ansistring;
function chen(s1,s2:node):node;
var i,j:longint;
   s3:node;
begin
fillchar(s3,sizeof(s3),0);

for i:=1 to s1[0] do
for j:=1 to s2[0] do
 s3[i+j-1]:=s3[i+j-1]+s1[i]*s2[j];

for i:=1 to s1[0]+s2[0] do
 begin
 s3[i+1]:=s3[i+1]+s3[i] div 1000;
 s3[i]:=s3[i] mod 1000;
 end;
if s3[s1[0]+s2[0]]=0 then s3[0]:=s1[0]+s2[0]-1
else s3[0]:=s1[0]+s2[0];

chen:=s3;
end;
begin
readln(s);
a[0]:=0;
while length(s)>=3 do
begin
ss:=copy(s,length(s)-2,3);
delete(s,length(s)-2,3);
val(ss,a[a[0]+1],j);
a[0]:=a[0]+1;
end;
if s<>'' then
begin
val(s,a[a[0]+1],j);
a[0]:=a[0]+1;
end;

readln(s);
b[0]:=0;
while length(s)>=3 do
begin
ss:=copy(s,length(s)-2,3);
delete(s,length(s)-2,3);
val(ss,b[b[0]+1],j);
b[0]:=b[0]+1;
end;
if s<>'' then
begin
val(s,b[b[0]+1],j);
b[0]:=b[0]+1;
end;
c:=chen(a,b);
write(c[c[0]]);
for i:=c[0]-1 downto 1 do
case c[i]of
0..9:write('00',c[i]);
10..99:write('0',c[i]);
100..999:write(c[i]);
end;
end.