program wg1;
const p=100000;
type  node=array[0..700]of longint;
var dt:array[0..1001]of node;
   i,j,k,n,m,len,jin:longint;
   c:node;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;

begin
assign(input,'sum.in');reset(input);
assign(output,'sum.out');rewrite(output);
readln(n);
dt[0][0]:=1;
dt[0][1]:=1;
dt[1][0]:=1;
dt[1][1]:=0;
for i:=2 to n do
 begin
  len:=max(dt[i-1][0],dt[i-2][0]);
  jin:=0;
  for j:=1 to len do
    begin
    c[j]:=(dt[i-1][j]+dt[i-2][j]+jin) mod p;
    jin:=(dt[i-1][j]+dt[i-2][j]+jin) div p;
    end;
  if jin<>0 then
   begin
   inc(len);
   c[len]:=jin;
   end;

  for j:=1 to len do
   dt[i][j]:=c[j]*(i-1);
  for j:=1 to len do
   begin
   dt[i][j+1]:=dt[i][j+1] + dt[i][j] div p;
   dt[i][j]:=dt[i][j] mod p;
   end;
  while dt[i][len+1]<>0 do
   begin
   len:=len+1;
   dt[i][len+1]:=dt[i][len+1]+ dt[i][len] div p;
   dt[i][len]:=dt[i][len] mod p;
   end;
   dt[i][0]:=len;
 end;

 c:=dt[n];
 write(c[c[0]]);
for i:=c[0]-1 downto 1 do
 begin
 if c[i]<10 then write('0');
 if c[i]<100 then write('0');
 if c[i]<1000 then write('0');
 if c[i]<10000 then write('0');
 write(c[i]);
 end;
 writeln;
 close(output);
end.
