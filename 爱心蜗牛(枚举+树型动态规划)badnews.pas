program badnews;
type link=^ref;
  ref=record
  id:longint;
  next:link;
  end;
var ln:Array[0..1001]of link;
     time:array[0..1001]of longint;
     best:array[0..1001]of longint;
     son:array[0..1001]of longint;
     b:array[0..1001]of boolean;
    q:link;
    x,i,k,m,n,ans,t:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a end;
procedure dfs(x:longint);
var q:link;
   yy:array[0..500]of longint;
   tt,ii,jj:longint;
begin
b[x]:=false;
q:=ln[x];
time[x]:=0;
tt:=0;
while q<>nil do
  begin
  if b[q^.id] then
    begin
    dfs(q^.id);
    tt:=tt+1;
    yy[tt]:=time[q^.id]+1;
    end;
  q:=q^.next;
  end;
for ii:=1 to tt do
for jj:=ii+1 to tt do
 if yy[ii]<yy[jj]  then
         begin
         yy[ii]:=yy[ii]+yy[jj];
         yy[jj]:=yy[ii]-yy[jj];
         yy[ii]:=yy[ii]-yy[jj];
         end;
for jj:=0 to tt-1 do
time[x]:=max(time[x],yy[jj+1]+jj);
end;
begin
assign(input,'badnews.in');reset(input);
assign(output,'badnews.out');rewrite(output);
readln(n);
for i:=2  to n do
 begin
  readln(x);
  new(q);
  q^.id:=x;
  q^.next:=ln[i];
  ln[i]:=q;
  new(q);
  q^.id:=i;
  q^.next:=ln[x];
  ln[x]:=q;
  inc(son[x]);
  inc(son[i]);
 end;
 ans:=maxlongint;
 for i:=1 to n do
  begin
  fillchar(b,sizeof(b),true);
  dfs(i);
  if time[i]<ans then ans:=time[i];
  best[i]:=time[i];
  end;
  writeln(ans+1);
  t:=0;
  for i:=1 to n do
  if best[i]=ans then inc(t);
  x:=0;
  for i:=1 to n do
  if best[i]=ans then
   begin
   inc(x);
   write(i,' ')
   end;
close(output);
end.
