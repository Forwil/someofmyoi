program music;
var xl:array[0..20,1..2]of string;
    len:array[0..20]of real;
    use:array[0..20]of integer;
    tab:array[0..20,0..20]of boolean;
    canu:array[0..50]of real;
    i,j,k,n,m,x,a,b:longint;
    ch:char;          ans:real;
    s:string;
    fir,jing,z,f:boolean;
function gys(a,b:longint):longint;
begin
if a mod b <>0 then gys:=gys(b,a mod b)
else exit(b);
end;
function can(i,j:longint):boolean;
var x,y,z:real;
s1,s2:string;
begin
if i=0 then exit(true);
s1:=xl[i,2];
x:=ord(s1[length(s1)])-48;
if s1[1]='b' then
begin x:=x+-1/2;delete(s1,1,1);end;
if s1[1]='#' then
 begin  x:=x+1/2;  delete(s1,1,1);end;
if s1[1]='+' then
 begin x:=x+7;delete(s1,1,1);  end;
if s1[1]='-' then
 begin x:=x-7;delete(s1,1,1);  end;
s2:=xl[j,1];
y:=ord(s2[length(s2)])-48;
if s2[1]='b' then
begin y:=y+-1/2;delete(s2,1,1);end;
if s2[1]='#' then
 begin  y:=y+1/2;  delete(s2,1,1);  end;
if s2[1]='+' then
 begin y:=y+7;delete(s2,1,1);   end;
if s2[1]='-' then
 begin y:=y-7;delete(s2,1,1);   end;
if x>y then
 begin
 x:=x+y;
 y:=x-y;
 x:=x-y;
 end;
 z:=0;
if x<>y then
repeat
if (x=0)or(x=-4)or(x=3)or(x=7)or(x=10)or(x=14) then
begin
x:=x+1;
z:=z+1/2;
end
else
 begin
 z:=z+1/2;
 x:=x+1/2;
 end;
until x>=y;
can:=false;
for i:=1 to m do
if canu[i]=z then exit(true);
end;

procedure go(last:integer;z:real);
var i:longint;
  fi:boolean;
begin
  fi:=true;
  for i:=1 to n do
   if (use[i]<>2)and(tab[last,i]) then
    begin
    fi:=false;
    use[i]:=use[i]+1;
    go(i,z+len[i]);
    use[i]:=use[i]-1;
    end;
  if (fi)and(z>ans) then ans:=z;
end;

begin
assign(input,'music.in');reset(input);
assign(output,'music.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 s:='';
 fir:=true;
 repeat
  read(ch);
  if ch in ['b','+','-','0'..'7','#','f','e','t','o']then s:=s+ch
  else
  begin
   case s[length(s)] of
   'e':len[i]:=len[i]+1/8;
   'f':len[i]:=len[i]+1/4;
   't':len[i]:=len[i]+1/2;
   'o':len[i]:=len[i]+1;
   end;

  if fir and(s[1]<>'0') then
  begin
  delete(s,length(s),1);
  xl[i,1]:=s;
  xl[i,2]:=s;
  fir:=false;
  end
  else
  if s[1]<>'0' then
  begin
  delete(s,length(s),1);
  xl[i,2]:=s;
  end;
  s:='';
  end;
  until ch=chr(13);
  readln;
 end;
readln(m);
for i:=1 to m do
 readln(canu[i]);

for i:=1 to n do
for j:=1 to n do
tab[i,j]:=can(i,j);
for i:=1 to n do
tab[0,i]:=true;
go(0,0);
x:=trunc(ans);
ans:=ans-trunc(ans);
write(x,' ');
if ans<>0 then
begin
a:=trunc(ans*1000);
b:=1000;
m:=gys(a,b);
write(a div m,'/',b div m);
end;
writeln;
close(output);
end.
