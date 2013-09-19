program inquire;
var tab:array[0..50,0..50]of integer;
    h:array[0..32]of integer;
    sum:Array[0..50,0..50]of integer;
    T:array[0..32*32,1..2]of integer;
  ans,x,y,max,i,j,k,n,m,xx,yy:longint;
function p(kk,z,l,r:integer):integer;
begin
p:=(r-l+1+z-kk+1)*2;
if z=n then p:=p-(r-l+1);
if kk=1 then p:=p-(r-l+1);
if l=1 then p:=p-(z-kk+1);
if r=m then p:=p-(z-kk+1);
end;
procedure count(o:integer);
var i:integer;
begin
for i:=1 to m do if h[i]<>n then exit;
if o<ans then ans:=o;
end;
procedure go(x,o:integer);
var l,r,z,i,b,mm,min:longint;
    sz:array[0..32]of integer;
begin
if x<=k then
  begin
  min:=n;
  for i:=1 to m do
  if h[i]<min then begin min:=h[i];l:=i;end;
  b:=h[l]+1;
  for i:=b to n do
   for r:=l to m do
    begin
     if h[r]+1<>b then break;
     mm:=sum[i,r]-sum[i,l-1]-sum[b-1,r]+sum[b-1,l-1];
     if mm=1 then
      begin
      sz:=h;
      mm:=o+p(b,i,l,r);
      if mm>ans then break;
      for z:=l to r do h[z]:=i;
      go(x+1,mm);
      h:=sz;
      end else
    if mm>=2 then break;
    end;
  end
else count(o);
end;
begin
assign(input,'inquire.in');reset(input);
assign(output,'inquire.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(tab[i,j]);
 if tab[i,j]=1 then inc(k);
 sum[i,j]:=sum[i-1,j]+sum[i,j-1]-sum[i-1,j-1]+tab[i,j];
 end;
 ans:=maxlongint;
 go(1,0);
 writeln(ans div 2);
 close(output);
end.
