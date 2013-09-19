program a10_8;
var dp:array[0..100001]of  int64;
    x,y,w:Array[0..100001]of longint;
   i,j,k,n,m:longint;
   xx,yy,dis,now:int64;
function min(a,b:int64):int64;
begin if a>B then min:=b else min:=a;end;
begin
readln(m);
readln(n);
for i:=1 to n do
 readln(x[i],y[i],w[i]);
fillchar(dp,sizeof(dp),$7f);
dp[0]:=0;
for i:=1 to n do
begin
 now:=0;  dis:=0;
 xx:=0;    yy:=0;
 for j:=i-1 downto 0 do
  begin
   now:=now+w[j+1];
   dis:=dis+abs(xx-x[j+1])+abs(yy-y[j+1]);
   xx:=x[j+1];yy:=y[j+1];
   if now>m then break;
   dp[i]:=min(dp[i],dp[j]+dis+xx+yy);
  end;
end;
writeln(dp[n]);
end.
