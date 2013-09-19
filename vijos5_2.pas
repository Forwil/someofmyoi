program vijos5_2;
 var dp:array[0..1000]of longint;
     pc:array[0..1000]of set of 0..255;
    ind:array[0..60,0..2]of longint;
    r:array[0..60]of boolean;
    sup:array[0..30]of integer;
    sum,s,t,a,b,i,j,x,y,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
 begin
 assign(input,'rival.in');
 reset(input);
 assign(output,'rival.out');rewrite(output);
readln(a,b);
readln(n,m);
for i:=1 to n do
begin
readln(ind[i,1],ind[i,2]);
sum:=sum+ind[i,1];
end;
for i:=1 to m do
begin
read(t,x);
sup[i]:=t;
r[t]:=true;
for j:=1 to x do
 begin
  read(y);
  ind[y,0]:=t;
 end;
end;
dp[0]:=0;
pc[0]:=[];
s:=0;
for i:=1 to m do
 for j:=s downto 0 do
 if (dp[j]>0)or(j=0) then
 begin
 if ind[sup[i],2]+j<=a then
 begin
 dp[ind[sup[i],2]+j]:=max(dp[ind[sup[i],2]+j],dp[j]+ind[sup[i],1]);
 s:=max(s,ind[sup[i],2]+j);
 pc[ind[sup[i],2]+j]:=pc[j]+[sup[i]];
 if ans< dp[ind[sup[i],2]+j] then
    ans:=dp[ind[sup[i],2]+j];
 end
 else
 if ind[sup[i],2]*2+j<=a+b then
 begin
 dp[ind[sup[i],2]*2+j]:=max(dp[ind[sup[i],2]*2+j],dp[j]+ind[sup[i],1]);
 s:=max(s,ind[sup[i],2]*2+j);
 pc[ind[sup[i],2]*2+j]:=pc[j]+[sup[i]];
 if ans< dp[ind[sup[i],2]*2+j] then
    ans:=dp[ind[sup[i],2]*2+j];
 end;
 end;
for i:=1 to n do
 if r[i]=false then
  for j:=s downto 0 do
   if ((dp[j]>0)or(j=0))and((ind[i,0] in pc[j])or(ind[i,0]=0)) then
    begin
      if ind[i,2]+j<=a then
      begin
       dp[ind[i,2]+j]:=max(dp[ind[i,2]+j],dp[j]+ind[i,1]);
       s:=max(s,ind[i,2]+j);
       if ans< dp[ind[i,2]+j] then
          ans:=dp[ind[i,2]+j];
      end
    else
  if ind[i,2]*2+j<=a+b then
    begin
    dp[ind[i,2]*2+j]:=max(dp[ind[i,2]*2+j],dp[j]+ind[i,1]);
    s:=max(s,ind[sup[i],2]*2+j);
  if  ans <dp[ind[i,2]*2+j] then
      ans:=dp[ind[i,2]*2+j];
    end;
    end;
    writeln(sum-ans);
    close(output);
end.
