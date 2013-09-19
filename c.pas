program c;
type link=^df;
  df=record
  id:longint;
  next:link;
  end;
var z:array[0..1000]of link;
    p:array[0..1000]of longint;
    hash:array[0..1000]of integer;
    ind:array[0..1000,1..2]of longint;
    dp:array[0..10000]of longint;
    s,i,j,k,n,r,m,t,x,y,ans,tot:longint;
    q,qq:link;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'c.in');reset(input);
assign(output,'c.out');rewrite(output);
readln(n,m,t);
for i:=1 to n do
 begin
 readln(ind[i,1],ind[i,2]);
 p[i]:=i;
 end;
for i:=1 to t do
begin
 readln(x,y);
 r:=p[x];
 if p[x]<>p[y] then
  for j:=1 to n do
   if p[j]=r then p[j]:=p[y];
end;
for i:=1 to n do
begin
if hash[p[i]]=0 then
 begin  inc(tot);  hash[p[i]]:=tot; end;
new(q);
q^.id:=i;
q^.nexT:=z[hash[p[i]]];
z[hash[p[i]]]:=q;
end;
s:=0;
for i:=1 to tot do
 for j:=s downto 0 do
 if (dp[j]>0)or(j=0) then
  begin
  q:=z[i];
   while q<>nil do
      begin
      if ind[q^.id,2]+j<=m then
       begin
       ind[0]:=ind[q^.id];
       dp[j+ind[0,2]]:=max(dp[j+ind[0,2]],dp[j]+ind[0,1]);
       ans:=max(ans,dp[j+ind[0,2]]);
       if j+ind[0,2]>s then s:=j+ind[0,2];
       end;
      q:=q^.next;
      end;
  end;
 writeln(ans);
 close(output);
end.
