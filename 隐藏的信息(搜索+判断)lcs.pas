program lcs;
var  dat:array[1..10]of char;
     b:array['0'..'9']of boolean;
     t,i,j,k,n,m,w:longint;
    s:string;    can:boolean;
    ch:char;
procedure count(a:string);
var z,i:longint;
begin
z:=0;
val(a,z,i);
for i:=t to w do
if z mod i <>0 then exit;
if can=false then can:=true;
writeln(a);
end;
procedure go(x:longint;a:string);
var i:longint;
begin
if x<=n then
 begin
 for i:=1 to n do
  if b[dat[i]] then
  begin
  b[dat[i]]:=false;
  go(x+1,a+dat[i]);
  b[dat[i]]:=true;
  end;
 end
else count(a);
end;
begin
assign(input,'lcs.in');reset(input);
assign(output,'lcs.out');rewrite(output);
readln(s);
readln(t,w);
n:=length(s);
for i:=1 to n do
 dat[i]:=s[i];
fillchar(b,sizeof(b),true);
for i:=1 to n do
for j:=i+1 to n do
if dat[i]>dat[j] then
 begin
 ch:=dat[i];
 dat[i]:=dat[j];
 dat[j]:=ch;
 end;
 can:=false;
go(1,'');
if can=false then writeln('No answer');
close(output);
end.

