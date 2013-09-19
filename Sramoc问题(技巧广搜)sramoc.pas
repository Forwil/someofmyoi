program sramoc;
var t,w,x,l,n,m,j,k,i:longint;
     p,zz,y:array[0..2001]of integer;
     out:string;
     b:array[0..1000]of boolean;
     find:boolean;
     ll:real;
begin
ll:=2**1000;
writeln(ll);
{assign(input,'sramoc.in');reset(input);
assign(output,'sramoc.out');rewrite(output);
read(n,m);
t:=0;
w:=0;
for i:=1 to n-1 do
 if not b[i mod m]then
 begin
 w:=w+1;
 b[i mod m]:=true;
 zz[w]:=i;
 p[w]:=-1;
 y[w]:=i mod m;
 end;
repeat
  t:=t+1;
  for i:=0 to n-1do
    if b[(y[t]*10+i)mod m]=false then
      begin
        w:=w+1;
        zz[w]:=i;
        p[w]:=t;
        if ((y[t]*10+i)mod m)=0 then
        begin
        find:=true;
        break;
        end;
        y[w]:=(y[t]*10+i)mod m;
        b[(y[t]*10+i)mod m]:=true;
      end;
until find;
out:='';
i:=w;
repeat
out:=chr(zz[i]+48)+out;
i:=p[i];
until i=-1;
writeln(out);
close(output); }
end.
