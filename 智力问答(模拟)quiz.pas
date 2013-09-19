program quiz;
var  num:array[0..100000]of longint;
     pl:array[0..1001]of longint;
    x,s,i,j,k,n,m,l,t:longint;
begin
assign(input,'quiz.in');
reset(input);
assign(output,'quiz.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
 read(k);
 inc(num[k]);
end;
 readln;
for i:=1 to m do
 read(pl[i]);
 close(input);
for i:=1 to m do
begin
x:=0;
 for j:=1 to pl[i] do
 begin
   while num[x]=0 do inc(x);
   write(x,' ');
   dec(num[x]);
   inc(x);
 end;
 writeln;
end;
close(output);
end.
