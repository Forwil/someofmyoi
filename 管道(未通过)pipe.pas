program pipe;
var dat:Array[0..30,1..2]of real;
   z,i,j,k,kk,n,m:longint;
   a,b,c,x,y,a1,b1,c1,mx:real;
   flag,cc:boolean;
procedure getzx(x1,y1,x2,y2:real;var a,b,c:real);
begin
a:=y2-y1;
b:=x1-x2;
c:=-x1*y2+x2*y1;
end;

procedure getjd(a1,b1,c1,a,b,c:real;var x,y:real);
begin
if a1/b1=a/b then
begin
x:=1e38;
y:=1e38;
exit;
end;
x:=(c/b-c1/b1)/(a1/b1-a/b);
Y:=(a/b)*x+c/b;
end;

begin
assign(input,'pipe.in');reset(input);
assign(output,'pipe.out');rewrite(output);
while not eof do
begin
readln(n);
for i:=1 to n do
readln(dat[i,1],dat[i,2]);
cc:=false;
mx:=-1e38;
for i:=1 to n do
for j:=i+1 to n do
for k:=0 downto -1 do
for kk:=0 downto -1 do
 begin
  getzx(dat[1,1],dat[1,2]+kk,dat[j,1],dat[j,2]+k,a,b,c);
  flag:=true;
  if ((-a/b)*dat[1,1]-c/b>dat[1,2])or((-a/b)*dat[z+1,1]-c/b<dat[z+1,2]-1) then
   break;
  for z:=1 to n-1 do
   begin
    if ((-a/b)*dat[z+1,1]-c/b>dat[z+1,2]) then
    begin
    getzx(dat[z,1],dat[z,2],dat[z+1,1],dat[z+1,2],a1,b1,c1);
    getjd(a,b,c,a1,b1,c1,x,y);
    if x>mx then mx:=x;
    flag:=false;
    break;
    end;

    if ((-a/b)*dat[z+1,1]-c/b<dat[z+1,2]-1)then
    begin
    getzx(dat[z,1],dat[z,2]-1,dat[z+1,1],dat[z+1,2]-1,a1,b1,c1);
    getjd(a,b,c,a1,b1,c1,x,y);
    if x>mx then mx:=x;
    flag:=false;
    break;
    end;

   end;

 if flag=true then
  begin
  cc:=true;
  break;
  end;

end;

if cc then writeln('Through all the pipe.')
else
writeln(mx:0:2);
end;
close(output);
end.
