program lunch;
var ind,p:Array[0..100000]of longint;
i,j,k,n,m:longint;
begin
assign(input,'lunch.in');reset(input);
assign(output,'lunch.out');rewrite(output);
p[0]:=maxlongint;
readln(n);
for i:=1 to n do
 read(ind[i]);
m:=0;
for i:=1 to n do
begin
if ind[i]=0 then continue;
 for j:=m downto 0 do
 if ind[i]<p[j] then break;
 if ind[i]>p[j+1] then p[j+1]:=ind[i];
 if j+1>m then m:=j+1;
end;
writeln(m);
close(output);
end.
