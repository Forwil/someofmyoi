program twostack;
type link=^fd;
fd=record
  id:longint;
  next:link;
  end;
var a,b:array[0..1100]of longint;
   ind,min,biao:array[0..1010]of longint;
   ln:array[0..1010]of link;
   ta,tb,i,j,k,n,m,now,t:longint;
  can:boolean;
  ans:ansistring;
  q:link;
procedure dfs(x,z:longint);
var q:link;
begin
q:=ln[x];
biao[x]:=z;
while q<>nil do
 begin
  if biao[q^.id]=0 then
  dfs(q^.id,3-z)
  else
  if biao[q^.id]=z then
  begin can:=false;exit;end;
  if can=false then exit;
  q:=q^.next;
 end;
end;
begin
assign(input,'twostack.in');reset(input);
assign(output,'twostack.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(ind[i]);

  min[n]:=ind[n];
for i:=n-1 downto 1 do
  if ind[i]<min[i+1] then min[i]:=ind[i]
  else min[i]:=min[i+1];

for i:=1 to n do
for j:=i+1 to n do
if (ind[i]<ind[j])and(ind[i]>min[j]) then
  begin
  new(q); q^.id:=i;q^.next:=ln[j];ln[j]:=q;
  new(q); q^.id:=j;q^.next:=ln[i];ln[i]:=q;
  end;
can:=true;
for i:=1 to n do
if biao[i]=0 then dfs(i,1);
now:=1;
t:=1;
if can then
for i:=1 to n+n do
 begin
 if a[ta]=now then
 begin
 ans:=ans+' b';
 now:=now+1;
 ta:=ta-1;
 continue;
 end;
 if b[tb]=now then
 begin
 ans:=ans+' d';
 now:=now+1;
 tb:=tb-1;
 continue;
 end;
 if (biao[t]=1)and(t<=n) then
   begin
   ta:=ta+1;
   a[ta]:=ind[t];
   t:=t+1;
   ans:=ans+' a';
   continue;
   end;
 if (biao[t]=2)and(t<=n) then
   begin
   tb:=tb+1;
   b[tb]:=ind[t];
   t:=t+1;
   ans:=ans+' c';
   continue;
   end;
 end
else writeln('0');
delete(ans,1,1);
if can then writeln(ans);
close(output);
end.
