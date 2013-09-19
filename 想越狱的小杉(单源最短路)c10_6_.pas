program c10_6;
type link=^dfd;
 dfd=record
 vi,id:longint;
 next:link;
 end;
var p:Array[0..2001]of longint;
    pass:Array[0..2001]of boolean;
    ln:array[0..2001]of link;
    x,y,z,i,j,k,n,m,max:longint;
    q:link;
function maxx(a,b:longint):longint;
begin if a>b then exit(a)else exit(b);end;
function minn(a,b:longint):longint;
begin if a>b then exit(b)else exit(a);end;
begin
assign(input,'c.in');reset(input);
assign(output,'c.out');rewrite(output);
readln(n);
readln(x,y,z);
while (x<>0)or(y<>0)or(z<>0) do
 begin
 new(q);q^.id:=y;q^.vi:=z;q^.next:=ln[x];ln[x]:=q;
 readln(x,y,z);
 end;
q:=ln[1];
while q<>nil do
 begin
 p[q^.id]:=q^.vi;
 q:=q^.next;
 end;

 pass[1]:=true;
 for i:=1 to n-1 do
  begin
  max:=0;
  k:=0;
  for j:=1 to n do
   if (pass[j]=false)and(p[j]>max) then
    begin
    max:=p[j];
    k:=j;
    end;
  pass[k]:=true;
  q:=ln[k];

  while q<>nil do
   begin
   if pass[q^.id]=false then
     p[q^.id]:=maxx(p[q^.id],minn(p[k],q^.vi));
     q:=q^.next;
   end;
  end;
for i:=2 to n do
 writeln(p[i]);
 close(output);
end.