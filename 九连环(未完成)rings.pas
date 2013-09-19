program rings;
var bfs:array[0..1000000]of qword;
   count:array[0..1000000]of integer;
     pc:array[0..1000000]of integer;
     chong:array[0..10000]of qword;
     ejin:array[-1..64]of qword;
     st:string;            can:boolean;
     t,w,i,j,n,k,tot:longint; len:longint; m:qword;
procedure out(x:qword);
var st:string;  s:qword;
 i:integer;
begin
st:='';
for i:=0 to len-1 do
 if x and ejin[i]>0 then begin st:='1'+st;end
 else st:='0'+st;
 writeln(st);
end;

begin
assign(input,'rings.in');
reset(input);
assign(output,'rings.out');
rewrite(output);
 ejin[0]:=1;
 for i:=1 to 60 do
  ejin[i]:=ejin[i-1]*2;
  readln(st);
  len:=length(st);
  m:=0;
 for i:=1 to len do
 if st[i]='1' then m:=m+ejin[len-i];
  readln(n);
  bfs[1]:=m;
  t:=0;
  w:=1;
repeat
 t:=t+1;
 if t>1000000 then t:=1;
 for i:=len-1 downto 0 do
  if ((i=len-1)or((bfs[t]and ejin[i+1])>0))and(pc[t]<>i) then
   begin
   can:=true;
   for j:=len-1  downto i+2 do
    if (bfs[t] and ejin[j])>0 then can:=false;
     if can then
      begin
      bfs[0]:=bfs[t];
      bfs[0]:=bfs[0] xor(ejin[i]);
      w:=w+1;
      if w>1000000 then w:=1;
      pc[w]:=i;
      bfs[w]:=bfs[0];
      count[w]:=count[t]+1;
      end;
   end;
until (t=w)or(count[w]>n);
for i:=w downto 1 do
if count[i]=n then
begin
can:=true;
 for j:=1 to tot do
  if chong[j]=bfs[i] then can:=false;
if can then
begin
 out(bfs[i]);
 inc(tot);
 chong[tot]:=bfs[i];
end;
end;
close(output);
end.
