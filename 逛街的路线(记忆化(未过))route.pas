program route;
const maxn=100000;
type link=^dfsd;
  dfsd=record
  id:integer;
  next:link;
  end;
var ln:array[0..201]of link;
    time:array[0..maxn]of integer;
    zz:array[0..maxn]of longint;
    id:array[0..maxn]of integer;
    ind:array[0..201]of integer;
    dp:array[0..201,0..200]of longint;
    pc:array[0..maxn]of set of 0..255;
   ans2,x,y,i,j,k,n,m,t,w,ans:longint;
   q:link;
begin
assign(input,'route.in');
reset(input);
assign(output,'route.out');rewrite(output);
readln(n,m,k);
for i:=1 to n do
 read(ind[i]);
for i:=1 to k do
  begin
  readln(x,y);
  new(q);
  q^.id:=x;
  q^.next:=ln[y];
  ln[y]:=q;
  new(q);
  q^.id:=y;
  q^.next:=ln[x];
  ln[x]:=q;
  end;
close(input);
t:=0;
w:=1;
time[1]:=0;
id[1]:=0;
pc[1]:=[0];
fillchar(dp,sizeof(dp),$f7);
dp[0,0]:=0;
repeat
 t:=t+1;
 if t>maxn then t:=1;
 q:=ln[id[t]];
 while q<>nil do
  begin
  if (not(q^.id in pc[t]))and(time[t]<m)and(q^.id<>0)
  and(dp[q^.id,time[t]+1]<zz[t]+ind[q^.id])and(q^.id<>n+1) then
   begin
     w:=w+1;
     if w>maxn then w:=1;
     time[w]:=time[t]+1;
     id[w]:=q^.id;
     pc[w]:=pc[t]+[q^.id];
     zz[w]:=zz[t]+ind[q^.id];
     dp[q^.id,time[t]+1]:=zz[t]+ind[q^.id];
  end;
 if (time[t]<=m)and(zz[t]>ans)and(q^.id=n+1) then
  begin ans:=zz[t];ans2:=time[t];end;
  q:=q^.next;
  end;
until t=w;
writeln(ans,' ',ans2);
close(output);
end.
