program makeup;
type link=^fse;
   fse=record
   id:integer;
   next:link;
   end;
var b:array[0..16001]of boolean;
    ln:array[0..16001]of link;
    dp:array[0..16001]of longint;
    i,j,k,m,n,x,y,ans:longint;
    q:link;
procedure dfs(x:longint);
var q:link;
begin
b[x]:=false;
q:=ln[x];
while q<>nil do
 begin
 if b[q^.id] then
  begin
   dfs(q^.id);
   if dp[q^.id]>0 then dp[x]:=dp[x]+dp[q^.id];
  end;
 q:=q^.next;
 end;
if dp[x]>ans then ans:=dp[x];
end;
begin
assign(input,'makeup.in');
reset(input);
assign(output,'makeup.out');rewrite(output);
 readln(n);
 ans:=0;
 for i:=1 to n do
 read(dp[i]);
for i:=1 to n-1 do
begin
readln(x,y);
new(q);
q^.id:=x;
q^.next:=ln[y];
ln[y]:=q;
new(q);
q^.id:=y;
q^.next:=ln[x];
ln[x]:=q;
end;
fillchar(b,sizeof(b),true);
dfs(1);
writeln(ans);
close(output);
end.
