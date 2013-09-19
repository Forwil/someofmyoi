program wiseking;
type node=array[0..20]of longint;
var n,m,i,j,k,a,b:longint;
     comb:array[0..501,0..100]of node;
function add(s1,s2:node):node;
var i,j,jin:longint;
begin
fillchar(add,sizeof(add),0);
if s1[0]>s2[0] then add[0]:=s1[0]
else add[0]:=s2[0];
jin:=0;
for i:=1 to add[0] do
 begin
 add[i]:=(s1[i]+s2[i]+jin)mod 1000000;
 jin:=(s1[i]+s2[i]+jin) div 1000000;
 end;
if jin<>0 then
begin
add[0]:=add[0]+1;
add[add[0]]:=jin;
end;
end;

function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;

procedure print(a:node);
var  i:integer;
begin
write(a[a[0]]);
for i:=a[0]-1 downto 1 do
 begin
 if a[i]<10 then write('0');
 if a[i]<100 then write('0');
 if a[i]<1000 then write('0');
 if a[i]<10000 then write('0');
 if a[i]<100000 then write('0');
 write(a[i]);
 end;
end;
begin
assign(input,'wiseking.in');reset(input);
assign(output,'wiseking.out');rewrite(output);
readln(n,m);
b:=m-n-1;
a:=n-1;
comb[0,0][0]:=1;
comb[0,0][1]:=1;
for i:=1 to b do
begin
 comb[i,0][0]:=1;
 comb[i,0][1]:=1;
 for j:=1 to min(a,i) do
// begin
  comb[i,j]:=add(comb[i-1,j],comb[i-1,j-1]);
//  print(comb[i,j]);
//  write(' ');
// end;
 //writeln;
end;
print(comb[b,a]);
close(output);
end.
