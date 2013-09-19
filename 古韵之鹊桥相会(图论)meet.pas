program meet;
const ax:array[1..4]of -1..1=(1,0,0,-1);
      ay:array[1..4]of -1..1=(0,1,-1,0);
var tab:Array[0..450,0..450]of integer;
     ch:array[0..450]of string;
      p:array[0..450]of longint;
      pass:array[0..450]of boolean;
      dis:Array[0..450,0..450]of boolean;
    ans,min,t,i,j,k,n,m:longint;
procedure  go(i,j:longint);
var x,y,l:longint;
begin
tab[i,j]:=t;
 for l:=1 to 4 do
  begin
  x:=i+ax[l];
  y:=j+ay[l];
  if (x<=n)and(x>=1)and(y<=m)and(y>=1)then
  if (tab[x,y]=0)and(ch[x,y]=ch[i,j])then
   go(x,y);
  end;
end;
begin
assign(input,'meet.in');reset(input);
assign(output,'meet.out');rewrite(output);
readln(n,m);
for i:=1 to n do readln(ch[i]);
for i:=1 to n do
for j:=1 to m do
 if tab[i,j]=0 then
  begin
  t:=t+1;
  go(i,j);
  end;

for i:=1 to n do
for j:=1 to m do
begin
dis[tab[i,j],tab[i-1,j]]:=true;
dis[tab[i-1,j],tab[i,j]]:=true;
dis[tab[i,j],tab[i,j-1]]:=true;
dis[tab[i,j-1],tab[i,j]]:=true;
end;

for i:=1 to t do p[i]:=maxlongint;
for i:=1 to m do p[tab[1,i]]:=1;
for i:=1 to t do
 begin
 min:=maxlongint;
  for j:=1 to t do
   if (pass[j]=false)and(p[j]<min) then
    begin
    min:=p[j];
    k:=j;
    end;
  pass[k]:=true;
  for j:=1 to t do
  if (pass[j]=false)and(dis[k,j])and(p[j]>p[k]+1)then
   p[j]:=p[k]+1;
 end;

 ans:=maxlongint;
for i:=1 to m do
if p[tab[n,i]]<ans then ans:=p[tab[n,i]];
writeln(ans);
close(output);
end.

