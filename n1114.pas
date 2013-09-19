program n1114;
var i,j,k,n,m:longint;
s:ansistring;
procedure go(s:ansistring);
var s1,s2:ansistring;
begin
if length(s)>1 then
 begin
 go(copy(s,1,length(s) div 2));
 go(copy(s,length(s) div 2+1,length(s) div 2));
 end;
if pos('0',s)=0 then write('I')
else
if pos('1',S)=0 then write('B')
else write('F');
end;
begin
readln(n);
readln(s);
go(s);
end.