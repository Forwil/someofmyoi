program kings;
const ax:array[1..8]of -1..1=(1,1,1,0,0,-1,-1,-1);
      ay:Array[1..8]of -1..1=(0,1,-1,1,-1,1,0,-1);
var
    mem:Array[1..8,1..8,0..1024]of longint;
     dp:Array[0..10,0..1024]of longint;
    k,p:Array[0..12,1..2]of integer;
      b:array[0..9,0..9]of integer;
      z:array[0..8*8*1024,0..2]of integer;
   nn,now,o,t,w,tp,tk,i,j,n,m,x,y:longint;
   ch:char;
function min(a,b:longint):longint;
begin if a>b then min:= b else min:=a;end;
begin
assign(input,'kings.in');reset(input);
assign(output,'kings.out');rewrite(output);
readln(nn);
for m:=1 to nn do
begin
fillchar(b,sizeof(b),0);
 tp:=0;
 tk:=0;
 for i:=1 to 8 do
 for j:=1 to 8 do
  begin
  read(ch);
  if ch='K' then
   begin
   inc(tk);
   k[tk,1]:=i;
   k[tk,2]:=j;
   end;
  if ch='P' then
   begin
   inc(tp);
   b[i,j]:=tp;
   p[tp,1]:=i;
   p[tp,2]:=j;
   end;
  if j=8 then readln;
  end;

fillchar(dp,sizeof(dp),63);
for i:=1 to tk do
 begin
 fillchar(mem,sizeof(mem),63);
 w:=1;
 t:=0;
 z[w,1]:=k[i,1];
 z[w,2]:=k[i,2];
 mem[z[w,1],z[w,2],0]:=0;
 repeat
 t:=t+1;
 if dp[i,z[t,0]]>mem[z[t,1],z[t,2],z[t,0]] then
   dp[i,z[t,0]]:=mem[z[t,1],z[t,2],z[t,0]];
 for o:=1 to 8 do
  begin
  x:=z[t,1]+ax[o];
  y:=z[t,2]+ay[o];
  if (x<=0)or(y<=0)or(x>=9)or(y>=9) then continue;
  now:=z[t,0];
  if b[x,y]<>0 then now:=now or (1 shl (b[x,y]-1));
  if mem[x,y,now]>mem[z[t,1],z[t,2],z[t,0]]+1 then
   begin
   mem[x,y,now]:=mem[z[t,1],z[t,2],z[t,0]]+1;
   w:=w+1;
   z[w,1]:=x;
   z[w,2]:=y;
   z[w,0]:=now;
   end;
  end;
 until t>=w;

 for x:=1 shl tp-1 downto 0 do
 for y:=0 to x do
 dp[i,x]:=min(dp[i,x],dp[i,y]+dp[i-1,x xor y]);
 end;
 writeln(dp[tk,1 shl tp -1]);
end;
close(output);
end.
