program loan;
var z,e,i,j,n,m:longint;
   k,t,w,mi,ans:extended;
function get(p:extended):extended;
var i:longint;
begin
get:=z;
for i:=1 to n do
 get:=get*(1+p)-e;
end;
begin
assign(input,'loan.in');reset(input);
assign(output,'loan.out');rewrite(output);
readln(z,e,n);
t:=0;
w:=10;
mi:=(t+w)/2;
repeat
k:=get(mi);
if k>0 then w:=mi-1e-10
else
 begin
 t:=mi+1e-10;
 ans:=mi;
 end;
mi:=(t+w)/2;
until t>w;

writeln(ans*100:0:1);
close(output);
end.
