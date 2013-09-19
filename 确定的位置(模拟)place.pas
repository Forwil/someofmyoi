program place;
var pm:array[0..500]of longint;
    name,out:array[0..501]of string;
    c:array[0..500]of integer;
    z,i,j,k,n,m,x,y,mm:longint;
    ch:char;
    s,ss:ansistring;

function min(a,b:longint):longint;
begin if a>b then min:= b else min:=a;end;

function find(s:string):integer;
var i:integer;
begin
for i:=1 to n do
 if name[i]=s then exit(i);
 exit(0);
end;

begin
assign(input,'place.in');reset(input);
assign(output,'place.out');rewrite(output);
readln(m);
for i:=1 to m do
 begin
 read(x);
 read(ch);read(ch);read(ch);read(ch);read(ch);
 read(y);
 if y>mm then mm:=y;
 read(ch);
 readln(s);
 s:=s+' ';
 for j:=1 to x do
  begin
  ss:=copy(s,1,pos(' ',s)-1);
  delete(s,1,pos(' ',s));
  if find(ss)=0 then
    begin
    n:=n+1;
    name[n]:=ss;
    pm[n]:=y;
    end
  else  pm[find(ss)]:=min(pm[find(ss)],y);
  end;
 end;

for i:=1 to n do
begin
inc(c[pm[i]]);
out[pm[i]]:=name[i];
end;

for i:=1 to mm do
begin
if (c[i]=1)and(k=i-1) then
   writeln(i,' ',out[i]);
 k:=k+c[i];
end;
close(output);
end.
