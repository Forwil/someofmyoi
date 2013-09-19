program express;
var c:array[-2..5000]of char;
    num:array[-2..5000]of longint;
    count:array[0..2500]of string;
    ss,ans,s1,s2:ansistring;
   z,x,y,i,j,k,n,m,tc,tn:longint;
   ch:char;
function big(a,b:char):boolean;
begin
if a=')' then exit(false);
if a='(' then exit(true);
if b='(' then exit(true);
if (a in['+','-'])and(b in['*','/']) then exit(false);
if (a in['*','/'])and(b in['+','-']) then exit(true);
if (a in['+','-'])and(b in['+','-']) then exit(false);
if (a in['*','/'])and(b in['*','/']) then exit(false);
if (a='^')and(b<>'^') then exit(true);
if (b='^')and(a<>'^') then exit(false);
if (a='^')and(b='^')then exit(false);
end;
function suan(a:longint;c:char;b:longint):longint;
begin
case c of
 '+': exit(a+b);
 '-': exit(a-b);
 '*': exit(a*b);
 '/': exit(a div b);
 '^': exit(a**b);
end
end;
begin
assign(input,'express.in');reset(input);
assign(output,'express.out');rewrite(output);
 readln(ss);
 for i:=1 to length(ss) do
 if (ss[i]='(')or(ss[i]=')') then n:=n-1;
 n:=n+length(ss);
 ss:=ss+')';
 tc:=0;
 tn:=0;
 c[0]:='(';
 for i:=1 to length(ss) do
  begin
   if ss[i] in ['^','+','-','*','/','(',')']  then
     begin
      if big(ss[i],c[tc]) then
        begin
         tc:=tc+1;
         c[tc]:=ss[i];
        end
      else
       begin
        while (not(big(ss[i],c[tc])))
        and(((ss[i]=')')and(c[tc]='('))=false)do
          begin
          ch:=c[tc];tc:=tc-1;
          x:=num[tn];tn:=tn-1;
          y:=num[tn];tn:=tn-1;
          str(x,s1);
          str(y,s2);
          z:=suan(y,ch,x);
          ans:=ans+' '+ch;
          tn:=tn+1;
          num[tn]:=z;
          end;

         if ((ss[i]=')')and(c[tc]='(')) then
         tc:=tc-1
         else begin
              tc:=tc+1;
              c[tc]:=ss[i];
              end;
        end;
      end
 else
    begin
    tn:=tn+1;
    ans:=ans+' '+ss[i];
    num[tn]:=ord(ss[i])-48;
    end;
  end;
  ans:=ans+' ';
  delete(ans,1,1);
for i:=1 to length(ss) do
begin
s1:=copy(ans,1,pos(' ',ans)-1);
delete(ans,1,pos(' ',ans));
count[i]:=s1;
end;
for i:=1 to n do
if i<n then write(count[i],' ')
else writeln(count[i]);

for k:=1 to n div 2 do
begin
 for i:=1 to n-k*2+2 do
 if (length(count[i])=1)and(count[i][1] in ['^','*','+','-','/']) then
 break;
 val(count[i-2],y,j);
 val(count[i-1],x,j);
 z:=suan(y,count[i][1],x);
 str(z,s1);
 count[i-2]:=s1;
 for j:=i-1 to n-k*2 do
 count[j]:=count[j+2];
 for i:=1 to n-k*2 do
 if i<n-k*2 then write(count[i],' ')
 else writeln(count[i]);
 end;
 close(output);
end.
