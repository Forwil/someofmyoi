program shudu;
var a:array[0..9,0..9]of longint;
    heng:array[0..9,0..9]of boolean;
    ind:array[0..81,1..2]of longint;
    shu:Array[0..9,0..9]of boolean;
    ge:array[0..9,0..9]of boolean;
  i,j,x,k,n,ans,t,z:longint; bb:boolean;
 ch:char;

function into(i,j:longint):longint;
begin
if (i<=3)and(j<=3) then into:=1;
if (i<=3)and(j>3)and(j<=6)then into:=2;
if (i<=3)and(j>6)then into:=3;
if (i>3)and(i<=6)and(j<=3)then   into:=4;
if (i>3)and(i<=6)and(j>3)and(j<=6)then into:=5;
if (i>3)and(i<=6)and(j>6)then  into:=6;
if (i>6)and(j<=3)then  into:=7;
if (i>6)and(j>3)and(j<=6)then into:=8;
if (i>6)and(j>6)then into:=9;
end;
procedure out;
var i,j:longint;
begin

for i:=1 to 9 do
begin
for j:=1 to 9 do
write(a[i,j]);
end;
writeln;
bb:=true;
end;
procedure go(x:longint);
var min,t,i,j,z,xx,yy:longint;
begin
min:=99;
xx:=0;
yy:=0;
if x>k then out;
if bb=true then exit;
if (x<=k) then
begin
 for i:= 1 to 9 do
 for j:= 1 to 9 do
  if a[i,j]=0 then
   begin
    t:=0;
   for z:=1 to 9 do
    if (heng[i,z])and(shu[j,z])and(ge[into(i,j),z]) then inc(t);
    if t<min then
          begin min:=t;xx:=i;yy:=j;end;
   end;
  { if (xx<>0)and(yy<>0) then  }
  for i:=1 to 9 do
  if (heng[xx,i])and(shu[yy,i])and(ge[into(xx,yy),i]) then
    begin
    heng[xx,i]:=false;
    shu[yy,i]:=false;
    ge[into(xx,yy),i]:=false;
    a[xx,yy]:=i;
     go(x+1);
     a[xx,yy]:=0;
    heng[xx,i]:=true;
    shu[yy,i]:=true;
    ge[into(xx,yy),i]:=true;
    end;
  end;
end;
begin
readln(t);
for x:=1 to t do
begin
fillchar(heng,sizeof(heng),true);
fillchar(shu,sizeof(shu),true);
fillchar(ge,sizeof(ge),true);
k:=0;
 for i:=1 to 9 do
 begin
  for j:=1 to 9 do
  begin
    read(ch);
       a[i,j]:=ord(ch)-48;
       heng[i,ord(ch)-48]:=false;
       shu[j,ord(ch)-48]:=false;
       ge[into(i,j),ord(ch)-48]:=false;
     if ch='0' then
            inc(k);
   end;
 end;
 readln;
bb:=false;
go(1);
end;
end.
