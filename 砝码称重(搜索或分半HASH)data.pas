program data;
var dat:Array[0..33]of longint;
    p:array[0..33]of qword;
    ans,i,j,k,n,m:longint;
procedure go(x,y:longint;z:qword);
begin
if z>m then exit;
if (x>n)and(z=m)and(y<ans) then ans:=y;
if x<=n then
begin
 if p[x]+z<m then exit;
 go(x+1,y,z);
 go(x+1,y+1,z+dat[x]);
end;
end;
begin
assign(input,'data.in');reset(input);
assign(output,'data.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 readln(dat[i]);
for i:=1 to n do
for j:=i+1 to n do
if dat[i]<dat[j] then
 begin
 dat[0]:=dat[i];
 dat[i]:=dat[j];
 dat[j]:=dat[0];
 end;

for i:=n downto 1 do
 p[i]:=p[i+1]+dat[i];
ans:=maxlongint;
go(1,0,0);
writeln(ans);
close(output);
end.