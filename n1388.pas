program n1388;
var t:Array[0..5001]of qword;
   i,j,k,n,m:longint;
begin
readln(n);
t[0]:=1;
for i:=1 to n do
 for j:=0 to i-1 do
  t[i]:=t[i]+t[j]*t[i-1-j];
writeln(t[n]);
end.