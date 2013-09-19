program n1136;
type node=array[0..7]of longint;
var a:array[0..1500]of node;
     i,j,k,n,m,jin:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
a[0][0]:=1;
a[0][1]:=1;
for i:=1 to 1500 do
begin
a[i][0]:=max(a[i-1][0],a[i div 2][0]);
jin:=0;
for j:=1 to a[i][0] do
 begin
  a[i][j]:=(a[i-1][j]+a[i div 2][j]+jin) mod 1000000000;
  jin:=(a[i div 2][j]+a[i-1][j]+jin) div 1000000000;
 end;
 if jin<>0 then
 begin
 a[i][0]:=a[i][0]+1;
 a[i][a[i][0]]:=jin;
 end;
end;

while not(eof) do
begin
readln(n);
write(a[n div 2,a[n div 2,0]]);
for i:=a[n div 2,0]-1 downto 1 do
case a[n div 2,i] of
0..9:write('00000000',a[n div 2,i]);
10..99:write('0000000',a[n div 2,i]);
100..999:write('000000',a[n div 2,i]);
1000..9999:write('00000',a[n div 2,i]);
10000..99999:write('0000',a[n div 2,i]);
100000..999999:write('000',a[n div 2,i]);
1000000..9999999:write('00',a[n div 2,i]);
10000000..99999999:write('0',a[n div 2,i]);
100000000..999999999:write(a[n div 2,i]);
end;
end;
end.
