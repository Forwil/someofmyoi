program goblin;
var dp:Array[0..1000000]of longint;
     p:Array[0..1000000,1..2]of longint;
    a,b:array[0..100]of longint;
    ind:array[0..100,0..2]of longint;
    out:array[0..100]of longint;
  t,i,j,k,n,m,ans,nn:longint;
begin
assign(input,'goblin.in');reset(input);
assign(output,'goblin.out');rewrite(output);
readln(n,m);
nn:=n;
t:=0;
for i:=1 to m do
 begin
 readln(a[i],b[i]);
 if a[i]<b[i] then
  begin
  t:=t+1;
  ind[t,1]:=a[i];
  ind[t,2]:=b[i]-a[i];
  ind[t,0]:=i;
  end;
 end;
for i:=t downto 1 do
for j:=0 to n do
 if j+ind[i,1]<=n then
 if dp[j+ind[i,1]]<=dp[j]+ind[i,2] then
   begin
   dp[j+ind[i,1]]:=dp[j]+ind[i,2];
   p[j+ind[i,1],1]:=j;
   p[j+ind[i,1],2]:=ind[i,0];
   if dp[j+ind[i,1]]>=ans then
    begin
    ans:=dp[j+ind[i,1]];
    k:=j+ind[i,1];
    end;
   end;
n:=n+ans;
i:=k;
while k<>0 do
 begin
  inc(out[p[k,2]]);
  k:=p[k,1];
 end;

//-------------------------------------------------
  fillchar(dp,sizeof(dp),0);
  fillchar(p,sizeof(p),0);
  t:=0;
  ans:=0;
for i:=1 to m do
  if a[i]>b[i] then
  begin
  t:=t+1;
  ind[t,1]:=b[i];
  ind[t,2]:=a[i]-b[i];
  ind[t,0]:=i;
  end;
for i:=t downto 1 do
for j:=0 to n do
 if j+ind[i,1]<=n then
 if dp[j+ind[i,1]]<=dp[j]+ind[i,2] then
   begin
   dp[j+ind[i,1]]:=dp[j]+ind[i,2];
   p[j+ind[i,1],1]:=j;
   p[j+ind[i,1],2]:=ind[i,0];
   if dp[j+ind[i,1]]>=ans then
    begin
    ans:=dp[j+ind[i,1]];
    k:=j+ind[i,1];
    end;
   end;
i:=k;
while k<>0 do
 begin
  inc(out[p[k,2]]);
  k:=p[k,1];
 end;
 writeln(ans+n-nn);
for i:=1 to m do
if (out[i]=0)or(a[i]=b[i]) then writeln('Buy 0')
else
if a[i]<b[i] then writeln('Buy ',out[i],' from Alliance')
else writeln('Buy ',out[i],' from Horde');
close(output);
end.
