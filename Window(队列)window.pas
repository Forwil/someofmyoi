program window;
var dat,id:Array[0..1000000]of longint;
   t,w,i,j,k,n,m:longint;
begin
assign(input,'window.in');reset(input);
assign(output,'window.out');rewrite(output);
readln(n,m);
for i:=1 to n do
read(dat[i]);
w:=0;
t:=1;
for i:=1 to n do
begin
while (i-id[t]>=m)and(t<=w) do inc(t);
while (dat[i]<dat[id[w]])and(t<=w) do dec(w);
w:=w+1;
id[w]:=i;
if i>=m then
 if i<>n then write(dat[id[t]],' ')
 else writeln(dat[id[t]]);
end;
w:=0;
t:=1;
for i:=1 to n do
begin
while (i-id[t]>=m)and(t<=w) do inc(t);
while (dat[i]>dat[id[w]])and(t<=w) do dec(w);
w:=w+1;
id[w]:=i;
if i>=m then
 if i<>n then write(dat[id[t]],' ')
 else writeln(dat[id[t]]);
end;
close(output);
end.