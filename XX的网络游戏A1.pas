program A;
var
    st,en:array[0..5000001]of integer;
    now,w,m,i,j,k,n,l,tot,maxt:longint;
    s,q:qword;
function min(a,b:qword):qword;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'a.in');
reset(input);
assign(output,'a.out');rewrite(output);
readln(n,m,q);
if m<q+1 then q:=m
else q:=q+1;
for i:=1 to n do
begin
  readln(w,k);
  inc(st[w]);
  inc(en[k]);
  if k>maxt then maxt:=k;
end;
now:=0;
s:=0;
for i:=maxt downto 0 do
 begin
  now:=now+en[i];
  s:=s+min(now,q);
  now:=now-st[i];
 end;
 writeln(s);
close(output);
end.
