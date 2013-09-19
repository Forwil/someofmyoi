program panda;
var   p,b:Array[0..100000]of longint;
      dat:Array[0..101]of integer;
  o,min,i,j,k,n,m:longint;
   max,x,y:qword;
begin
assign(input,'panda.in');reset(input);
//assign(output,'panda.out');rewrite(output);
readln(n,k);
for i:=1 to n do
 read(dat[i]);
b[0]:=1;
for i:=1 to k do
begin
min:=maxlongint;
for j:=1 to n do
 if b[p[j]]*dat[j]<min then
  min:=b[p[j]]*dat[j];
b[i]:=min;
for j:=1 to n do
 if (b[p[j]]*dat[j]=min) then inc(p[j]);
end;
writeln(b[k]);
close(output);
end.
