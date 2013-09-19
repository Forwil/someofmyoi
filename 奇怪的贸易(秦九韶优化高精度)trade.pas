program trade;
var a,b,i,j,k,n,m,x,a0:longint;
    ind:array[0..100000]of integer;
    p:array[0..101]of integer;
begin
assign(input,'trade.in');
reset(input);
ASSIGN(output,'trade.out');rewrite(output);
readln(x,n);
readln(a0);
for i:=1 to n do
 readln(ind[i]);
 p[1]:=ind[n];
for i:=n-1 downto 0 do
 begin
  for j:=1 to 100 do
    p[j]:=p[j]*x;
    p[1]:=p[1]+ind[i];
  for j:=1 to 100 do
   begin
   p[j+1]:=p[j+1]+p[j] div 10;
   p[j]:=p[j] mod 10;
   end;
   p[101]:=0;

 end;
 p[1]:=p[1]+a0;
 for j:=1 to 100 do
  begin
  p[j+1]:=p[j+1]+p[j] div 10;
  p[j]:=p[j] mod 10;
  end;
for i:=100 downto 1 do
write(p[i]);
close(output);
end.
