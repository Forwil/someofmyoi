program max;
type link=^ff;
 ff=record
 id:longint;
 next:link;
 end;
var ln:array[0..101]of link;
    dat:array[0..100001]of byte;
    z,y,i,j,k,n,m,x:longint;
    q:link;
function find(x,y:longint):longint;
var i,j:longint;
 q:link;
begin
 for i:=100 downto 0 do
  begin
  q:=ln[i];
  while q<>nil do
   begin
   if (q^.id>=x)and(q^.id<=y)then exit(i);
   q:=q^.next;
   end;
  end;
end;
begin
assign(input,'max.in');reset(input);
assign(output,'max.out');rewrite(output);
 readln(m,n);
 for i:=1 to n do
  begin
  read(x);
  dat[i]:=x;
  new(q);q^.id:=i;q^.next:=ln[x];ln[x]:=q;
  end;

 for i:=1 to m do
  begin
  readln(x,y);
  if (y-x>60) then  z:=find(x,y)
  else
   begin
   z:=0;
   for j:=x to y do
   if dat[j]>z then z:=dat[j];
   end;
  writeln(z);
  end;
 close(output);
end.

