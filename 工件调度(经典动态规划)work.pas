program work2;
var dp:array[0..600]of longint;
    t,p:Array[0..600]of longint;
   s,i,j,k,n,m:longint;

procedure out(x:longint);
var i:longint;
begin
if x<>0 then out(p[x]-1) else exit;
for i:=p[x] to x do
 begin
 if i<>X then write(t[i],' ')
 else writeln(t[i],' ');
 end;
end;

begin
assign(input,'work.in');reset(input);
assign(output,'work.out');rewrite(output);

readln(m,n);
for i:=1 to n do
 begin
 read(t[i]);
 dp[i]:=maxlongint shr 1;
 end;
dp[0]:=0;
for i:=1 to n do
begin
s:=t[i];
 for j:=i-1 downto 0 do
  begin
   if dp[i]>dp[j]+sqr(m-s) then
    begin
    dp[i]:=dp[j]+sqr(m-s);
    p[i]:=j+1;
    end;
   s:=s+1+t[j];
   if s>m then break;
  end;
end;
writeln(dp[n]);
out(n);
close(output);
end.
