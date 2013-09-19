program mm4;
type node=array[0..26]of longint;
var d:array[0..52,0..601]of node;
    a,b:array[0..52]of longint;
   i,j,k,n,m,l,r,now,last,t:longint;
   can:boolean;            ans:node;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure  incc(var s1:node;s2:node);
var jin,i,j,k:longint;
begin
s1[0]:=max(s1[0],s2[0]);
jin:=0;
k:=0;
for i:=1 to s1[0] do
 begin
 k:=s1[i];
 s1[i]:=(k+jin+s2[i]) mod 100000000;
 jin:=(k+jin+s2[i])   div 100000000;
 end;
if jin<>0 then
begin
inc(s1[0]);
s1[s1[0]]:=jin;
end;
end;
begin
assign(input,'input0.txt');reset(input);
//assign(output,'mm4.out') ;rewrite(output);
readln(n,k);
for i:=1 to n do
 read(a[i]);
for i:=1 to n do
 read(b[i]);
d[0,0][0]:=1;
d[0,0][1]:=1;
for i:=1 to k do
begin
 for j:=1 to n do
  begin
    l:=(j-1+n-1)mod n+1;
    r:=(j+1-1) mod n+1;
    if i-b[j]>=0 then
    incc(d[j,i],d[r,i-b[j]]);
    if i-b[l]>=0 then
    incc(d[j,i],d[l,i-b[l]]);
    if i-a[j]>=0 then
    begin
    incc(d[j,i],d[0,i-a[j]]);
    incc(d[0,i],d[j,i-a[j]]);
    end;
end;
end;
ans:=d[0,k];
write(ans[ans[0]]);
for i:=ans[0]-1 downto  1 do
begin
case ans[i] of
0..9:write('0000000',ans[i]);
10..99:write('000000',ans[i]);
100..999:write('00000',ans[i]);
1000..9999:write('0000',ans[i]);
10000..99999:write('000',ans[i]);
100000..999999:write('00',ans[i]);
1000000..9999999:write('0',ans[i]);
else
write(ans[i]);
end;
end;

 close(output);
end.
