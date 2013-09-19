program a10_6;
var ind:array[0..1001]of ansistring;
    id:Array[0..1001]of integer;
  ch:char;
  i,j,k,n:longint;
begin
assign(input,'a.in');reset(input);
assign(output,'a.out');rewrite(output);
i:=0;
while not(eoln) do
 begin
 i:=i+1;
 read(id[i]);
 end;
 readln;
 n:=i;
for i:=1 to n do
 begin
  read(ch);
  while (ch<>' ')and(ch<>chr(13)) do
    begin
     ind[id[i]]:=ind[id[i]]+ch;
     read(ch);
    end;
 end;
for i:=1 to n do
 writeln(ind[i]);
 close(output);
end.
