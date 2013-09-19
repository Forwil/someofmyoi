program satanic;
type link=^fs;
fs=record
id,vi:longint;
next:link;
end;
var ln:array[0..101]of link;
    b:array[0..101]of boolean;
    x,i,j,k,n,m,ans:longint;
    q:link;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure dfs(x,z:longint);
var q:link;
   i,j,l:longint;
   k:longint;
begin
if(x=1)and(z<ans) then ans:=z;
q:=ln[x];
if x<>1 then
while q<>nil do
 begin
 if b[q^.id] then
    begin
    b[q^.id]:=false;
    dfs(q^.id,max(((z-q^.vi)div 2)+(z-q^.vi) mod 2,1));
    b[q^.id]:=true;
    end;
 q:=q^.next;
 end;
end;
begin
assign(input,'satanic.in');
reset(input);
assign(output,'satanic.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 for j:=1 to n do
  begin
  read(x);
  if x<>0 then
   begin
    new(q);
    q^.id:=i;
    q^.vi:=x;
    q^.next:=ln[j];
    ln[j]:=q;
   end;
  end;
readln;
end;
fillchar(b,sizeof(b),true);
b[n]:=false;
ans:=maxlongint;
dfs(n,1);
writeln(ans);
close(output);
end.
