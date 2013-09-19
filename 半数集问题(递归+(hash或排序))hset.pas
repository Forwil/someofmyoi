program hset;
const p=1000001;
var  shi:array[0..15]of qword;
    hash:array[0..p]of qword;
  i,j,k,n,m,ans:longint;
function find(x:Qword):boolean;
var y,i:longint;
begin
y:=0;
i:=x mod p;
while (hash[i+y]<>0)and(hash[i+y]<>x) do inc(y);
if hash[i+y]=0 then
begin
hash[i+y]:=x;
exit(true);
end
else exit(false);
end;

procedure go(len,x:qword;now:longint);
var i:integer;
begin
inc(ans);
for i:=now div 2 downto 1 do
if find(x+i*shi[len]) then
 go(len+trunc(ln(i)/ln(10))+1,x+i*shi[len],i);
end;
begin
assign(input,'hset.in');reset(input);
assign(output,'hset.out');rewrite(output);
readln(n);
shi[0]:=1;
for i:=1 to 15 do shi[i]:=shi[i-1]*10;
go(trunc(ln(n)/ln(10))+1,n,n);
writeln(ans);
close(output);
end.