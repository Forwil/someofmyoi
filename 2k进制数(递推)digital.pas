program digital;
type node=array[0..26]of longint;
var dt:array[0..1,0..520]of node;
   ans:node;
  z, y,x,i,j,k,n,m:longint;
function jia(s1,s2:node):node;
var i,j,jin:longint;
s3:node;
begin
fillchar(s3,sizeof(s3),0);
if s1[0]>s2[0] then s3[0]:=s1[0]
else s3[0]:=s2[0];
jin:=0;
for i:=1 to s3[0] do
 begin
 s3[i]:=(jin+s1[i]+s2[i]) mod 100000000;
 jin:=(jin+s1[i]+s2[i]) div 100000000;
 end;
if jin<>0 then
begin
s3[0]:=s3[0]+1;
s3[s3[0]]:=jin;
end;
jia:=s3;
end;
begin
assign(input,'digital.in');reset(input);
assign(output,'digital.out');rewrite(output);
readln(n,m);
x:=m div n;
for i:=1 to 1 shl n-1 do
 begin
 dt[1,i][0]:=1;
 dt[1,i][1]:=1;
 end;
 for i:=2 to x do
 for j:=1 shl n-1 downto 1 do
  begin
  dt[i and 1,j]:=jia(dt[i and 1,j+1],dt[(i-1)and 1,j+1]);
  ans:=jia(ans,dt[i and 1,j]);
  end;
  y:=m-x*n;
 if m mod n<>0 then
  begin
   for j:=1 shl y-1 downto 1 do
   for z:=j+1 to 1 shl n-1 do
   ans:=jia(ans,dt[x and 1,z]);
 end;
write(ans[ans[0]]);
for i:=ans[0]-1 downto 1 do
 begin
 if ans[i]<10000000 then write('0');
 if ans[i]<1000000 then write('00');
 if ans[i]<100000 then write('000');
 if ans[i]<10000 then write('0000');
 if ans[i]<1000 then write('00000');
 if ans[i]<100 then write('000000');
 if ans[i]<10 then write('0000000');
 write(ans[i]);
 end;
 close(output);
end.