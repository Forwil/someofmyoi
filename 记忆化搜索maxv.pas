program maxv;
var ans:array[0..31,0..31,1..4]of longint;
    tab:Array[0..31,0..31]of boolean;
     zz:array[0..200000,1..6]of longint;
     P:ARRAY[0..200000,1..2]OF longint;
    z,xx,yy,v,i,j,k,n,m,t,w,x,y,x1,y1,out:longint;
    ch,ch1:char;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'maxv.in');
reset(input);
assign(output,'maxv.out');rewrite(output);
readln(n,m,v);
for i:=1 to n do
 begin
 for j:=1 to m do
  begin
   read(ch);
   if ch='#' then tab[i,j]:=true;
   if (ch='N')or(ch='W')OR(CH='S')or(CH='E') then
     begin
     ch1:=ch;
     x:=i;
     y:=j;
     tab[i,j]:=true;
     end;
   if ch='F'then begin tab[i,j]:=true; x1:=i;y1:=j;end;
  end;
 readln;
end;
if ch1='N' then k:=1;
if ch1='E' then k:=2;
if ch1='S' then k:=3;
if ch1='W' then k:=4;
zz[1,k]:=v+1;
zz[1,5]:=x;
zz[1,6]:=y;
ans[x,y,k]:=v+1;
t:=0;
w:=1;
repeat
 t:=t+1;
    xx:=zz[t,5];
    yy:=zz[t,6];
if not((xx=x1)and(yy=y1)) then
 begin
  for i:=1 to 4 do
  if (zz[t,i]>0) then
   begin
   case i of
     1: begin   x:=zz[t,5]-1;  y:=zz[t,6]; end;
     2: begin   x:=zz[t,5];    y:=zz[t,6]+1; end;
     3: begin   x:=zz[t,5]+1;  y:=zz[t,6];end;
     4: begin   x:=zz[t,5];    y:=zz[t,6]-1;end;
    end;

   if (tab[x,y])and(zz[t,i]+1>ans[x,y,i]) then
    begin
    w:=w+1;
    zz[w,i]:=zz[t,i]+1;
    zz[w,5]:=x;zz[w,6]:=y;
    ans[x,y,i]:=zz[t,i]+1;
    if (x=x1)and(y=y1)and(zz[t,i]+1>out) then out:=zz[t,i]+1;
    end;
  end;
  for i:=1 to 4 do
  if zz[t,i]<>0 then
   begin
    x:=i mod 4+1;
    y:=(i-2+4)mod 4+1;
    z:=(i-3+4)mod 4+1;
    if ans[xx,yy,x]<max(1,zz[t,i]-40) then
     begin
     w:=w+1;
     zz[w]:=zz[t];
     p[w]:=p[t];
     p[w,1]:=p[w,1]+1;
     if p[w,1]=1 then
     begin
     ans[xx,yy,x]:=max(1,zz[t,i]-40);
     zz[w,x]:=max(1,zz[t,i]-40);
     end
     else
     begin
     zz[w,x]:=1;
     p[w,1]:=0;
     end;
    end;
    if ans[xx,yy,y]<max(1,zz[t,i]-35) then
     begin
     w:=w+1;
     zz[w]:=zz[t];
     p[w]:=p[t];
     p[w,2]:=p[w,2]+1;
     if p[w,2]=1 then
     begin
     ans[xx,yy,y]:=max(1,zz[t,i]-35);
     zz[w,y]:=max(1,zz[t,i]-35);
     end
     else
     begin
     zz[w,y]:=1;
     p[w,2]:=0;
     end;
     end;
    {if (tab[xx+1,yY]=false)and(tab[xx,yy+1]=false)
    and(tab[xx-1,yY]=false)and(tab[xx,yy-1]=false) then
     begin
     w:=w+1;
     zz[w]:=zz[t];
     zz[w,z]:=1;
     end; }
   end;
 end;
until t>=w;
writeln(out-1);
close(output);
end.
