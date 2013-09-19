program subway;
var d:array[0..2001,-1..2001]of longint;
ans,i,j,k,n,m:longint;
begin
assign(input,'subway.in');reset(input);
assign(output,'subway.out');rewrite(output);
readln(n,m);
d[1,1]:=1;
d[1,0]:=1;
for i:=2 to n do
begin
d[i,1]:=d[i-1,0];
d[i,0]:=d[i,1];
if m>=2 then
begin
 d[i,2]:=d[i-1,0];
 d[i,0]:=(d[i,1]+d[i,2])mod 4096;
end;
for j:=3 to m do
begin
 d[i,j]:=(d[i,j-1]-d[i-1,j-2]+4096)mod 4096;
 d[i,0]:=(d[i,0]+d[i,j])mod 4096;
end;
end;
for i:=1 to m do
ans:=(ans+d[n,i])mod 4096;
writeln(ans);
close(output);
end.
