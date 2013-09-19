program area;
const ax:Array[1..4]of -1..1=(0,-1,0,1);
      ay:Array[1..4]of -1..1=(1,0,-1,0);
var s:Array[-205..205,-205..205,1..4]of boolean;
 pass:array[-205..205,-205..205]of boolean;
    z:Array[0..401*401,1..2]of integer;
   ans,o,x,y,i,j,k,n,m,xx,yy,x1,y1,x2,y2,t,w:longint;
procedure go(x,y:longint);
var xx,yy,i:longint;
begin
t:=0;
z[1,1]:=x;
z[1,2]:=y;
pass[x,y]:=true;
inc(ans);
w:=1;
repeat
t:=t+1;
for i:=1 to 4 do
 begin
 xx:=ax[i]+z[t,1];
 yy:=ay[i]+z[t,2];
 if (not pass[xx,yy])and(not s[z[t,1],z[t,2],i]) then
  begin
   pass[xx,yy]:=true;
   inc(ans);
   w:=w+1;
   z[w,1]:=xx;
   z[w,2]:=yy;
  end;
 end;
until t>=w;
end;

begin
assign(input,'area.in');reset(input);
assign(output,'area.out');rewrite(output);
read(n);
for i:=1 to n+1 do
 begin
 if i<>n+1 then readln(x,y)
  else
   begin
   x:=x1;
   y:=y1;
   end;

 if i<>1 then
  begin
  if x=xx then
       begin
       o:=yy;
       while o<>y do
        begin
        if yy>y then o:=o-1
        else o:=o+1;
          s[x,o+ord(yy>y),4]:=true;
          s[x+1,o+ord(yy>y),2]:=true;
        end;
       end
   else
       begin
       o:=xx;
       while o<>x do
       begin
       if xx>x then o:=o-1
       else o:=o+1;
        s[o+ord(xx>x),y,1]:=true;
        s[o+ord(xx>x),y+1,3]:=true;
        end;
       end;
 end;
 xx:=x;yy:=y;
 if i=1 then
   begin x1:=x;y1:=y;end;
 if i=2 then
   begin x2:=x;y2:=y;end;
 end;


xx:=x2-x1;
yy:=y2-y1;
if n>=4 then
begin
if xx=0 then
 if yy>0 then go(x1,y1+1)
 else go(x1+1,y1);
if yy=0 then
 if xx>0 then go(x1+1,y1+1)
 else go(x1,y1);
end;
writeln(ans);
close(output);
end.
