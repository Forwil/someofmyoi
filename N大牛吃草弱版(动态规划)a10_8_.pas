program a10_8_;
var dp:array[1..2,0..1502,0..1502]of longint;
    dp2:array[1..2,0..1502,0..1502]of longint;
    sum:array[-200..1601,-200..1601]of longint;
    xx,yy,q,p,x,y,i,j,k,n,m,ans,qq,pp:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
readln(n,m,k);
for i:= 1 to n do
 begin
  for j:=1 to m do
   begin
   read(x);
   sum[i,j]:=sum[i-1,j]+sum[i,j-1]-sum[i-1,j-1]+x;
   end;
  for j:=1 to m do
   begin
   dp[1,i,j]:=max(dp[1,i-1,j],dp[1,i,j-1]);
   dp[2,i,j]:=max(dp[2,i-1,j],dp[2,i,j-1]);
   if i-k>=0 then
   dp[2,i,j]:=max(dp[2,i,j],dp[2,i-k,m]);
   x:=sum[i,j]-sum[i-k,j]-sum[i,j-k]+sum[i-k,j-k];
   if (i-k>=0)and(j-k>=0) then
   begin
   dp[1,i,j]:=max(dp[1,i,j],x);
   dp[2,i,j]:=max(dp[2,i,j],x+max(dp[1,i-k,m],dp[1,i,j-k]));
   x:=dp[2,i,j];
   end;
   end;

  for j:=m downto 1 do
   begin
   dp2[1,i,j]:=max(dp2[1,i-1,j],dp2[1,i,j+1]);
   dp2[2,i,j]:=max(dp2[2,i-1,j],dp2[2,i,j+1]);
   if i-k>=0 then
   dp2[2,i,j]:=max(dp2[2,i,j],dp[2,i-k,1]);
   x:=sum[i,j+k-1]-sum[i,j-1]-sum[i-k,j+k-1]+sum[i-k,j-1];
   if (j+k-1<=m)and(i-k>=0) then
    begin
    dp2[1,i,j]:=max(dp2[1,i,j],x);
    dp2[2,i,j]:=max(dp2[2,i,j],x+max(dp2[1,i-k,1],dp2[1,i,k+j]));
    xx:=dp[1,i,j-1];
    yy:=dp2[1,i,j+k];
    xx:=xx+yy;
    qq:=dp[2,i,j-1];
    pp:=dp2[2,i,j+k];
    qq:=max(qq,pp);
    qq:=max(qq,xx);
    if x+qq>ans then
    ans:=x+qq;
    end;
   end;
 end;
writeln(ans);
end.
