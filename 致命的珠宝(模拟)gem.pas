program gem;
var ind:array[0..1000]of longint;
    ans,z,i,j,k,n,m,t,min:longint;
    s1,s2:string;
function get(x:longint):string;
var s:string;
begin
s:='';
while x<>0 do
 begin
 s:=chr(x mod 7+48)+s;
 x:=x div 7;
 end;
get:=s;
end;

begin
assign(input,'gem.in');reset(input);
assign(output,'gem.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(ind[i]);
min:=maxlongint;
for i:=1 to n-1 do
for j:=i+1 to n do
 begin
 s1:=get(ind[i]);
 s2:=get(ind[j]);
 while length(s1)<length(s2) do s1:='0'+s1;
 while length(s1)>length(s2) do s2:='0'+s2;
 t:=0;
  for z:=1 to length(s1) do
  if s1[z]<>s2[z] then  t:=t+1 shl(length(s1)-z);

  if abs(t-123)<min then
  begin
  min:=abs(t-123);
  ans:=t;
  end;
 end;
 writeln(ans);
 close(output);
end.