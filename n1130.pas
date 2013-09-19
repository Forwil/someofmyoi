program n1130;
var i,j,k,n,m,ans:longint;
procedure go(x:longint);
var i:longint;
begin
if x>1 then
 for i:=1 to x div 2 do
  begin
    go(i);
    inc(ans);
  end;
end;
begin
readln(n);
go(n);
writeln(ans+1);
end.