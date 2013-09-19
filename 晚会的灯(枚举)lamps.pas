program lamps;
var dt,ans:array[0..557]of string;
    b:array[0..557]of boolean;
    li:array[0..500]of integer;
    an:array[0..500]of integer;
  z, m1,m2,c,i,j,k,n,m,nn:longint;
    st:string;        can:boolean;
procedure go(c:integer;s1:string);
var i,j:longint;  s2:string;
begin
if c>0 then
 for i:=1 to 4 do
  begin
   s2:=s1;
   case i of
     1:for j:=1 to length(s1) do
        if (j and 1)=0 then
           if s2[j]='0' then s2[j]:='1'
           else s2[j]:='0';
     2:for j:=1 to length(s1) do
        if (j and 1)=1 then
           if s2[j]='0' then s2[j]:='1'
           else s2[j]:='0';
     3:for j:=1 to length(s1) do
           if s2[j]='0' then s2[j]:='1'
           else s2[j]:='0';
     4:for j:=1 to length(s1) do
       if j mod 3=1 then
           if s2[j]='0' then s2[j]:='1'
           else s2[j]:='0';
   end;
   inc(n);
   dt[n]:=s2;
   go(c-1,s2);
 end;
end;
begin
assign(input,'lamps.in');
reset(input);
assign(output,'lamps.out') ;
rewrite(output);
 readln(k);
 for i:=1 to k do
 st:=st+'1';
 readln(c);
 n:=0;
 if c<=3 then go(c,st);
 if c>=4 then go(4,st);
 read(k);
 m1:=0;
 while k<>-1 do
  begin
  inc(m1);
  li[m1]:=k;
  read(k);
  end;
 readln;
 read(k);
 m2:=0;
 while k<>-1 do
 begin
 inc(m2);
 an[m2]:=k;
 read(k);
 end;
 nn:=0;
 dt[0]:=st;
for i:=0 to n do
begin
can:=true;
  for j:=1 to m1 do
    if dt[i][li[j]]='0' then can:=false;
  for j:=1 to m2 do
    if dt[i][an[j]]='1' then can:=false;
if can then
begin
inc(nn);
ans[nn]:=dt[i];
end;
end;
for i:=1 to nn do
for j:=i+1 to nn do
if ans[i]>ans[j] then
     begin
     ans[0]:=ans[i];
     ans[i]:=ans[j];
     ans[j]:=ans[0];
     end;

for i:=1 to nn do
for j:= i+1 to nn do
if ans[i]=ans[j] then b[j]:=true;
for i:=1 to nn do
if b[i]=false then
 writeln(ans[i]);
if nn=0 then writeln('IMPOSSIBLE');
CLOSE(OUTPUT);
end.
