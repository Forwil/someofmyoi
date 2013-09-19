program c9_11;
const mm:array[0..12]of byte=
 (0,31,28,31,30,31,30,31,31,30,31,30,31);
type link=^fd;
 fd=record
 id,vi:longint;
 nexT:link;
 end;
var ln:array[0..370]of link;
    p:Array[0..101]of longint;
    mo:array[0..12]of byte;
    sum:array[0..12]of longint;
    dp:array[0..370,0..100]of longint;
    zz:array[0..100]of longint;
   x,z,t,y,i,j,k,n,m,o:longint;
   s,ss:string;
   q:link;
function min(a,b:longint):longint;
begin if a>b then exit(b) else exit(a)end;
begin
assign(input,'c.in');reset(input);
mo:=mm;
readln(k,t);
readln(y);
if (y mod 100<>0)and(y mod 4=0) then  mo[2]:=mo[2]+1;
if (y mod 100=0)and(y mod 400=0) then mo[2]:=mo[2]+1;
for i:=1 to 12 do
 sum[i]:=sum[i-1]+mo[i];
readln(o);
for i:=1 to o do
 begin
 new(q);
 readln(s);
 ss:=copy(s,1,pos('/',s)-1);
 delete(s,1,pos('/',s));
 val(ss,x,j);
 ss:=copy(s,1,pos(' ',s)-1);
 delete(s,1,pos(' ',s)+3);
 val(ss,y,j);
 m:=sum[x-1]+y;
 ss:=copy(s,1,pos('/',s)-1);
 delete(s,1,pos('/',s));
 val(ss,x,j);
 ss:=copy(s,1,pos(' ',s)-1);
 delete(s,1,pos(' ',s));
 val(s,z,j);
 val(ss,y,j);
 q^.id:=m;
 q^.vi:=z;
 q^.next:=ln[sum[x-1]+y];
 ln[sum[x-1]+y]:=q;
  end;
for i:=1 to t do
 read(p[i]);
 dp[0,0]:=1;
for i:=1 to sum[12] do
 begin
 dp[i]:=dp[i-1];
 q:=ln[i];
  while q<>nil do
   begin
   x:=1;
   y:=1;
   fillchar(zz,sizeof(zz),0);
   zz[0]:=min(dp[q^.id,0]+dp[i,0],k);
   j:=1;
   while j<=zz[0] do
   begin
    if (x<=dp[q^.id,0])and
    (dp[q^.id,x]+(p[q^.vi])*(i-q^.id)>dp[i,y]) then
      begin
      zz[j]:=dp[q^.id,x]+(p[q^.vi])*(i-q^.id);
      inc(x);
      end
      else
      begin
      zz[j]:=dp[i,y];
      inc(y);
      end;
      if (j>1)and(zz[j]=zz[j-1]) then j:=j-1;
      j:=j+1;
    if (x>dp[q^.id,0])and(y>dp[i,0]) then break;
   end;
   if zz[0]>j then zz[0]:=j;
   dp[i]:=zz;
   q:=q^.next;
   end;
 end;

 if dp[sum[12],0]=k then
 writeln(dp[sum[12],k])
 else
 writeln(-1);
end.
