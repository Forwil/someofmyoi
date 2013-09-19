program orz4;
var dt:array[0..2001]of qword;
   o,i,j,n,x:longint;
   ans:qword;
begin
readln(n);
 dt[2]:=1;
 for i:=3 to 20 do
 dt[i]:=(i-1)*(dt[i-1]+dt[i-2]);
 for i:=1 to n do
 begin
 read(x);
 ans:=ans+dt[n-x];
 end;
 writeln(ans);
end.