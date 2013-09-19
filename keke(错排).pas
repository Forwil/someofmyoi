program keke;
type node=array[0..1500]of longint;
var dt:array[0..1000]of node;
  i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function jia(s1,s2:node):node;
var i,jin:longint;
  s3:node;
begin
fillchar(s3,sizeof(s3),0);
s3[0]:=max(s1[0],s2[0]);
jin:=0;
for i:=1 to s3[0] do
 begin
 s3[i]:=(s1[i]+s2[i]+jin) mod 10000;
 jin:=(s1[i]+s2[i]+jin) div 10000;
 end;
if jin<>0 then
begin
 s3[0]:=s3[0]+1;
 s3[s3[0]]:=jin;
end;

jia:=s3;
end;
function chen(s1:node;x:longint):node;
var
  l,i,j:longint;
  s3:node;
begin
fillchar(s3,sizeof(s3),0);
s3[0]:=s1[0];

for i:=1 to s1[0] do
s3[i]:=s1[i]*x;

for i:=1 to s3[0] do
begin
s3[i+1]:=s3[i+1]+s3[i] div 10000;
s3[i]:=s3[i] mod 10000;
end;

while s3[s3[0]+1]<>0 do
begin
s3[0]:=s3[0]+1;
s3[s3[0]+1]:=s3[s3[0]+1]+s3[s3[0]]div 10000;
s3[s3[0]]:=s3[s3[0]] mod 10000;
end;

chen:=s3;

end;
begin
assign(input,'keke.in');reset(input);
assign(output,'keke.out');rewrite(output);
readln(n);
dt[1][0]:=0;
dt[1][1]:=0;
dt[2][0]:=1;
dt[2][1]:=1;
for i:=3 to n do
 dt[i]:=chen(jia(dt[i-1],dt[i-2]),i-1);
 write(dt[n,dt[n,0]]);
for i:=dt[n,0]-1 downto 1 do
 case dt[n,i] of
  0..9:write('000',dt[n,i]);
  10..99:write('00',dt[n,i]);
  100..999:write('0',dt[n,i]);
  1000..9999:write(dt[n,i]);
  end;
close(output);
end.
