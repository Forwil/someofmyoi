program wg4;
type link=^dfdf;
  dfdf=record
  id,vi:longint;
  next:link;
  end;
var ans,i,z,j,k,n,m,x,y,u,d,min:longint;
    ln:array[0..101]of link;
    cost,p,l:Array[0..101]of longint;
    pass:array[0..101]of boolean;
   q:link;
begin
assign(input,'swap.in');reset(input);
assign(output,'swap.out');rewrite(output);
readln(m,n);
for i:=1 to n do
 begin
 readln(cost[i],l[i],k);
 for j:=1 to k do
  begin
   readln(x,y);
   new(q);
   q^.id:=i;
   q^.next:=ln[x];
   q^.vi:=y;
   ln[x]:=q;
  end;
 end;
 ans:=maxlongint;
for i:=0 to m  do
 begin
 u:=l[1]+i;d:=l[1]+i-m;
 for j:=1 to n do
 if (l[j]<=u)and(l[j]>=d) then p[j]:=cost[j]
 else p[j]:=maxlongint shr 1;
 fillchar(pass,sizeof(pass),false);
 for j:=1 to n-1 do
  begin
  min:=maxlongint;
  k:=0;
  for z:=1 to n do
   if not(pass[z]) and (p[z]<min) then
    begin
    min:=p[z];
    k:=z;
    end;
  pass[k]:=true;
  q:=ln[k];
  while q<>nil do
  begin
  if not pass[q^.id] and (p[q^.id]>p[k]+q^.vi)
   and (l[q^.id]<=u)and(l[q^.id]>=d)then
       p[q^.id]:=p[k]+q^.vi;
  q:=q^.next;
  end;
  if pass[1]=true then break;
  end;
 if p[1]<ans then ans:=p[1];
 end;

writeln(ans);
close(output);
end.
