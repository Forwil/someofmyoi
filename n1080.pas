program n1080;
var a,b,c:longint;
function w(a,b,c:longint):longint;
begin
if (a<=0)or(b<=0)or(c<=0) then exit(1);
if (a>20)or(b>20)or(c>20)then exit(w(20,20,20));
if (a<b)and(b<c) then exit(w(a,b,c-1)+w(a,b-1,c-1)-w(a,b-1,c));
exit(w(a-1,b,c)+w(a-1,b-1,c)+w(a-1,b,c-1)-w(a-1,b-1,c-1));
end;
begin
readln(a,b,c);
while not((a=-1)and(b=-1)and(c=-1)) do
begin
writeln(w(a,b,c));
readln(a,b,c);
end;
end.