program  vsbrandy;
var tree:array[1..100] of record
 l,r:longint;
 end;
 i,j,k,mm,n:longint;
procedure build(l,r,p:longint);
var m:longint;
begin
tree[p].l:=l;
tree[p].r:=r;
if l<r then
begin
 m:=(l+r) shr 1;
 build(l,m,p*2);
 build(m+1,r,p*2+1);
 if p*2+1>mm then mm:=p*2+1;
end;
end;
begin
readln(n);
build(1,n,1);
writeln(mm);
end.
