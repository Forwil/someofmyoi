program kd;
const p=3.141592653589793;
var d:array[0..101,1..2]of real;
    b:array[0..101]of boolean;
    r:array[0..101]of real;
    t,i,j,k,n,m,x,y,ans:longint;
function can(i,j:longint):boolean;
var x:real;
begin
if d[i,2]<>180 then
begin
if r[j]>d[i,1] then exit(false);
if (d[i,2]=0)and(r[j]<>0)  then exit(false);
if (d[i,2]=0)and(r[j]=0)then exit(true);
x:=r[j]/sin(d[i,2]*(p/180)/2);
if x+r[j]<=d[i,1] then exit(true)
else exit(false);
end
else
begin
if d[i,1]>=r[j]*2 then exit(true)
else exit(false);
end;
end;
begin
assign(input,'kd.in');reset(input);
assign(output,'kd.out');rewrite(output);
readln(m);
for t:=1 to m do
 begin
   readln(n);
    for i:=1 to n do
     readln(d[i,1],d[i,2]);

    for i:=1 to n do
     readln(r[i]);

    for i:=1 to n do
    for j:=i+1 to n do
     if r[i]<r[j] then
      begin
      r[0]:=r[i];
      r[i]:=r[j];
      r[j]:=r[0];
      end;
    fillchar(b,sizeof(b),true);
     ans:=0;
    for i:=1 to n do
     for j:=1 to n do
      if can(i,j)and(b[j]) then
        begin
        ans:=ans+1;
        b[j]:=false;
        break;
        end;
     if ans=n then writeln('Yes!')
     else writeln('No!');
 end;
 close(output);
end.
