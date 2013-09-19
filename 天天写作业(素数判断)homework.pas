program homework;
var i,j,k,n,ans,m,a,b:longint;
  zs:array[0..5000]of longint;
function can(x:longint):boolean;
var i,j,y:longint;
begin
y:=trunc(sqrt(x));
if (x=0)or(x=1) then exit(false);
for i:=1 to 5000 do
begin
if zs[i]>y then break;
if x mod zs[i]=0 then exit(false);
end;
exit(true);
end;
begin
assign(input,'homework.in');reset(input);
assign(output,'homework.out');rewrite(output);
readln(a,b);
zs[1]:=2;
i:=1;
n:=1;
repeat
i:=i+2;
zs[0]:=0;
for j:=2 to trunc(sqrt(i)) do
 if i mod j=0 then
  begin zs[0]:=1; break;  end;
if zs[0]=0 then
begin
n:=n+1;
zs[n]:=i;
end;
until n=5000;
for i:=a to b do
ans:=ans+ord(can(i));
writeln(ans);
close(output);
end.
