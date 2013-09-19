program b10_6;
var tab:Array[0..21]of longint;
 g:Array[0..5,0..21]of longint;
  k:array[0..5]of longint;
   l,i,j,n,m,t:longint;
   ch:char;
procedure pan;
var i,j:longint;
c:boolean;
begin
for i:=1 to t do
 begin
 c:=true;
 for j:=1 to n do
 if tab[j]<>g[i,j] then
  begin
   c:=false;
   break;
  end;
 k[i]:=k[i]+ord(c);
 end;
end;
procedure go(x,y:longint);
var i,j,t:longint;
begin
if x<=n then
  begin
    if y=m then go(x+1,1)
    else go(x,y+1);
    tab[x]:=tab[x] xor (1 shl(m-y));
    if y<>m then   tab[x]:=tab[x] xor (1 shl(m-y-1));
    if y<>1 then   tab[x]:=tab[x] xor (1 shl(m-y+1));
    if (x>1) then  tab[x-1]:=tab[x-1]xor (1 shl (m-y));
    if (x>2)then   tab[x-2]:=tab[x-2]xor (1 shl (m-y));
    if x<n then    tab[x+1]:=tab[x+1]xor (1 shl (m-y));
    if x+1<n then  tab[x+2]:=tab[x+2]xor (1 shl (m-y));
    if y=m then go(x+1,1)
    else    go(x,y+1);
  end
 else pan;
end;
begin
assign(input,'b.in');reset(input);
assign(output,'b.out');rewrite(output);
readln(n,m,t);
 for l:=1 to t do
 for i:=1 to n do
 for j:=1 to m do
  begin
  read(ch);
  if ch='1' then g[l,i]:=g[l,i]+1 shl (m-j);
  if j=m then readln;
  if (j=m)and(i=n) then readln;
  end;
go(1,1);
for i:=1 to t do
writeln(k[i]);
close(output);
end.

