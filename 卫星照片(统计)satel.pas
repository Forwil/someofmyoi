program satel;
const ax:Array[1..4]of -1..1=(1,0,-1,0);
      ay:Array[1..4]of -1..1=(0,1,0,-1);
var dat,sum,b:Array[0..100,0..100]of integer;
     mx,my,lx,ly:array[0..6000]of integer;
    ans,t,i,j,k,n,m,x,y:longint;
    ch:char;

procedure go(x,y:longint);
var i:longint;
begin
if (dat[x,y]=0)or(b[x,y]<>0) then exit;
b[x,y]:=t;
if x>mx[t] then mx[t]:=x;
if x<lx[t] then lx[t]:=x;
if y>my[t] then my[t]:=y;
if y<ly[t] then ly[t]:=y;
for i:=1 to 4 do
 go(x+ax[i],y+ay[i]);
end;

begin
assign(input,'satel.in');reset(input);
assign(output,'satel.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(ch);
 if ch='#' then
   begin
   dat[i,j]:=1;
   sum[i,j]:=sum[i,j-1]+sum[i-1,j]-sum[i-1,j-1]+1;
   end;
 if j=m then readln;
 end;
fillchar(mx,sizeof(mx),0);
fillchar(my,sizeof(my),0);
fillchar(lx,sizeof(lx),63);
fillchar(ly,sizeof(ly),63);

for i:=1 to n do
for j:=1 to m do
if (dat[i,j]=1)and(b[i,j]=0) then
 begin
 t:=t+1;
 go(i,j);
 end;

for i:=1 to t do
 begin
 x:=mx[i]-lx[i]+1;
 y:=my[i]-ly[i]+1;
 if sum[mx[i],my[i]]
 -sum[mx[i],ly[i]-1]
 -sum[lx[i]-1,my[i]]
 +sum[lx[i]-1,ly[i]-1]=x*y then
 inc(ans);
 end;
writeln(ans);
writeln(t-ans);
close(output);
end.
