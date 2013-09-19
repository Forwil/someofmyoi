program clever;
var tab:Array[0..101,0..101]of extended;
      b:Array[0..101,0..101]of boolean;
    dat:Array[0..101,1..2]of extended;
      p:array[0..101]of extended;
    pass:Array[0..101]of boolean;
   i,j,k,n,m:longint;
   x,y,v,min:extended;
begin
assign(input,'clever.in');reset(input);
assign(output,'clever.out');rewrite(output);
readln(n,v);
for i:=1 to n do
 begin
 readln(dat[i,1],dat[i,2],k);
 if k<>0 then
  begin
  tab[i,k]:=sqrt(sqr(dat[i,1]-dat[k,1])+sqr(dat[i,2]-dat[k,2]))/v;
  tab[k,i]:=sqrt(sqr(dat[i,1]-dat[k,1])+sqr(dat[i,2]-dat[k,2]))/v;
  b[i,k]:=true;
  b[k,i]:=true;
  end;
 end;
for i:=1 to n do
for j:=1 to n do
if (i<>j)and(dat[i,1]=dat[j,1])and(dat[j,2]<dat[i,2])then
 begin
 x:=sqrt((dat[i,2]-dat[j,2])/5);
 if ((b[i,j])and(x<tab[i,j]))or(b[i,j]=false) then
  begin
  tab[i,j]:=x;
  b[i,j]:=true;
  end;
 end;

for i:=1 to n do
 if b[1,i] then p[i]:=tab[1,i]
 else p[i]:=1e38;

 pass[1]:=true;
for i:=1 to n-1 do
 begin
  min:=1e38;
  k:=0;
  for j:=1 to n do
   if not(pass[j])and(p[j]<min) then
    begin
    min:=p[j];
    k:=j;
    end;
  pass[k]:=true;
  for j:=1 to n do
  if not(pass[j])and(b[k,j])and(p[k]+tab[k,j]<p[j])then
   p[j]:=p[k]+tab[k,j];
 end;
writeln(p[n]:0:2);
close(output);
end.
