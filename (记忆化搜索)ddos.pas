program ddos;
const ax:array[0..3]of -1..1=(-1,0,1,0);
      ay:array[0..3]of -1..1=(0,-1,0,1);
var dp:array[0..101,0..101,0..3]of longint;
     b:array[0..101,0..101]of boolean;
    ans,i,j,k,n,m,x,y,xx,yy:longint;
    ch:char;

procedure go(x,y,f,z:longint);
begin
if z<dp[x,y,f] then dp[x,y,f]:=z
else exit;
if b[x+ax[f],y+ay[f]] then go(x+ax[f],y+ay[f],f,z);
go(x,y,(f+1) mod 4,z+1);
go(x,y,(f-1+4) mod 4,z+1);
end;

begin
assign(input,'ddos.in');reset(input);
assign(output,'ddos.out');rewrite(output);
readln(n);
fillchar(b,sizeof(b),false);
for i:=1 to n do
for j:=1 to n do
 begin
 read(ch);
 if ch=' ' then read(ch);
 begin
 if ch='.' then b[i,j]:=true;
 if ch='A' then
 begin x:=i;y:=j;b[i,j]:=true;end;
 if ch='B' then
 begin xx:=i;yy:=j;b[i,j]:=true;end;
 end;
 if j=n then readln;
 end;

fillchar(dp,sizeof(dp),63);
ans:=maxlongint;
go(x,y,0,0);
go(x,y,1,0);
go(x,y,2,0);
go(x,y,3,0);
if dp[xx,yy,0]<ans then ans:=dp[xx,yy,0];
if dp[xx,yy,1]<ans then ans:=dp[xx,yy,1];
if dp[xx,yy,2]<ans then ans:=dp[xx,yy,2];
if dp[xx,yy,3]<ans then ans:=dp[xx,yy,3];
writeln(ans);
close(output);
end.
