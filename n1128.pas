program n1128;
var
    ind:array[0..21]of longint;
   k,i,j,m,n,ans:longint;
function pri(x:longint):boolean;
var i:longint;
begin
pri:=true;
for i:=2 to trunc(sqrt(x)) do
 if x mod i=0 then exit(false);
end;
procedure dfs(y,x,z:longint);
var i:longint;
begin
if y<m then
 for i:=x to n-(m-y)+1 do
  dfs(y+1,i+1,z+ind[i])
else
 if pri(z) then inc(ans);
end;
begin
readln(n,m);
for i:=1 to n do
 read(ind[i]);
dfs(0,1,0);
writeln(ans);
end.