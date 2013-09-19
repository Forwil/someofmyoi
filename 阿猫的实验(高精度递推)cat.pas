program cat;
type node=array[0..2000]of longint;
var dt:array[0..4]of node;
 i,a,b,c,n,now,l1,l2,l3:longint;
 s:String;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function chen(s1:node;x:longint):node;
var a:node;
  i:longint;
begin
fillchar(a,sizeof(a),0);
for i:=1 to s1[0] do
 a[i]:=s1[i]*x;
for i:=1 to s1[0]+3 do
 begin
 a[i+1]:=a[i+1]+a[i] div 100000;
 a[i]:=a[i] mod 100000;
 end;
 a[0]:=s1[0];
while a[a[0]+1]<>0 do
begin
a[a[0]+1]:=a[a[0]+1] + a[a[0]] div 100000;
a[a[0]]:=a[a[0]] mod 100000;
inc(a[0]);
end;
chen:=a;
end;
function jia(s1,s2:node):node;
var jin,i:longint;
  s3:node;
begin
jin:=0;
fillchar(s3,sizeof(s3),0);
for i:=1 to max(s1[0],s2[0]) do
 begin
 s3[i]:=(s1[i]+s2[i]+jin) mod 100000;
 jin:=(s1[i]+s2[i]+jin)  div 100000;
 end;
 s3[0]:=max(s1[0],s2[0]);
if jin<>0 then
begin
inc(s3[0]);
s3[s3[0]]:=jin;
end;
jia:=s3;
end;
begin
assign(input,'cat.in');reset(input);
assign(output,'cat.out');rewrite(output);
readln(a,b,c,n);
dt[0][1]:=1;
dt[0][0]:=1;
dt[1][1]:=0;
dt[2][1]:=0;
dt[3][1]:=0;
for i:=1 to n do
 begin
 dt[3]:=jia(dt[3],dt[2]);
 dt[2]:=dt[1];
 dt[1]:=dt[0];
 dt[0]:=jia(chen(dt[1],a),chen(dt[2],b));
 dt[0]:=jia(dt[0],chen(dt[3],c));
 end;
 dt[4]:=jia(jia(jia(dt[0],dt[1]),dt[2]),dt[3]);
 write(dt[4,dt[4,0]]);
 for i:=dt[4,0]-1 downto 1 do
  case dt[4,i] of
   0..9:write('0000',dt[4,i]);
   10..99:write('000',dt[4,i]);
   100..999:write('00',dt[4,i]);
   1000..9999:write('0',dt[4,i]);
   10000..99999:write(dt[4,i]);
   end;
 close(output);
end.
