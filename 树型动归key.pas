program key;
type link=^df;
  df=record
  id:longint;
  next:link;
  end;
var dp:Array[0..100,0..100]of longint;
    l,r:array[0..100]of longint;
    ln:array[0..101]of link;
    pass:array[0..101]of boolean;
    dat:array[0..101]of longint;
   i,j,k,n,m,x,y,ans:longint;
   q:link;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure ready(x:longint);
var q:link;
begin
pass[x]:=true;
q:=ln[x];
while q<>nil do
 begin
 if pass[q^.id]=false then
    begin
    ready(q^.id);
    if l[x]=0 then l[x]:=q^.id
    else r[x]:=q^.id;
    end;
  q:=q^.next;
 end;
end;

procedure tree1(x:longint);
var i,j:longint;
begin
pass[x]:=true;
if l[x]<>0 then tree1(l[x]);
if r[x]<>0 then tree1(r[x]);
dp[x,1]:=dat[x];
for i:=m+1 downto 2 do
for j:=i downto 1 do
dp[x,i]:=max(dp[x,i],dp[x,j]+dp[r[x],i-j]);
for i:=m+1 downto 2 do
for j:=i downto 1 do
dp[x,i]:=max(dp[x,i],dp[x,j]+dp[l[x],i-j]);
end;

procedure tree2(x:longint);
var i,j:longint;
begin
dp[x,1]:=dat[x];
if (l[x]<>0)and(pass[l[x]]=false) then tree2(l[x]);
if (r[x]<>0)and(pass[r[x]]=false) then tree2(r[x]);
if (pass[l[x]])and(pass[r[x]]) then exit;
if (pass[l[x]])and(not pass[r[x]])  then
 begin
  for i:=2 to m do
  dp[x,i]:=dp[r[x],i-1]+dp[x,1];
  exit;
 end;
if (not pass[l[x]])and(pass[r[x]]) then
 begin
  for i:=2 to m do
  dp[x,i]:=dp[l[x],i-1]+dp[x,1];
  exit;
 end;
for i:=m downto 2 do
for j:=i downto 1 do
dp[x,i]:=max(dp[x,i],dp[x,j]+dp[r[x],i-j]);
for i:=m downto 2 do
for j:=i downto 1 do
dp[x,i]:=max(dp[x,i],dp[x,j]+dp[l[x],i-j]);
end;

begin
assign(input,'key.in');reset(input);
readln(n,m);
for i:=1 to n-1 do
 begin
 readln(x,y);
 new(q);
 q^.id:=y;q^.next:=ln[x];ln[x]:=q;
 new(q);
 q^.id:=x;q^.next:=ln[y];ln[y]:=q;
 end;
for i:=1 to n do
read(dat[i]);
ready(1);
for i:=2 to n do
 begin
 fillchar(pass,sizeof(pass),false);
 fillchar(dp,sizeof(dp),0);
 tree1(i);
 tree2(1);
 for j:=0 to m do
  ans:=max(ans,dp[1,j]+dp[i,m-j+1]);
 end;
writeln(ans);
end.
