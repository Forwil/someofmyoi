program hallows;
var ind:array[0..50000,1..2]of longint;
    t,i,j,k,n,m,v,w,s,ans:longint;
    dp:array[0..550]of longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;
z:=ind[(x+y)shr 1,1];
repeat
while z<ind[y,1] do dec(y);
while z>ind[x,1] do inc(x);
if x<=y then
begin
ind[0]:=ind[x];
ind[x]:=ind[y];
ind[y]:=ind[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'hallows.in');
reset(input);
assign(output,'hallows.out');rewrite(output);
 readln(n,v);
 t:=0;
 for i:=1 to n do
  begin
  readln(m,w,s);
   k:=0;
   while m-(1 shl k)+1>0 do inc(k);
   dec(k);
   for j:=0 to k-1 do
    begin
    inc(t);
    ind[t,1]:=w *(1 shl j);
    ind[t,2]:=s *(1 shl j);
    end;
    inc(t);
    ind[t,1]:=w*(m-(1 shl k)+1);
    ind[t,2]:=s*(m-(1 shl k)+1);
  end;
 sort(1,t);
// for i:=1 to t do  writeln(ind[i,1],' ',ind[i,2]);
 n:=t;
 dp[0]:=0;
 s:=0;
 ans:=0;
 for i:=1 to n do
 for j:=s downto 0 do
  if ((dp[j]>0)or(j=0))and(j+ind[i,1]<=v) then
    begin
    dp[j+ind[i,1]]:=max(dp[j+ind[i,1]],dp[j]+ind[i,2]);
    s:=max(s,j+ind[i,1]);
    ans:=max(ans,dp[j+ind[i,1]]);
    end;
  writeln(ans);
  close(output);
end.
