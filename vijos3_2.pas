program vijos3_2;
var ind:Array[0..600]of integer;
    b:array[0..600]of boolean;
   tot,i,j,k,n,m,x,y,ans:longint;
    ch:char;
//-------------------can1---------------------------
function can1(var x,y:longint):boolean;
var i:longint;
    c:boolean;
begin
c:=false;
can1:=false;
for i:=n-1 downto 1 do
if {(b[i])and(b[i+1])and}(ind[i]=0)and(ind[i+1]=0) then
  begin
  c:=true;
  x:=i;
  break;
  end;
if c then
 for i:=1 to n-1 do
if {(b[i])and(b[i+1])and}(ind[i]=1)and(ind[i+1]=1) then
  begin
   y:=i+1;
   exit(true);
  end;
end;
//-------------can2----------------------------------------------
function can2(var x,y:longint):boolean;
var i:longint;
   c:boolean;
begin
c:=false;
can2:=false;
for i:=n downto 1 do
if (b[i])and(ind[i]=0) then
  begin
  x:=i;
  c:=true;
  break;
  end;
if c then
 for i:=1 to n-1 do
if (b[i])and(b[i+1])and(ind[i]=1)and(ind[i+1]=1) then
 begin
 y:=i+1;
 exit(true);
 end;
end;
//------------can3----------------------------
function can3(var x,y:longint):boolean;
var i:longint;
   c:boolean;
begin
c:=false;
can3:=false;
for i:=n-1 downto 1 do
 if (b[i])and(b[i+1])and(ind[i]=0)and(ind[i+1]=0) then
  begin
  x:=i;
  c:=true;
  break;
  end;
if c then
for i:=1 to n do
if (b[i])and(ind[i]=1) then
 begin
 y:=i;
 exit(true);
 end;
end;
begin
 readln(n,m);
 fillchar(b,sizeof(b),true);
 for i:=1 to n do
  begin
  read(ch);
  if ch='j' then ind[i]:=1;
  if (ch='z')and(ind[i-1]=1) then
  begin b[i-1]:=false;b[i]:=false; end;
  end;
 for i:=1 to m do
  begin
    if can1(x,y) then
     begin
     ind[x]:=ind[x]+ind[y];
     ind[y]:=ind[x]-ind[y];
     ind[x]:=ind[x]-ind[y];
     b[x]:=false;
     b[x+1]:=false;
     b[y]:=false;
     b[y-1]:=false;
     end
    else
    if can2(x,y) then
     begin
     ind[x]:=ind[x]+ind[y];
     ind[y]:=ind[x]-ind[y];
     ind[x]:=ind[x]-ind[y];
     b[x]:=false;
     b[y]:=false;
     b[y-1]:=false;
     end
   else
   if can3(x,y) then
    begin
    ind[x]:=ind[x]+ind[y];
    ind[y]:=ind[x]-ind[y];
    ind[x]:=ind[x]-ind[y];
    b[x]:=false;
    b[x+1]:=false;
    b[y]:=false;
    end;
  end;
 for i:=1 to n-1 do
 if  (ind[i]=1)and(ind[i+1]=0) then inc(ans);
  writeln(ans);
end.
