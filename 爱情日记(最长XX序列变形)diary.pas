program diary;
var ind:array[0..100000]of longint;
    dp:Array[0..100000]of longint;
    p:Array[0..100000]of longint;
    x,i,j,k,m,n,w,t,max,mi:longint;
begin
assign(input,'diary.in');
reset(input);
assign(output,'diary.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
 readln(ind[i]);
 p[0]:=maxlongint;
for i:=n downto 1 do
 begin
  t:=1;w:=k;
   repeat
     mi:=(w+t) shr 1;
     if p[mi]>=ind[i] then t:=mi+1
     else w:=mi;
   until t=w;
  if (p[t]<=ind[i])and(p[t-1]>=ind[i]) then
  begin
  dp[i]:=t;
  p[t]:=ind[i];
  end;
 end;
if p[k]=0 then writeln(-1)
else
begin
t:=0;
m:=0;
for i:=1 to n do
 begin
 if dp[i]=k-t then
 begin
 writeln(ind[i]-m);
 t:=t+1;
 m:=ind[i];
 if t=k then break;
 end;
 end;
end;
  close(output);
end.
