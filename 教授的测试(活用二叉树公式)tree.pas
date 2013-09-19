program  tree;
var  dt:array[0..20]of longint;
     sum:array[0..20]of qword;
     tot,i,j,k,n,m,t:longint;
     st:string;
function go(x,v:longint):string;
var s,k,j,i:longint;
   le,ri,l,r:longint;
begin
if v=1 then exit('(X)');
if v=0 then exit('');
k:=x;
s:=0;
while k-dt[s]*dt[v-1-s]>0 do
begin
k:=k-dt[s]*dt[v-1-s];
inc(s);
end;
l:=s;
r:=v-1-s;
le:=(k-1)div dt[v-1-s]+1;
ri:=(k-1)mod dt[v-1-s]+1;
exit('('+go(le,l)+'X'+go(ri,r)+')');
end;

function what(var x:longint):longint;
var i,k:longint;
begin
  for i:=1 to n do
   if (sum[i-1]<x)and(sum[i]>=x) then
   begin k:=i;break;   end;
  what:=k;
end;
 begin
 assign(input,'tree.in');
 reset(input);
 assign(output,'tree.out');
 rewrite(output);
dt[0]:=1;
sum[0]:=0;
sum[1]:=1;
dt[1]:=1;
for i:=2 to 19 do
begin
for j:=i-1 downto 0 do
  dt[i]:=dt[i]+dt[j]*dt[i-j-1];
 sum[i]:=sum[i-1]+dt[i];
end;
readln(n);
while n<>0 do
 begin
 t:=what(n);
 n:=n-sum[t-1];
 st:=go(n,t);
 delete(st,1,1);
 delete(st,length(st),1);
 writeln(st);
 readln(n);
 end;
 close(output);
end.