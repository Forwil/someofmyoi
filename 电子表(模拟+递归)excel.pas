program excel;
const word:array['A'..'Z']of integer=(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
var tab:array[0..26,0..100]of longint;
    biao:array[0..26,0..100]of integer;
    p:array[0..26,0..100]of integer;
    sum:array[0..100,0..6]of longint;
    avg:array[0..100,0..6]of longint;
   i,j,k,n,m,s,x,y,xx,yy,x1,y1,x2,y2,z,tsum,tavg:longint;
   ch:char;
   s1,s2,s3:string;
procedure   gen(x,y:longint);
var z,t,i,j,l:longint;
begin
z:=0;
if x=1 then
 for i:=sum[y,1] to sum[y,2] do
 for j:=sum[y,3] to sum[y,4] do
  if biao[i,j]=0 then  z:=z+tab[i,j]
  else
  begin
  gen(biao[i,j],p[i,j]);
  z:=z+tab[i,j];
  end
else
 for i:=avg[y,1] to avg[y,2] do
 for j:=avg[y,3] to avg[y,4] do
  if biao[i,j]=0 then z:=z+tab[i,j]
  else
  begin
  gen(biao[i,j],p[i,j]);
  z:=z+tab[i,j];
  end;
if x=1 then
tab[sum[y,5],sum[y,6]]:=z;
if x=2 then
tab[avg[y,5],avg[y,6]]:=trunc(z/((avg[y,2]-avg[y,1]+1)*(avg[y,4]-avg[y,3]+1)));
end;
begin
assign(input,'excel.in');
reset(input);
assign(output,'excel.out') ;
rewrite(output);
readln(n,m);
readln(s);
tsum:=0;
tavg:=0;
for i:=1 to s do
 begin
  readln(s1);
  ch:=s1[1];
  x:=word[ch];
  delete(s1,1,1);
  s2:=copy(s1,1,pos(' ',s1)-1);
  val(s2,y,j);
  delete(s1,1,pos(' ',s1));
  s2:=copy(s1,1,pos(' ',s1)-1);
  delete(s1,1,pos(' ',s1));
  if s2='input'  then  begin
                       val(s1,k,j);
                       tab[x,y]:=k;
                       biao[x,y]:=0;
                       for xx:=1 to n do
                       for yy:=1 to m do
                       if biao[xx,yy]<>0 then gen(biao[xx,yy],p[xx,yy]);
                       end
  else
  if s1='output' then  writeln(tab[x,y])
  else
  if s2='sum' then begin
                   ch:=s1[1];
                   delete(s1,1,1);
                   x1:=word[ch];
                   s3:=copy(s1,1,pos(' ',s1)-1);
                   delete(s1,1,pos(' ',s1));
                   val(s3,k,j);
                   y1:=k;
                   ch:=s1[1];
                   delete(s1,1,1);
                   x2:=word[ch];
                   val(s1,k,j);
                   y2:=k;
                   inc(tsum);
                   sum[tsum,1]:=x1;
                   sum[tsum,2]:=x2;
                   sum[tsum,3]:=y1;
                   sum[tsum,4]:=y2;
                   sum[tsum,5]:=x;
                   sum[tsum,6]:=y;
                   biao[x,y]:=1;
                   p[x,y]:=tsum;
                      for xx:=1 to n do
                       for yy:=1 to m do
                       if biao[xx,yy]<>0 then gen(biao[xx,yy],p[xx,yy]);
                   end
  else
  if s2='avg' then begin
                   ch:=s1[1];
                   delete(s1,1,1);
                   x1:=word[ch];
                   s3:=copy(s1,1,pos(' ',s1)-1);
                   delete(s1,1,pos(' ',s1));
                   val(s3,k,j);
                   y1:=k;
                   ch:=s1[1];
                   delete(s1,1,1);
                   x2:=word[ch];
                   val(s1,k,j);
                   y2:=k;
                   inc(tavg);
                   avg[tavg,1]:=x1;
                   avg[tavg,2]:=x2;
                   avg[tavg,3]:=y1;
                   avg[tavg,4]:=y2;
                   avg[tavg,5]:=x;
                   avg[tavg,6]:=y;
                   biao[x,y]:=2;
                   p[x,y]:=tavg;
                      for xx:=1 to n do
                       for yy:=1 to m do
                       if biao[xx,yy]<>0 then gen(biao[xx,yy],p[xx,yy]);
                   end;
  end;
  close(output);
end.
