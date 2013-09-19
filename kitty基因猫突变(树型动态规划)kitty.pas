program kitty;
var  dp:Array[0..128,0..128,0..30]of longint;
    len:Array[0..128,0..128,0..30]of longint;
      c:array[0..128]of longint;
    tot:Array[0..128,0..128]of integer;
   i,j,k,n,m,ans:longint;
   s:string;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;

procedure go(l,r:longint);
var i,j,mi,ss:longint;
begin
 if l<r then
  begin
  go(l,(l+r)shr 1);
  go((l+r)shr 1+1,r);
  end;
if l=r then
 begin
 if s[l]='0' then
 begin
 dp[l,r,1]:=c[l];
 len[l,r,1]:=1;
 end;
 dp[l,r,0]:=0;
 len[l,r,0]:=1;
 exit;
 end;
 mi:=(l+r)shr 1;
for i:=0 to min(m,tot[l,r]) do dp[l,r,i]:=maxlongint;
for i:=0 to min(m,tot[l,r]) do
for j:=0 to min(i,tot[l,mi]) do
if i-j<=tot[mi+1,r]then
 begin
 ss:=len[l,mi,j]+len[mi+1,r,i-j]+1;
 if i=tot[l,r] then ss:=1;
 if (i=0)and(pos('1',copy(s,l,r-l+1))=0)then ss:=1;
 if dp[l,r,i]+len[l,r,i]>dp[l,mi,j]+dp[mi+1,r,i-j]+ss then
  begin
   dp[l,r,i]:=dp[l,mi,j]+dp[mi+1,r,i-j];
   len[l,r,i]:=ss;
  end;
 end;
end;

begin
assign(input,'kitty.in');reset(input);
assign(output,'kitty.out');rewrite(output);
readln(n,m);
n:=1 shl n;
read(s);
for i:=1 to n do
for j:=i to n do
if s[j]='0' then tot[i,j]:=tot[i,j-1]+1
else tot[i,j]:=tot[i,j-1];
for i:=1 to n do read(c[i]);
go(1,n);
writeln(dp[1,n,m]+len[1,n,m]);
close(output);
end.
