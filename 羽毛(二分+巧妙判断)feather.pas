program feather;
var dat:Array[0..20001]of longint;
   i,j,k,n,m,ans:longint;
   t,w,mi:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
function can(x:longint):boolean;
var z,cuse,cusen1:longint;
 i:longint;
begin
z:=dat[1];
for i:=2 to n do
 begin
 cuse:=x-dat[i-1];
 cusen1:=dat[1]-z;
 if i mod 2=1 then
  z:=max(0,dat[i]-(cuse-cusen1))
 else
  z:=min(dat[i],cusen1);
 end;
if z=0 then exit(true)
else exit(false);
end;
begin
assign(input,'feather.in');reset(input);
assign(output,'feather.out');rewrite(output);
readln(n);
for i:=1 to n do
 readln(dat[i]);

   ans:=dat[1]+dat[n];
   for i:=2 to n do
   if dat[i]+Dat[i-1]>ans then
   ans:=dat[i]+dat[i-1];

 if n mod 2=0 then  writeln(ans)
 else
 begin
 t:=ans;
 w:=ans*100;
 mi:=(t+w)shr 1;
 repeat
 if can(mi)then w:=mi-1
 else t:=mi+1;
 mi:=(t+w)shr 1;
 until t>w;
 writeln(mi+1);
 end;
close(output);
end.
