program count;
var z,n,i,j,m:longint;
    dt:Array[0..10,0..9]of qword;
    shi:array[0..10]of qword;
    s,ss:string;
    ans,x:qword;
begin
assign(input,'count.in');reset(input);
assign(output,'count.out');rewrite(output);
readln(n);
str(n,s);
n:=length(s);
shi[0]:=1;
for i:=1 to 10 do shi[i]:=shi[i-1]*10;
for i:=0 to 9 do
 dt[1,i]:=i;

 for i:=2 to n do
 for j:=0 to 9 do
 begin
 for z:=0 to 9 do
 dt[i,j]:=dt[i,j]+dt[i-1,z];
 dt[i,j]:=dt[i,j]+j*shi[i-1];
 end;

for i:=1 to n do
 begin
  for j:=ord(s[i])-49 downto 0 do
  ans:=ans+dt[n-i+1,j];
  ss:=copy(s,i+1,n-i);
  val(ss,x,j);
  ans:=ans+(ord(s[i])-48)*(x+1);
 end;
writeln(ans);
close(output);
end.
