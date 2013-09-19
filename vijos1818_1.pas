program vijos1818_1;
type link=^df;
  df=record
  id:longint;
  next:link;
  end;
var ln:array[0..1001]of link;
    ind:array[0..1001]of integer;
    dp:array[0..1001,0..1001]of longint;
    nu:array[0..1001]of integer;
  ans,i,j,k,n,m,x:longint;
  q:link;
  flag:boolean;
procedure dfs(id,z:longint);
 var q:link;
begin
  if z>ans then ans:=z;
  q:=ln[id];
  while q<>nil do
    begin
      dfs(q^.id,z+ind[q^.id]);
      q:=q^.next;
    end;
end;
function min (a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
procedure go(x:longint);
var q:link;
   i,j,l:longint;
begin
q:=ln[x];
dp[x,1]:=ind[x];
l:=1;
while q<>nil do
 begin
   go(q^.id);
   l:=l+nu[q^.id];
   for  i:=min(l,m) downto 2 do
   for  j:=0 to min(i-1,nu[Q^.id]) do
    if  dp[x,i-j]+dp[q^.id,j]>dp[x,i] then
        dp[x,i]:=dp[x,i-j]+dp[q^.id,j];
  q:=q^.next;
 end;
nu[x]:=min(l,m);
end;
begin
readln(n,m);
 for i:=1 to n do
  begin
  readln(ind[i],k);
  if k>1 then flag:=true;
  nu[i]:=k;
   for j:=1 to k do
     begin
      read(x);
      new(q);
      q^.id:=x;
      q^.next:=ln[i];
      ln[i]:=q;
     end;
  if k<>0 then readln;
  end;
 fillchar(dp,sizeof(dp),$f7);
ans:=0;
if flag then
begin
 go(1);
for i:=1 to m do
if dp[1,i]>ans then ans:=dp[1,i];
end
else dfs(1,ind[1]);
 writeln(ans);

end.
