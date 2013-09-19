program Expr;
var i,j,k,n,m:longint;
 s:string;
function get(s:string):longint;
var i,ad,cf,k,kh,l:longint;
 doit:boolean;
begin
l:=0;
doit:=true;
for i:=1 to length(s) do
if s[i]='(' then inc(l)
else if s[i]=')' then
 begin
 dec(l);
 if (l=0)and(i<>length(s)) then  doit:=false;
 end;

if doit then
 while (s[1]='(')and(s[length(s)]=')') do
  begin
  delete(s,length(s),1);
  delete(s,1,1);
  end;

if ((pos('+',s)=0)or(s[1]='+'))and((s[1]='-')or(pos('-',s)=0))and(pos('*',s)=0) then
 begin
 val(s,k,i);
 exit(k);
 end;
  kh:=0;
  ad:=0;
  cf:=0;
  k:=0;
for i:=1 to length(s) do
 begin
  if s[i]='(' then inc(kh);
  if s[i]=')' then dec(kh);
  if kh=0 then
    begin
    if ((s[i]='+')or(s[i]='-'))and(i>1)then ad:=i;
    if s[i]='*' then cf:=i;
    end;
 end;

if ad=0 then k:=cf else k:=ad;

case s[k] of
 '+':exit(get(copy(s,1,k-1))+get(copy(s,k+1,length(s)-k)));
 '-':exit(get(copy(s,1,k-1))-get(copy(s,k+1,length(s)-k)));
 '*':exit(get(copy(s,1,k-1))*get(copy(s,k+1,length(s)-k)));
end;
end;

begin
assign(input,'expr.in');reset(input);
assign(output,'expr.out');rewrite(output);
readln(s);
i:=1;
if s[1]='+' then s:='0'+s;
if s[1]='-' then s:='0'+s;
while (pos('(+',s)<>0) do
  insert('0',s,pos('(+',s)+1);
while (pos('(-',s)<>0) do
  insert('0',s,pos('(-',s)+1);
writeln(get(s));
close(output);
end.
