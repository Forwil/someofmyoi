program moon;
const zero=1e-8;
var dp:array[0..1,0..5001,0..10]of longint;
  x,y,z,i,j,o,k,n,r,l,s,now,ans:longint;
rr:real;
max:int64;
flag:boolean;
procedure done(x : int64; var max : int64);
  var
 y : extended;
 begin
 y:=sqrt(r*r-x*x);
 max:=max+trunc(y)+ord(frac(y)>zero);
 end;
procedure prepare;
  var
     i : longint;
 begin
  max:=0;
 for i:=0 to r-1 do
  done(i,max);
 max:=max*4;
end;
begin
assign(input,'moon.in');reset(input);
assign(output,'moon.out');rewrite(output);
readln(n,k,r,s);
prepare;
fillchar(dp,sizeof(dp),$ff);
dp[0,s,0]:=0;
for i:=1 to n do
 begin
 now:=i and 1;
 if i<>1 then
 fillchar(dp[now],sizeof(dp[now]),$ff);
 readln(x,z,y);
  for j:=s downto 1 do
  for l:=0 to k-1 do
    if dp[1-now,j,l]<>-1 then
     begin
     o:=j-z;
     if o>s then o:=s;
     if o>0 then
     if dp[now,o,0]<dp[1-now,j,l]+x then
        dp[now,o,0]:=dp[1-now,j,l]+x;

     if dp[1-now,j,l]+x>ans then
    ans:=dp[1-now,j,l]+x;
     o:=j+y;
     if o>s then o:=s;
     if o>0 then o:=o-z;
     if o>s then o:=s;
     if o>0 then
     if dp[now,o,l+1]<dp[1-now,j,l] then
       dp[now,o,l+1]:=dp[1-now,j,l];

     if dp[now,j,0]<dp[1-now,j,l] then
        dp[now,j,0]:=dp[1-now,j,l];
     end;
 end;
 if max-(ans)<=0 then writeln('We''ll win the game!')
 else
 begin
 if ans<0 then writeln(max)
 else
 writeln((max-ans));
 end;
close(output);
end.
