program rq_3;
var   ind:Array[0..10001]of integer;
      z1,z2:qword;
    t,i,j,k,n,m,w1,w2:longint;
    s:string;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n);
for i:=1 to n do
read(ind[i]);
z1:=100-ind[1];
z2:=100;
for i:=2 to n do
 begin
  t:=0;
  if z2>t then t:=z2;
  if z1+ind[i]>t then t:=z1+ind[i];

  if t-ind[i]>z1 then z1:=t-ind[i];
  if t>z2 then  z2:=t;
 end;
 str(z2,s);
 while length(s)<10 do s:='0'+s;
 while length(s)>10 do delete(s,length(s),1);
 writeln(s);
end.
