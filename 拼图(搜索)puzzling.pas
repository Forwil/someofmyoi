program puzzling;
var dat:Array[0..6,0..6]of string[10];
    size:Array[0..6,1..2]of integer;
    a:Array[0..50,0..50]of integer;
    pass:array[0..5]of boolean;
    i,j,k,n,m,x,y,tot:longint;
procedure jian(x:longint);
var i,j:longint;
 c:boolean;
begin
for j:=size[x,2] downto 1 do
 begin
 c:=true;
 for i:=1 to size[x,1] do
 if dat[x,i][j]='0' then delete(dat[x,i],j,1)
 else begin c:=false;break;  end;
 if c=false then break;
 end;
size[x,2]:=j;
for i:=size[x,1] downto 1 do
 begin
 c:=true;
 for j:=size[x,2] downto 1 do
 if dat[x,i][j]='0' then delete(dat[x,i],j,1)
 else begin c:=false;break;  end;
 if c=false then break;
 end;
size[x,1]:=i;
for i:=1 to size[x,1] do
while length(dat[x,i])<size[x,2] do dat[x,i]:=dat[x,i]+'0';
end;
procedure out;
var i,j:longint;
begin
for i:=1 to tot do
for j:=1 to tot do
begin
write(a[i,j]);
if j=tot then writeln;
end;
close(output);
halt;
end;

procedure go(x:integer);
var i,j,l,r,xx,yy,x0,y0:integer;
can:boolean;
begin
if x>n then out;
for i:=1 to n do
if not(pass[i]) then
 begin
  pass[i]:=true;
    for x0:=tot downto size[i,1] do
    for y0:=1 to tot-size[i,2]+1 do
  // if (a[x0,y0]=0)and(a[x0+1,y0-1]<>0)and(a[x0,y0-1]<>0) then
     begin
      can:=true;
      for l:=x0 downto x0-size[i,1]+1 do
      for r:=y0 to y0+size[i,2]-1 do
      begin
      xx:=l-(x0-size[i,1]);
      yy:=r-y0+1;
      if (a[l,r]=0)and(dat[i,xx,yy]='1')then  a[l,r]:=i else
      if (a[l,r]<>0)and(dat[i,xx,yy]='1') then can:=false;
      end;

      if can then go(x+1);

      for l:=x0 downto x0-size[i,1]+1 do
      for r:=y0 to y0+size[i,2]-1 do
      if a[l,r]=i then a[l,r]:=0;

    end;
   pass[i]:=false;
  end;
 end;
begin
assign(input,'puzzling.in');reset(input);
assign(output,'puzzling.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 readln(size[i,1],size[i,2]);
  for j:=1 to size[i,1]do
   begin
   readln(dat[i,j]);
   for x:=1 to size[i,2] do
   if dat[i,j][x]='1' then inc(tot);
   end;
 end;
 for i:=1 to n do jian(i);
 if sqrt(tot)<>trunc(sqrt(tot)) then
 writeln('No solution possible')
 else
 begin
 tot:=trunc(sqrt(tot));
 go(1);
 writeln('No solution possible');
 end;
 close(output);
end.
