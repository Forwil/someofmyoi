program mole;
type link=^dff;
 dff=record
 id:longint;
 next:link;
 end;
var     ln:array[0..10001]of link;
  x,y,time:array[0..10001]of longint;
  o,i,j,k,n,m:longint;
  q:link;
  find:boolean;
begin
assign(input,'mole.in');reset(input);
assign(output,'mole.out');rewrite(output);
readln(n,m);
for i:=1 to m do
begin
 read(time[i],x[i],y[i]);
 for j:=o downto 0 do
 begin
 q:=ln[j];
 find:=false;
  while  q<>nil do
   begin
   if time[i]-time[q^.id]>=
   abs(x[q^.id]-x[i])+abs(y[q^.id]-y[i])then
    begin
    find:=true;
    break;
    end;
   q:=q^.next;
   end;
 if find then break;
 end;

new(q);
q^.id:=i;
q^.next:=ln[j+1];
ln[j+1]:=q;
if j+1>o then o:=j+1;
end;
writeln(o);
close(output);
end.
