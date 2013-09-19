program n1096;
var mon,i,j,k,n,m,c:longint;
 can:boolean;
begin
 can:=false;
 mon:=0;
 c:=0;
 for i:=1 to 12 do
  begin
  readln(m);
  mon:=mon+300;
  if m>mon then
    begin
    can:=false;
    break;
    end
  else
    begin
    mon:=mon-m;
    c:=c+(mon-(mon mod  100));
    mon:=mon mod 100;
    end;
  end;
if can then write(MON+trunc(c*1.2))
else write(-i);
end.
