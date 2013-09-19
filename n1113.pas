program n1113;
var x,y,t,i,j,k,n,m:longint;
begin
for i:=1 to 7 do
begin
readln(x,y);
if (x+y>8)and(x+y>m) then
begin
m:=x+y;
k:=i;
end;
end;
writeln(k);
end.