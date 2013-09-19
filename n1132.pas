program n1132;
var s,ss:string;
procedure go(s,ss:string);
var x,y:longint;
s1,s2,ss1,ss2:string;
begin
if length(s)=1 then
begin
 write(s);
 exit;
end;
x:=pos(ss[length(ss)],s);
s1:=copy(s,1,x-1);
s2:=copy(ss,1,x-1);
ss1:=copy(s,x+1,length(s)-x);
ss2:=copy(ss,x,length(s)-x);
write(ss[length(ss)]);
if s1<>'' then
go(s1,s2);
if ss1<>'' then
go(ss1,ss2);
end;
begin
readln(s);
readln(ss);
go(s,ss);
end.
