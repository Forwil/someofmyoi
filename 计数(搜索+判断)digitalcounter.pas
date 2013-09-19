program digitalcounter;
const s:array[0..9]of 0..9=(6,2,5,5,4,5,6,3,7,5);
var
     a:array[0..9]of integer;
  out:Array[0..15]of integer;
     t,i,j,k,n,m:longint;
   ss,ans:string;  find:boolean;
procedure try(l:longint;now:string;big:boolean);
var i,tt:integer;
begin
if (l>n)and(now>ss)and(now<ans) then ans:=now;
if (l>n)and(now>ss) then find:=true;
if l<=n then
 begin
 if big then tt:=0
 else tt:=ord(ss[l])-48;
 for i:=tt to 9 do
 if a[i]<>0 then
  begin
  dec(a[i]);
  try(l+1,now+chr(i+48),big or (tt<>i));
  inc(a[i]);
  if find then exit;
  end;
 end;
end;

procedure go(x,z,tot:longint);
var i:integer;
begin
 if (tot=n)and(z=t) then   try(1,'',false);
 if (x<=9)and(z<t) then
 for i:=0 to n-tot do
 begin
 a[x]:=i;
 go(x+1,z+i*s[x],tot+i);
 a[x]:=0;
 end;
end;

begin
assign(input,'digitalcounter.in');reset(input);
assign(output,'digitalcounter.out');rewrite(output);
readln(n);
readln(ss);
for i:=1 to n do
inc(t,s[ord(ss[i])-48]);
ans:='9999999999999999';
go(0,0,0);
if ans='9999999999999999' then
 begin
 write('1');
 for i:=1 to n do
 write('0');
 writeln;
 close(output);
 halt;
 end;
for i:=1 to n do
out[i]:=ord(ans[i])-ord(ss[i]);
for i:=n downto 2 do
if out[i]<0 then
 begin
 inc(out[i],10);
 dec(out[i-1]);
 end;
for i:=1 to n do
if out[i]<>0 then break;
for j:=i to n do
write(out[j]);
close(output);
end.
