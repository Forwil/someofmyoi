program crack;
var dat:array[0..2001]of integer;
    mi,t,w,i,j,k,n,m,ans1,ans2:longint;
    ch:char;
   can:boolean;
procedure try(x:longint);
var a,en:array[0..2001]of integer;
    i,j,t,tot,now:longint;
begin
a:=dat;
tot:=0;
now:=0;
fillchar(en,sizeof(en),0);
for i:=1 to n do
 begin
   t:=(4-(a[i]+now) mod 4)mod 4;
   a[i]:=(a[i]+now+t*ord(i<=n-x+1)) mod 4;
 if i<=n-x+1 then
   begin
   now:=now+t;
   en[i+x-1]:=-t;
   end;
   inc(now,en[i]);
   inc(tot,t);
 end;

for i:=n-x+1 to n do
if a[i]<>0 then
 exit;


 if tot<ans1 then
  begin
  ans1:=tot;
  ans2:=x;
  end
 else
 if tot=ans1 then ans2:=x;
end;
begin
assign(input,'crack.in');reset(input);
assign(output,'crack.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 read(ch);
 dat[i]:=ord(ch)-65;
 end;
ans1:=maxlongint;
for i:=1 to n do
 try(i);

writeln(ans1,' ',ans2);
close(output);
end.
