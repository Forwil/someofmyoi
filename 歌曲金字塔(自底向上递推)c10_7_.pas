program c10_7_;
var l,i,j,n:longint;
ans:int64;
s:string;
begin
readln(n);
 i:=0;
while (i*(i+1))div 2 < n do i:=i+1;
 j:=i;
 if (i*(i+1))div 2=n then
  begin
   ans:=j;
   for i:=j-1 downto 1 do
     ans:=(ans*2*i) mod 70207;
  end
 else
  begin
  j:=j-1;
  n:=n-(j*(j+1))div 2;
  ans:=(((n*2)mod 70207)*(n-1))mod 70207+n;
  for i:=j-1 downto 1 do
  ans:=((ans*i)mod 70207*2) mod 70207;
  end;
str(ans,s);
while length(s)<5 do s:='0'+s;
writeln(s);
end.
