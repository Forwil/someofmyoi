program pyramid;
type link=^dfsd;
 dfsd=record
 id,vi:longint;
 next:link;
 end;
var ln:array[0..100]of link;
    b:array[0..100]of boolean;
    i,j,k,n,mm,ans,x,y,z,r:longint;
    q:link;
procedure dfs(x,y,z:longint);
var q:link;
begin
q:=ln[x];
if (x=n)and(y+z*2<ans) then ans:=y+z*2;
if (x<>n)and(y+z*2<ans) then
while q<>nil do
 begin
 if b[q^.id] then
 begin
  b[q^.id]:=false;
  if (q^.vi>z) then dfs(q^.id,z+y,q^.vi);
  if (q^.vi<=z)then dfs(q^.id,y+q^.vi,z);
  b[q^.id]:=true;
 end;
 q:=q^.next;
 end;
end;
begin
assign(input,'pyramid.in');reset(input);
assign(output,'pyramid.out');rewrite(output);
readln(n,mm);
for i:=1 to mm do
 begin
 readln(x,y,z);
 new(q);
 q^.id:=y;
 q^.vi:=z;
 q^.next:=ln[x];
 ln[x]:=q;
 new(q);
 q^.id:=x;
 q^.vi:=z;
 q^.next:=ln[y];
 ln[y]:=q;
 end;
 ans:=maxlongint;
 fillchar(b,sizeof(b),true);
 b[1]:=false;
dfs(1,0,0);
writeln(ans);
close(output);
end.
