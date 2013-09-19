program game;
var a:Array[0..100]of longint;
    l,t,i,j,k,n,m,o:longint;
    ch:char;
    can:boolean;
{function  change(a:node):node;
var i,j:longint;
begin
fillchar(change,sizeof(change),0);
  for i:=1 to n do
   for j:=1 to m do
    begin
    if (a[i] and(1 shl (m-j)))<>0 then
     change[j]:=change[j]+(1 shl (i-1));
    end;
  for i:=1 to m do
  for j:=i+1 to m do
   if change[i]>change[j]then
   begin
   change[0]:=change[i];
   change[i]:=change[j];
   change[j]:=change[0];
   end;
end;

function  pan:boolean;
var i:longint;
  k:node;
begin
k:=change(tab);
pan:=true;
for i:=1 to m do
 if k[i]<>g[i] then exit(false);
end;

procedure dfs(x:longint);
begin
if x<=n then
begin
dfs(x+1);
if can then exit;
tab[x]:=tab[x] xor((1 shl m)-1);
dfs(x+1);
if can then exit;
end
else can:=pan;
end;
               }
begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
readln(l);
for t:=1 to l do
 begin
 readln(n,m);
// fillchar(tab,sizeof(tab),0);
  fillchar(a,sizeof(a),0);
 can:=true;
 for i:=1 to n do
 for j:=1 to m do
  begin
  read(ch);
  if ch=' ' then read(ch);
  if ch='+' then inc(a[i]);
  if j=m then readln;
  end;
 for i:=1 to n do
 begin
 o:=0;
 for j:=1 to m do
  begin
  read(ch);
  if ch=' 'then read(ch);
  if ch='+' then inc(o);
  if j=m then readln;
  end;
  if (a[i]<>o)and(m-a[i]<>o)then
  can:=false;
 end;
{  for i:=1 to n do
   for j:=1 to m do
    begin
    read(ch);
    if ch=' 'then read(ch);
    if ch='+'then  tab[i]:=tab[i]+1 shl(m-j);
    if j=m then readln;
    end;      }

 { for i:=1 to n do
   for j:=1 to m do
    begin
    read(ch);
    if ch=' 'then read(ch);
    if ch='+'then goal[i]:=goal[i]+1 shl(m-j);
    if j=m then readln;
    end;
  g:=change(goal);
  dfs(1);  }
  if can then writeln('Yes')
  else writeln('No');
 end;
 close(output);
end.
