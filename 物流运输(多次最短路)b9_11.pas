program b9_11;
type link=^fdsf;
 fdsf=record
  id,vi:longint;
  next:link;
  end;
var dp:array[0..101]of longint;
    b:array[0..101]of set of byte;
    ln:Array[0..21]of link;
    t,x,y,z,i,j,k,n,m,o,r,ans,min,mm:longint;
    q:link;
function  dis(x,z:longint):longint;
var q:link;
   min,i,k,j,r:longint;
   al:set of byte;
   p:array[0..21]of longint;
begin
al:=[];
fillchar(p,sizeof(p),63);
r:=p[0];
for i:=x to z do
 al:=al+b[i];
p[1]:=0;
for i:=1 to m-1 do
 begin
  min:=r;
  k:=0;
   for j:=1 to m do
   if (not(j in al))and(p[j]<min) then
     begin
     min:=p[j];
     k:=j;
     end;
  al:=al+[k];
  q:=ln[k];
   while q<>nil do
     begin
     if (not(q^.id in al))and(p[k]+q^.vi<p[q^.id]) then
       p[q^.id]:=p[k]+q^.vi;
     q:=q^.next;
     end;
 end;
 dis:=p[m];
end;
begin
readln(n,m,k,o);
for i:=1 to o do
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
readln(o);
fillchar(dp,sizeof(dp),63);
r:=dp[0];
for i:=1 to o do
 begin
 readln(x,y,z);
 for j:=y to z do
   b[j]:=b[j]+[x];
 end;
 dp[0]:=-k;
 for i:=1 to n do
 begin
  for j:=1 to i do
   begin
   x:=dis(j,i);
   if x<r then
   if dp[j-1]+x*(i-j+1)+k<dp[i] then
     dp[i]:=dp[j-1]+x*(i-j+1)+k;
   end;
 end;
writeln(dp[n]);
end.
