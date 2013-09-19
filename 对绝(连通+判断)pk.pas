program pk;
type link=^fdf;
fdf=record
id:longint;
next:link;
end;
var w,l:array[0..101]of link;
    win:array[0..101]of longint;
    los:Array[0..101]of longint;
    b:array[0..101]of boolean;
    x,y,i,j,k,n,m,ans:longint;
    q:link;
    flag:boolean;
procedure try1(x,i:longint);
var q:link;
begin
q:=w[x];
b[x]:=false;
while q<>nil do
  begin
   if b[q^.id] then
     begin
     inc(win[i]);
     try1(q^.id,i);
     end;
   q:=q^.next;
  end;
end;
procedure try2(x,i:longint);
var q:link;
begin
q:=l[x];
b[x]:=false;
while q<>nil do
  begin
    if b[q^.id] then
      begin
      inc(los[i]);
      try2(q^.id,i);
      end;
  q:=q^.next;
  end;
end;
begin
assign(input,'pk.in');reset(input);
assign(output,'pk.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
  readln(x,y);
  new(q);
  q^.id:=y;
  q^.next:=w[x];
  w[x]:=q;
  new(q);
  q^.id:=x;
  q^.next:=l[y];
  l[y]:=q;
 end;
 for i:=1 to n do
  begin
   fillchar(b,sizeof(b),true);
   try1(i,i);
   fillchar(b,sizeof(b),true);
   try2(i,i);
  if (win[i]+los[i]+1=n) then
   inc(ans);
  end;
writeln(ans);
close(output);
end.
