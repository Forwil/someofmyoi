program equal;
const p=maxlongint;
var a,b,i,j,n,m:longint;
 s,ss,ans:string;
  c:array[0..101]of char;
 x:array[0..101]of int64;
 k:int64;
 can:boolean;
 oo:array[-1..9]of int64;
function g(ch1,ch2:char):boolean;
begin             {
if (ch1 in['+','-'])and(ch2 in['*','^']) then exit(true);
if (ch1='(') then exit(true);
if (ch2='(') then exit(true);
if (ch1=')') then exit(true);
exit(false);     }
case ch2 of
'+':if ch1='(' then exit(true) else exit(false);
'-':if ch1='(' then exit(true) else exit(false);
'*':if (ch1='+')or(ch1='-')or(ch1='(') then exit(true) else exit(false);
'^':if (ch1='^')or(ch1=')') then exit(false) else exit(true);
'(':if (ch1=')') then exit(false) else exit(true);
')':if ch1='(' then exit(true) else exit(false);
'$':exit(false);
end;
end;
function count(a:int64;ch:char;b:int64):int64;
var i:longint;
z:int64;
begin
case ch of
 '+':exit((a+b)mod p);
 '-':exit((a-b)mod p);
 '*':exit((a*b)mod p);
 '^':
 begin
 z:=1;
 for i:=1 to b do
   z:=(z*a) mod p;
  exit(z);
 end;
 end;
end;
function get(s:string;b:longint):int64;
var ss:string;
  i,j,k,tx,tc,z:longint;
  xx,yy:int64;
  ch:char;
 begin
while pos('a',s)<>0 do s[pos('a',s)]:=chr(b+48);
tc:=0;
tx:=0;
i:=0;
while i<=length(s) do
 begin
 i:=i+1;
 if i>length(s) then s[i]:='$';
   if s[i]in['$','+','-','*','^','(',')'] then
     begin
     if g(c[tc],s[i])or(tc=0)then
       begin
        if not((c[tc]='(')and(s[i]=')')) then
        begin
        tc:=tc+1;
        c[tc]:=s[i];
        end
        else tc:=tc-1;
       end
     else
      begin
      while (tc<>0)and(not(g(c[tc],s[i]))) do
       begin
       if not(c[tc] in['+','-','*','^']) then
       break;
          xx:=x[tx-1];
          yy:=x[tx];
          tx:=tx-1;
          ch:=c[tc];
          tc:=tc-1;
          x[tx]:=count(xx,ch,yy);
       end;
       if not((c[tc]='(')and(s[i]=')')) then
        begin
        tc:=tc+1;
        c[tc]:=s[i];
        end
        else tc:=tc-1;
      end;
     end
   else
    begin
    j:=i;
    while (j+1<=length(s))and(s[j+1]in ['0'..'9']) do
    inc(j);
    ss:=copy(s,i,j-i+1);
    i:=j;
    val(ss,j,k);
    tx:=tx+1;
    x[tx]:=j;
    end;
 end;
 exit(x[1]);
end;
begin
assign(input,'equal.in');reset(input);
assign(output,'equal.out');rewrite(output);
readln(s);
while pos(' ',s)<>0 do delete(s,pos(' ',s),1);
for i:=1 to 9 do
oo[i]:=get(s,i);
readln(n);
for i:=1 to n do
 begin
 readln(s);

 while pos(' ',s)<>0 do delete(s,pos(' ',s),1);
 can:=true;
 for j:=1 to 9 do
  begin
  k:=get(s,j);
  if k<>oo[j] then
   begin  can:=false;
   break;end;
  end;
  if can then ans:=ans+chr(i+64);
 end;
 writeln(ans);
close(output);
end.
