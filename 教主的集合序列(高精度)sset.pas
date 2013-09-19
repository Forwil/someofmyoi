program sset;
const p=100000000;
type node=array[0..5000]of longint;
var x,t,i,j,n,m:longint;
    a,l,k:node;
    ss,s:ansistring;

procedure add(var s1:node;s2:node);
var i,jin,x:longint;
begin
jin:=0;
if s2[0]>s1[0] then s1[0]:=s2[0];
for i:=1 to s1[0] do
 begin
 x:=(s1[i]+s2[i]+jin) mod p;
 jin:=(s1[i]+s2[i]+jin) div p;
 s1[i]:=x;
 end;
if jin<>0 then
begin
inc(s1[0]);
s1[s1[0]]:=jin;
end;
end;

procedure j2(var s1:node;x:longint);
var i:integer;
begin
 s1[1]:=s1[1]-x;
 i:=1;
 while s1[i]<0 do
  begin
  dec(s1[i+1]);
  s1[i]:=s1[i]+p;
  inc(i);
  end;
 if s1[s1[0]]=0 then dec(s1[0]);
end;

procedure j1(var s1:node;s2:node);
var i:longint;
begin
for i:=1 to s1[0] do
 s1[i]:=s1[i]-s2[i];
 i:=1;
for i:=1 to s1[0] do
 if s1[i]<0 then
 begin
 inc(s1[i],p);
 dec(s1[i+1]);
 end;

if s1[s1[0]]=0 then dec(s1[0]);
end;

function big(s1,s2:node):boolean;
var i:integer;
begin
if s1[0]>s2[0] then exit(true);
if s1[0]<s2[0] then exit(false);
for i:=s1[0] downto 1 do
begin
if s1[i]>s2[i] then exit(true);
if s1[i]<s2[i] then exit(false);
end;
exit(false);
end;

procedure ad1(var s1:node);
var i:integer;
begin
inc(s1[1]);
i:=1;
while s1[i]>=p do
 begin
 s1[i+1]:=s1[i+1]+s1[i] div p;
 s1[i]:=s1[i] mod p;
 inc(i);
 end;
if s1[s1[0]+1]<>0 then inc(s1[0]);
end;
begin
assign(input,'sset.in');reset(input);
assign(output,'sset.out');rewrite(output);
read(n);
readln(s);
if (n=2)and(s<>'1')and(s<>'2')and(s<>'3') then
 begin
  writeln(-1);
  close(output);
  halt;
 end;
t:=0;
while s<>'' do
 begin
 if length(s)>=8 then
 begin
 ss:=copy(s,length(s)-7,8);
 delete(s,length(s)-7,8);
 end
 else
 begin
 ss:=s;
 s:='';
 end;
 val(ss,x,i);
 t:=t+1;
 k[t]:=x;
 end;
k[0]:=t;
a[0]:=1;
a[1]:=1;
l[0]:=1;
l[1]:=n;
while big(k,l) do
 begin
 j1(k,l);
 add(a,a);
 ad1(a);
 add(l,l);
 j2(l,3);
 end;

add(a,k);
j2(a,1);
write(a[a[0]]);
for i:=a[0]-1 downto 1 do
begin
  if a[i]<10 then write('0');
  if a[i]<100 then write('0');
  if a[i]<1000 then write('0');
  if a[i]<10000 then write('0');
  if a[i]<100000 then write('0');
  if a[i]<1000000 then write('0');
  if a[i]<10000000 then write('0');
  write(a[i]);
end;
close(output);
end.
