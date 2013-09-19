program kill;
type link=^dfdf;
dfdf=record
id:longint;
next:link;
end;
var ln:array[0..101]of link;
    f,t:array[0..101]of integer;
    name,gx:array[0..101]of string;
    tot:array[0..101]of longint;
    x,y,i,j,k,n,m,ans,tgx:longint;
    s,ss:string;
    q:link;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'kill.in');reset(input);
assign(output,'kill.out');rewrite(output);
n:=0;
while not eof do
 begin
 readln(s);
 s:=upcase(s);
 while s[length(s)]=' ' do delete(s,length(s),1);

 if s[length(s)] in['0'..'9'] then
   begin
   ss:=copy(s,1,pos(' ',s)-1);
   delete(s,1,pos(' ',s));
   n:=n+1;
   name[n]:=upcase(ss);
   val(s,j,m);
   t[n]:=j;
   end
   else
   begin
   tgx:=tgx+1;
   gx[tgx]:=s;
   end;
 end;

for i:=1 to tgx do
 begin
  ss:=copy(gx[i],1,pos(' ',gx[i])-1);
  delete(gx[i],1,pos(' ',gx[i]));
  for j:=n downto 1 do
   if name[j]=ss then begin x:=j;break;end;
  for j:=n downto 1 do
   if name[j]=gx[i] then begin y:=j;break;end;
  inc(f[y]);
  new(q);
  q^.id:=y;q^.next:=ln[x];ln[x]:=q;
 end;

for i:=1 to n do
 begin
 for j:=1 to n do
  if (f[j]=0)then begin k:=j;break;end;
  f[k]:=-1;
  q:=ln[k];
  ans:=max(ans,tot[k]+t[k]);
  while q<>nil do
   begin
   tot[q^.id]:=max(tot[q^.id],tot[k]+t[k]);
   dec(f[q^.id]);
   q:=q^.next;
   end;
 end;
 writeln(ans);
 close(output);
end.
