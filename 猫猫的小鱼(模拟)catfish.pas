program catfish;
var san:array[0..32]of qword;
i,j,n,x:longint;    s:qword;
begin
assign(input,'catfish.in');reset(input);
assign(output,'catfish.out');rewrite(output);
san[0]:=1;
for i:=1 to 31 do
 san[i]:=san[i-1]*3;
 readln(n);
for i:=1 to n do
  begin
   readln(x);
   s:=0;
   for j:=0 to 31 do
    if  x and(1 shl j)>0 then s:=s+san[j];
   writeln(s);
  end;
close(output);
end.
