program crab;
var i,j,n,x,y:longint;
begin
assign(input,'crab.in');reset(input);
assign(output,'crab.out');rewrite(output);
readln(n);
x:=1;
y:=n;
for i:=1 to n do
 begin
 if odd(i) then
  begin
  writeln(x);
  inc(x);
  end
else
  begin
  writeln(y);
  dec(y);
  end;
 end;
close(output);
end.