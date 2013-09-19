program rq_2;
var t,n,m,i,j,tt,w,mi:longint;
begin
readln(t);
for i:=1 to t do
 begin
 readln(n,m);
 if m>=trunc(ln(n)/ln(2))+1 then
 writeln(trunc(ln(n)/ln(2))+1)
 else
   begin
   w:=m-1;
   tt:=n;
   mi:=(1+tt)shr 1;
   while m>1 do
    begin
    if tt and 1=1 then tt:=mi-1
    else tt:=mi;
    mi:=(tt+1)shr 1;
    m:=m-1;
    end;
    writeln(tt+w);
   end;
 end;
end.