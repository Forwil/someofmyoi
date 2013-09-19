program money;
type link=^badf;
  badf=record
  id,vi:longint;
  nexT:link;
  end;
var i,j,k,n,m,x,y,z,a,b:longint;
    ln:array[0..2000]of link;
    r:array[0..2000]of boolean;
    p:array[0..2000]of real;
    ans,min:real;     q:link;
begin
assign(input,'money.in');
reset(input);
assign(output,'money.out');
rewrite(output);
 readln(n,m);
 for i:=1 to m do
   begin
   readln(x,y,z);
   new(q);
   q^.id:=x;
   q^.vi:=100-z;
   q^.next:=ln[y];
   ln[y]:=q;
   new(q);
   q^.id:=y;
   q^.vi:=100-z;
   q^.next:=ln[x];
   ln[x]:=q;
   end;
 readln(a,b);
 fillchar(p,sizeof(p),$7f);
 fillchar(r,sizeof(r),true);
 q:=ln[b];
 while q<>nil do
  begin
  p[q^.id]:=100/(q^.vi/100);
  q:=q^.next;
  end;
  r[b]:=true;
 for i:=1 to n-1 do
   begin
   min:=1E38;
    for j:=1 to n do
     if (min>p[j])and(r[j]) then
      begin
      min:=p[j];
      k:=j;
      end;
    r[k]:=false;
    q:=ln[k];
    while q<>nil do
     begin
      if p[k]/(q^.vi/100)<p[q^.id] then
       p[q^.id]:=p[k]/(q^.vi/100);
     q:=q^.next;
     end;
    if r[a]=false then break;
   end;
write(p[a]:0:8);
close(output);
end.
