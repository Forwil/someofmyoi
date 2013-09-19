program guard;
type link=^cvx;
 cvx=record
 id:longint;
 next:link;
 end;
var dp:array[0..1510,0..2]of longint;
    ind:array[0..1510]of longint;
    ln:array[0..1510]of link;
    b:Array[0..1510]of boolean;
   root,y,tot,i,j,k,n,m,x:longint;
   q:link;
function minf(a,b:longint):longint;
begin if a>b then minf:=b else minf:=a; end;
procedure go(x:longint);
var q:link;
   i,tot,min,k:longint;
begin
if ln[x]=nil then
 begin
  dp[x,1]:=ind[x];
  dp[x,0]:=99999999;
  dp[x,2]:=0;
 end
else
 begin
 q:=ln[x];
 tot:=0;
 min:=maxlongint;
 while q<>nil do
   begin
   i:=q^.id;
   go(i);
   dp[x,1]:=dp[x,1]+minf(minf(dp[i,1],dp[i,0]),dp[i,2]);
   dp[x,2]:=dp[x,2]+dp[i,0];
   tot:=tot+minf(dp[i,0],dp[i,1]);
   if dp[i,1]-minf(dp[i,0],dp[i,1])<min then
    min:=dp[i,1]-minf(dp[i,0],dp[i,1]);
    q:=q^.next;
   end;
 dp[x,1]:=dp[x,1]+ind[x];
 dp[x,0]:=tot+min;
 end;
end;
begin
assign(input,'guard.in');reset(input);
assign(output,'guard.out');rewrite(output);
 readln(n);
 tot:=0;
 for i:=1 to n do
  begin
  read(x);
  read(ind[x]);
  read(k);
  for j:=1 to k do
   begin
   read(y);
   b[y]:=true;
   tot:=tot+y;
   new(q);
   q^.id:=y;
   q^.next:=ln[x];
   ln[x]:=q;
   end;
  end;
root:=(n*(n+1))div 2-tot;
 go(root);
 writeln(minf(dp[root,1],dp[root,0]));
 close(output);
end.
