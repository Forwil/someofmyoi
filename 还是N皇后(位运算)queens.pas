program queens;
var  dat:array[0..20]of longint;
    i,j,k,n,m,tot:longint;
    ch:char;
procedure go(x,h,l,r:longint);
var y,now:longint;
begin
if x>n then inc(tot);
if x<=n then
begin
now:=0;
now:=now or dat[x] or l or r or h;
 for y:=1 to n do
 if  (1 shl (n-y))and now=0 then
 go(x+1,h or (1 shl (n-y)),(l or (1 shl (n-y)))shl 1,(r or (1 shl (n-y)))shr 1);
end;
end;
begin
assign(input,'queens.in');reset(input);
assign(output,'queens.out');rewrite(output);
 readln(n);
 for i:=1 to n do
 for j:=1 to n do
 begin
 read(ch);
 if ch='.' then dat[i]:=dat[i] or (1 shl(n-j));
 if j=n then readln;
 end;
go(1,0,0,0);
writeln(tot);
close(output);
end.
