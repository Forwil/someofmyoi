program monkey;
 var fab:Array[0..100]of qword;
   i,j,n:longint;
   x,y,xx,yy:qword;
function go(x:qword):qword;
var i:longint;
    z:qword;
begin
 i:=0;
 z:=0;
 go:=0;
 while fab[i]<=x do inc(i);
 i:=i-1;
 if i>=0 then
 begin
 z:=fab[i-1];
 if x>fab[i] then
 z:=z+go(x-fab[i]);
 end;
 go:=z;
end;
begin
assign(input,'monkey.in');reset(input);
assign(output,'monkey.out');rewrite(output);
readln(n);
fab[0]:=1;
fab[1]:=1;
for i:=2 to 92 do
 fab[i]:=fab[i-1]+fab[i-2];
for i:=1 to n do
 begin
 readln(x,y);
 xx:=go(x-1);
 yy:=go(y);
 writeln(yy-xx);
 end;
 close(output);
end.
