program fun;
var a:array[1..4]of longint;
 pass:array[1..4]of boolean;
  x,y,i,j,k,n,m,l,r,mi,zuo,you:longint;
  ans,ss:string;
  rl,rr:real;
procedure go(x,z:longint;now:string);
var i:integer;
begin
if (x>4)and(z=24)and(now<ans) then ans:=now; ;
if x<=4 then
 for i:=1 to 4 do
 if pass[i]=false then
 begin
 pass[i]:=true;
 go(x+1,z+a[i],'('+now+'+'+chr(a[i]+48)+')');
 go(x+1,z-a[i],'('+now+'-'+chr(a[i]+48)+')');
 go(x+1,z*a[i],'('+now+'*'+chr(a[i]+48)+')');
 if z/a[i]=trunc(z/a[i])then
 go(x+1,trunc(z/a[i]),'('+now+'/'+chr(a[i]+48)+')');
 pass[i]:=false;
 end;
end;

function get(x:integer):char;
begin
case x of
1:exit('+');
2:exit('-');
3:exit('*');
4:exit('/');
end;
end;

begin
assign(input,'fun.in');reset(input);
assign(output,'fun.out');rewrite(output);
for i:=1 to 4 do
read(a[i]);
ans:='zzzzzzzzzzzzzzzzzzzzz';
for i:=1 to 4 do
begin
pass[i]:=true;
go(2,a[i],chr(a[i]+48));
pass[i]:=false;
end;

for i:=1 to 4 do
for j:=1 to 4 do if j<>i then
for x:=1 to 4 do if (x<>i)and(x<>j)then
for y:=1 to 4 do if (y<>x)and(y<>i)and(y<>j)then
begin

for l:=1 to 4 do
for r:=1 to 4 do
 begin
 rl:=0;
 case l of
  1:zuo:=a[i]+a[j];
  2:zuo:=a[i]-a[j];
  3:zuo:=a[i]*a[j];
  4:rl:=a[i]/a[j];
 end;
 if trunc(rl)<>Rl then break;
 rr:=0;
 case r of
  1:you:=a[x]+A[y];
  2:you:=a[x]-a[y];
  3:you:=a[x]*a[y];
  4:rr:=a[x]/a[y];
  end;

 if trunc(rr)<>Rr then break;
 if l=4 then zuo:=trunc(rl);
 if r=4 then you:=trunc(rr);
 if zuo+you=24 then
   begin
   ss:='(('+chr(a[i]+48)+get(l)+chr(a[j]+48)+')+('+chr(a[x]+48)+get(r)+chr(a[y]+48)+'))';
   if ans>ss then ans:=ss;
   end;
 if zuo-you=24 then
   begin
   ss:='(('+chr(a[i]+48)+get(l)+chr(a[j]+48)+')-('+chr(a[x]+48)+get(r)+chr(a[y]+48)+'))';
   if ans>ss then ans:=ss;
   end;
 if zuo*you=24 then
   begin
   ss:='(('+chr(a[i]+48)+get(l)+chr(a[j]+48)+')*('+chr(a[x]+48)+get(r)+chr(a[y]+48)+'))';
   if ans>ss then ans:=ss;
   end;
  if you<>0 then
 if (trunc(zuo/you)=zuo/you)and(trunc(zuo/you)=24) then
   begin
   ss:='(('+chr(a[i]+48)+get(l)+chr(a[j]+48)+')/('+chr(a[x]+48)+get(r)+chr(a[y]+48)+'))';
   if ans>ss then ans:=ss;
   end;
 end;
end;
writeln(ans);
close(output);
end.
