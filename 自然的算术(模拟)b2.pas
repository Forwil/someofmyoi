program b2;
var ss,s,s1:string;
    xi,xx:array[0..50]of longint;
    c,cc:array[0..50]of boolean;
    ch:char;
   aa,sum,a,n,m,o,tt,g,j,k,t,i,b:longint;
begin
assign(input,'b.in');reset(input);
assign(output,'b.out');rewrite(output);
t:=0;
readln(s);
i:=1;
while pos(' ',s)<>0 do delete(s,pos(' ',s),1);
if pos('<>',s)<>0 then
    begin
    s1:=copy(s,1,pos('<>',s)-1);
    delete(s,1,pos('<>',s)+1);
    b:=1;
    end
else
if pos('<=',s)<>0 then
    begin
    s1:=copy(s,1,pos('<=',s)-1);
    delete(s,1,pos('<=',s)+1);
    b:=2;
    end
else
if pos('>=',s)<>0 then
    begin
    s1:=copy(s,1,pos('>=',s)-1);
    delete(s,1,pos('>=',s)+1);
    b:=3;
    end
else
if pos('=',s)<>0 then
    begin
    s1:=copy(s,1,pos('=',s)-1);
    delete(s,1,pos('=',s));
    b:=4;
    end
else
if pos('>',s)<>0 then
    begin
    s1:=copy(s,1,pos('>',s)-1);
    delete(s,1,pos('>',s));
    b:=5;
    end
else
if pos('<',s)<>0 then
    begin
    s1:=copy(s,1,pos('<',s)-1);
    delete(s,1,pos('<',s));
    b:=6
    end
else
i:=1;
while i<=length(s) do
begin
if (s[i]='*')and(s[i+1]='x') then
begin
delete(s,i,1);
i:=i+2;
end
else i:=i+1;
end;
i:=1;
while i<=length(s1) do
if (s1[i]='*')and(s1[i+1]='x') then
begin
delete(s1,i,1);
i:=i+1;
end
else i:=i+1;
i:=1;
t:=0;
while i<=length(s1) do
 begin
 t:=t+1;
 xi[t]:=1;
 if s1[i]='-' then begin xi[t]:=-1; i:=i+1;end;
 if s1[i]='+' then i:=i+1;
 if s1[i] in ['0'..'9']then
            begin
            ss:=s1[i];
            i:=i+1;
            while s1[i]in['0'..'9'] do
                begin
                ss:=ss+s1[i];
                i:=i+1;
                end;
            val(ss,k,j);
            xi[t]:=xi[t]*k;
            end;
  if (s1[i]='x')and(i<=length(s1)) then
           begin
           i:=i+1;
           c[t]:=true;
           end;
  while (i<=length(s1))and(s1[i]='*') do
     begin
     i:=i+1;
  if s1[i]='-' then a:=-1
  else a:=1;
  if s1[i] in ['0'..'9']then
            begin
            ss:=s1[i];
            i:=i+1;
            while (i<=length(s1))and(s1[i]in['0'..'9']) do
                begin
                ss:=ss+s1[i];
                i:=i+1;
                end;
            val(ss,k,j);
            xi[t]:=xi[t]*a*k;
            end;
       if (s1[i]='x')and(i<=length(s1)) then
           begin
           i:=i+1;
           c[t]:=true;
           end;
    end;
end;
tt:=t;
t:=0;
i:=1;
while i<=length(s) do
 begin
 t:=t+1;
 xx[t]:=1;
 if s[i]='-' then begin xx[t]:=-1; i:=i+1;end;
 if s[i]='+'  then i:=i+1;
 if s[i] in ['0'..'9']then
            begin
            ss:=s[i];
            i:=i+1;
            while (i<=length(s))and(s[i]in['0'..'9']) do
                begin
                ss:=ss+s[i];
                i:=i+1;
                end;
            val(ss,k,j);
            xx[t]:=xx[t]*k;
            end;
  if (s[i]='x')and(i<=length(s)) then
           begin
           i:=i+1;
           cc[t]:=true;
           end;
  while (i<=length(s))and(s[i]='*') do
     begin
     i:=i+1;
  if s[i]='-' then a:=-1
  else a:=1;
  if s[i] in ['0'..'9']then
            begin
            ss:=s[i];
            i:=i+1;
            while (s[i]in['0'..'9'])and(i<=length(s)) do
                begin
                ss:=ss+s[i];
                i:=i+1;
                end;
            val(ss,k,j);
            xx[t]:=xx[t]*a*k;
            end;
     if (s[i]='x')and(i<=length(s)) then
           begin
           i:=i+1;
           cc[t]:=true;
           end;
    end;
end;
for i:=1 to t do
 xx[i]:=-xx[i];
 sum:=0;
for i:=1 to t do
if cc[i]=false then
 sum:=sum+xx[i];
for i:=1 to tt do
if c[i]=false then
 sum:=sum+xi[i];
aa:=0;
for i:=1 to t do
 if cc[i] then
  aa:=aa+xx[i];
for i:=1 to tt do
if c[i] then
 aa:=aa+xi[i];
readln(n);
for i:=1 to n do
 begin
 readln(a);
 a:=a*aa+sum;
 case b of
  1:if a<>0 then writeln((a-sum)div aa);
  2:if a<=0 then writeln((a-sum)div aa);
  3:if a>=0 then writeln((a-sum)div aa);
  4:if a=0 then writeln((a-sum)div aa);
  5:if a>0 then writeln((a-sum)div aa);
  6:if a<0 then writeln((a-sum)div aa);
  end;
 end;
 close(output);
end.