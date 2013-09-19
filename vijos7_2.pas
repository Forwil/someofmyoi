program vijos7_2;
type link=^dgd;
  dgd=record
  id,vi:longint;
  next:link;
  end;
var ln:array[0..1000]of link;
    p:array[0..1000]of longint;
    b:array[0..1000]of boolean;
    f:array[0..1000]of longint;
    s,s1:ansistring;
  x,i,j,k,n,m,min:longint;
  q:link;
begin
readln(n);
for i:=1 to n do
 begin
  for j:=1 to n do
   begin
   read(x);
   if x<>0 then
     begin
     new(q);
     q^.id:=j;
     q^.vi:=x;
     q^.next:=ln[i];
     ln[i]:=q;
     end;
   end;
 readln;
 end;
 q:=ln[1];
 fillchar(p,sizeof(p),$7f);
 while q<>nil do
  begin
  p[q^.id]:=q^.vi;
  f[q^.id]:=1;
  q:=q^.next;
  end;
  fillchar(b,sizeof(b),true);
  b[1]:=false;
for i:=1 to n-1 do
 begin
 min:=maxlongint;
 for j:=1 to n do
   if (b[j])and(p[j]<min) then
     begin
     k:=j;
     min:=p[j];
     end;
  b[k]:=false;
 q:=ln[k];
 if k=n then break;
 while q<> nil do
  begin
  if p[k]+q^.vi<p[q^.id] then
    begin
    p[q^.id]:=p[k]+q^.vi;
    f[q^.id]:=k;
    end;
   q:=q^.next;
  end;
 end;
 str(n,s1);
 s:=s1;
 i:=n;
 repeat
  i:=f[i];
  str(i,s1);
  s:=s1+' '+s;
 until i=1;
 writeln(s);
 writeln(p[n]);
end.