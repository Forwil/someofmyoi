program write;
var s:ansistring;
   t,i,j,k,n,m:longint;
   ch:char;
begin
assign(input,'write.in');reset(input);
assign(output,'write.out');rewrite(output);
readln(n);
t:=0;
while not(eoln) do
 begin
 read(ch);
 s:=s+ch;
 if (length(s)>n)and(ch in[' ','.',',','!','?'])then
 begin
 delete(s,length(s),1);
 writeln(s);
 s:=ch;
 end;
 end;
 if s<>''then
 writeln(s);
 close(output);
end.
