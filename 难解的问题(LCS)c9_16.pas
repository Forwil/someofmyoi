program c9_16;
var dp:array[0..300000]of longint;
    p:Array[0..300000]of longint;
    ind:Array[0..300000]of longint;
    mi,x,i,j,k,n,m,w,tt,ww:longint;
begin
readln(n,k);
for i:=1 to n do
read(ind[i]);
fillchar(p,sizeof(p),$7f);
p[0]:=-1;
w:=0;
for i:=1 to k-1 do
 if ind[i]<ind[k] then
  begin
  tt:=0;
  ww:=w;
  mi:=(tt+ww) shr 1;
  repeat
  if p[mi]>=ind[i] then   ww:=mi-1
  else
  begin
  dp[i]:=mi+1;
  tt:=mi+1;
  end;
  mi:=(tt+ww)shr 1;
  until tt>ww;
  if p[dp[i]]>ind[i] then
     p[dp[i]]:=ind[i];
  if dp[i]>w then w:=dp[i];
  end;
//---------------------------
  tt:=0;
  ww:=w;
  mi:=(tt+ww) shr 1;
  repeat
  if p[mi]>=ind[k] then   ww:=mi-1
  else
  begin
  dp[k]:=mi+1;
  tt:=mi+1;
  end;
  mi:=(tt+ww)shr 1;
  until tt>ww;

if p[dp[k]]>ind[k] then
   p[dp[k]]:=ind[k];
 if dp[k]>w then w:=dp[k];
//---------------------------
for i:=k+1 to n do
if ind[i]>ind[k] then
 begin
    tt:=0;
  ww:=w;
  mi:=(tt+ww) shr 1;
  repeat
  if p[mi]>=ind[i] then ww:=mi-1
  else
  begin
  dp[i]:=mi+1;
  tt:=mi+1;
  end;
  mi:=(tt+ww)shr 1;
  until tt>ww;
  if p[dp[i]]>ind[i] then
     p[dp[i]]:=ind[i];
  if dp[i]>w then w:=dp[i];
 end;
 writeln(w);
end.
