program gift;
var dat:array[0..50]of longint;
     h:array[0..50]of qword;
  i,j,k,n,m,ans:longint;

procedure go(id:integer;tot:qword;k:longint);
begin
if tot>19920726 then exit;
if id<=n then
begin
if tot+dat[id]+h[id]<19920726 then exit;
go(id+1,tot,k);
go(id+1,tot+dat[id],k+1);
end
else if (tot=19920726)and(k>ans) then ans:=k;
end;

begin
assign(input,'gift.in');reset(input);
assign(output,'gift.out');rewrite(output);
 readln(n);
 for i:=1 to n do
 readln(dat[i]);
 for i:=1 to n do
 for j:=i+1 to n do
 if dat[i]<dat[j] then
 begin
 dat[0]:=dat[i];
 dat[i]:=dat[j];
 dat[j]:=dat[0];
 end;
 h[n]:=0;
 for i:=n-1 downto 1 do
 h[i]:=h[i+1]+dat[i+1];

 go(1,0,0);
 writeln(ans);
 close(output);
end.
