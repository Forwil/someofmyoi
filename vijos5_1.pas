program vijos5_1;
var ind:Array[0..50]of longint;
    i,j,k,n,m,a,b,x,ans:longint;
    can:boolean;
begin
assign(input,'eight.in');reset(input);
assign(output,'eight.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
 read(ind[i]);
 if (ind[i]=1)or(ind[i]=8)or(ind[i]=4)or(ind[i]=2) then
  begin
  writeln(0);
  halt;
  end;
end;
 readln(a,b);
 x:=0;
while  x<a do x:=x+8;
while  (x>=a)and(x<=b) do
 begin
 can:=true;
 for i:=1 to n do
   if x mod ind[i]=0 then
     begin
     can:=false;
     break;
     end;
 if can then inc(ans);
 x:=x+8;
 end;
writeln(ans);
close(output);
end.
