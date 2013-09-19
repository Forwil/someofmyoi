program c10_23;
var  b,e:Array[0..100000]of longint;
    DP:array[0..100000,0..5]of longint;
  ans,t,i,j,k,n,m:longint;
  ss,s:ansistring;
function max(a,b:longint):longint;
begin if a>b then exit(a) else exit(b);end;
begin
assign(input,'c.in');reset(input);
assign(output,'c.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(s);
 delete(s,1,pos(':',s));
 ss:=copy(s,1,pos('-',s)-1);
 delete(s,1,pos('-',s));
 val(ss,k,j);
 inc(b[k]);
 val(s,k,j);
 inc(e[k]);
 end;
 t:=0;
 k:=0;
 for i:=1 to n do
  begin
   k:=k+1;
   inc(t,b[i-1]);dec(t,e[i-1]);
   dp[i,1]:=dp[i-1,0];
   dp[i,2]:=dp[i-1,1];
   dp[i,3]:=dp[i-1,2];
   dp[i,4]:=dp[i-1,3];
   dp[i,5]:=dp[i-1,4];
   dp[i,0]:=dp[i-1,5];
   if t=0 then
   dp[i,1]:=max(max(max(dp[i,1],dp[i-1,0]+1),dp[i-1,1]+1),dp[i-1,2]+1);
  end;
  ans:=max(max(dp[n,0],dp[n,1]),dp[n,2]);
  if ans=0 then writeln(-1)
  else  writeln(ans);
 close(output);
end.
