program search;
const ax:Array[1..4]of -1..1=(-1,1,0,0);
      ay:Array[1..4]of -1..1=(0,0,-1,1);
var dat:Array[0..1001]of integer;
      b:array[0..60,0..60]of boolean;
    ans:Array[0..60,0..60]of char;
    pass:Array[0..51,0..51,0..1001]of boolean;
    i,j,k,n,m,t,x,y:longint;
    ch:char;
    s:string;
procedure go(x,y,z:longint);
var i,j:longint;
begin
if z<=t then
begin
 pass[x,y,z]:=true;
 i:=x+ax[dat[z]];
 j:=y+ay[dat[z]];
 while b[i,j] and not(pass[i,j,z+1]) do
  begin
  go(i,j,z+1);
  i:=i+ax[dat[z]];
  j:=j+ay[dat[z]];
  end;
end
else ans[x,y]:='*';
end;
begin
assign(input,'search.in');reset(input);
assign(output,'search.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(ch);
 ans[i,j]:=ch;
 if ch='.' then b[i,j]:=true;
 if ch='*' then
  begin
  b[i,j]:=true;
  x:=i;y:=j;
  end;
 if j=m then readln;
 end;

readln(t);
for i:=1 to t do
 begin
 readln(s);
 s:=upcase(s);
 if s='NORTH'then dat[i]:=1;
 if s='SOUTH'then dat[i]:=2;
 if s='WEST' then dat[i]:=3;
 if s='EAST' then dat[i]:=4;
 end;
ans[x,y]:='.';
go(x,y,1);
for i:=1 to n do
for j:=1 to m do
begin
 write(ans[i,j]);
 if j=m then writeln;
end;
close(output);
end.
