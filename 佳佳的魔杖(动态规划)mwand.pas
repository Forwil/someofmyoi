program mwand;
var dp:array[0..1,0..1000]of qword;
    len:array[0..1000]of longint;
    vi:array[0..1000]of longint;
    lo,hi,v,i,j,k,n,m,z,now,last:longint;
function max(a,b:qword):qword;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'mwand.in');
reset(input);
assign(output,'mwand.out') ;rewrite(output);
readln(n,lo,hi);
for i:=1 to n  do
read(len[i]);
for i:=1 to n do
read(vi[i]);
for i:=1 to n do
  begin
  v:=0;
  z:=0;
  now:=i and 1;
  last:=1-now;
  for j:=i to n do
     begin
     z:=z+len[j];
     v:=v+vi[j];
     dp[now,j]:=dp[last,j];
     if (z>=lo)and(z<=hi) then
       dp[now,j]:=max(dp[last,j-1]+v,dp[now,j]);
     if z>hi then
       dp[now,j]:=dp[now,j-1];
     end;
  end;
writeln(dp[n and 1,n]);
close(output);
end.
