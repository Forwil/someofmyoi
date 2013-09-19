program n1129;
var p:Array[0..9]of longint;
    tab:Array[0..9,0..9]of boolean;
    i,j,k,n,m,x,y:longint;
   ss,s:string;
   ch:char;
   ans:extended;
begin
read(ch);
while ch<>' ' do
 begin
 s:=s+ch;
 read(ch);
 end;
readln(k);
for i:=1 to k do
 begin
 readln(x,y);
 tab[x,y]:=true;
 end;
for k:=0 to 9 do
for i:=0 to 9 do
for j:=0 to 9 do
 if (k<>j)and(i<>j)and(k<>i) then
   tab[i,j]:=tab[i,j]or((tab[i,k])and(tab[k,j]));
for i:=0 to 9 do
p[i]:=1;
for i:=0 to 9 do
for j:=0 to 9 do
if (i<>j)and(tab[i,j]) then inc(p[i]);
ans:=1;
for i:=1 to length(s) do
  ans:=ans*p[ord(s[i])-48];
writeln(ans:0:0);
end.