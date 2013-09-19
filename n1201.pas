program n1201;
var a,b,c,i,j,k:longint;
begin
readln(a);
j:=a shr 16;
i:=a- j shl 16;
i:=i shl 16 +j;
writeln(i);
end.