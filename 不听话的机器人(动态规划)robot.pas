program robot;
const ax:array[1..4]of -1..1=(-1,0,1,0);
      ay:array[1..4]of -1..1=(0,1,0,-1);
var dp:array[0..1,0..100,0..100,1..4]of longint;
    di:array[0..11000,1..2]of longint;
    b:array[0..1,0..101,0..101,1..4]of boolean;
 l,z,i,j,k,n,m,x,y,o,ii,r,ans,now,last,t:longint;
  ch:char;
  s:string;
begin
assign(input,'robot.in');
reset(input);
assign(output,'robot.out');rewrite(output);
readln(n,m,x,y);
t:=0;
for i:=1 to n do
for j:=1 to n do
 begin
 read(ch);
 if ch='.' then
 begin
 inc(t);
 di[t,1]:=i;
 di[t,2]:=j;
 end;
 if j=n then readln;
 end;
fillchar(b,sizeof(b),false);
fillchar(dp,sizeof(dp),63);
r:=dp[0,0,0,1];
dp[0,x,y,1]:=0;
b[0,x,y,1]:=true;
for i:=1 to m do
 begin
  readln(s);
  now:=i and 1;
  last:=1-now;
  if (s='LEFT') or (s ='RIGHT') then
       begin
       if s='LEFT' then o:=1;
       if s='RIGHT'then o:=-1;
       for ii:=1 to t do
       begin
        j:=di[ii,1];
        z:=di[ii,2];
        for l:=1 to 4 do
          begin
           dp[now,j,z,l]:=r;
           b[now,j,z,l]:=false;
           if b[last,j,z,(l+o+3)mod 4+1] then
           if dp[last,j,z,(l+o+3)mod 4+1]<dp[now,j,z,l] then
              dp[now,j,z,l]:=dp[last,j,z,(l+o+3)mod 4+1];
           if b[last,j,z,l] then
           if dp[last,j,z,l]+1<dp[now,j,z,l] then
           dp[now,j,z,l]:=dp[last,j,z,l]+1;
           k:=dp[now,j,z,l];
           if dp[now,j,z,l]<>r then b[now,j,z,l]:=true;
          end;
        end;
       end;
 if (s='FORWARD')or(s='BACK') then
       begin
       if s='FORWARD'then o:=2;
       if s='BACK' THEN o:=0;
      for ii:=1 to t do
      begin
       j:=di[ii,1];
       z:=di[ii,2];
        for l:=1 to 4 do
          begin
           dp[now,j,z,(l+o-1)mod 4+1]:=r;
           b[now,j,z,(l+o-1)mod 4 +1]:=false;
           x:=ax[l]+j;
           y:=ay[l]+z;
           if b[last,x,y,(l+o-1)mod 4+1] then
           if dp[last,x,y,(l+o-1)mod 4+1]<dp[now,j,z,(l+o-1)mod 4+1] then
              dp[now,j,z,(l+o-1)mod 4+1]:=dp[last,x,y,(l+o-1)mod 4+1];
           if dp[last,j,z,(l+o-1) mod 4+1]+1<dp[now,j,z,(l+o-1)mod 4+1] then
              dp[now,j,z,(l+o-1)mod 4+1]:=dp[last,j,z,(l+o-1) mod 4+1]+1;
           if dp[now,j,z,(l+o-1)mod 4+1]<>r then
               b[now,j,z,(l+o-1)mod 4+1]:=true;
          end;
      end;
      end;
 end;
 ans:=maxlongint;
for i:=1 to n do
for j:=1 to n do
for l:=1 to 4 do
if dp[m and 1,i,j,l]<ans then
   ans:=dp[m and 1,i,j,l];
   writeln(ans);
   close(output);
end.
