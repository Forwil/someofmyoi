program arrange;
var b:array[0..21,0..21]of boolean;
    shu:array[0..21]of boolean;
    x,y,i,j,k,n,m:longint;
    ans:qword;
procedure dfs(x:longint);
var i,j:longint;
begin
if x=n then inc(ans);
if x<n then
for i:=1 to n do
 if (shu[i])and(b[x,i]) then
  begin
  shu[i]:=false;
  dfs(x+1);
  shu[i]:=true;
  end;
end;
begin
assign(input,'arrange.in');
reset(input);
assign(output,'arrange.out');rewrite(output);
readln(n,m);
fillchar(b,sizeof(b),true);
fillchar(shu,sizeof(shu),true);
for i:=1 to m do
begin
readln(x,y);
b[x,y]:=false;
end;
ans:=0;
dfs(1);
writeln(ans);
close(output);
end.
