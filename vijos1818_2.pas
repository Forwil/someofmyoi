program vijos1818_2;
var s,s1,s2,ss:string;
    xi:array[0..1000]of longint;
    flag:array[0..1000]of integer;
   t,i,j,k,n,m,a,b,c:longint;
   dei,x1,x2:real;
begin
readln(ss);
s1:=copy(ss,1,pos('=',ss)-1);
delete(ss,1,pos('=',ss));
s2:=ss;
t:=0;
while s1<>'' do
 begin
  t:=t+1;
  xi[t]:=1;
  if s1[1]='+' then delete(s1,1,1)
  else
  if s1[1]='-' then begin xi[t]:=-1; delete(s1,1,1);end;

  if s1[1]='x' then
     begin
     delete(s1,1,1);
     if s1[1]='^' then
        begin
        delete(s1,1,2);
        flag[t]:=2;
        end
     else flag[t]:=1;
     end
  else
  if s1[1] in['0'..'9'] then
    begin
    s:='';
    s:=s+s1[1];
    delete(s1,1,1);
    while (s1<>'')and(s1[1] in['0'..'9']) do
      begin
      s:=s+s1[1];
      delete(s1,1,1);
      end;
    val(s,i,j);
    xi[t]:=xi[t]*i;
    if s1[1]='x' then
      begin
       delete(s1,1,1);
       if s1[1]='^' then
        begin
        delete(s1,1,2);
        flag[t]:=2;
        end
       else flag[t]:=1;
      end;
    end;
 end;

while s2<>'' do
 begin
  t:=t+1;
  xi[t]:=-1;
  if s2[1]='+' then delete(s2,1,1)
  else
  if s2[1]='-' then begin xi[t]:=1; delete(s2,1,1);end;
  if s2[1]='x' then
     begin
     delete(s2,1,1);
     if s2[1]='^' then
        begin
        delete(s2,1,2);
        flag[t]:=2;
        end
     else flag[t]:=1;
     end
  else
  if s2[1] in['0'..'9'] then
    begin
    s:='';
    s:=s+s2[1];
    delete(s2,1,1);
    while (s2<>'')and(s2[1] in['0'..'9']) do
      begin
      s:=s+s2[1];
      delete(s2,1,1);
      end;
    val(s,i,j);
    xi[t]:=xi[t]*i;
    if s2[1]='x' then
      begin
       delete(s2,1,1);
       if s2[1]='^' then
        begin
        delete(s2,1,2);
        flag[t]:=2;
        end
       else flag[t]:=1;
      end;
    end;
 end;
 a:=0;
 b:=0;
 c:=0;
for i:=1 to t do
begin
if flag[i]=0 then c:=c+xi[i];
if flag[i]=1 then b:=b+xi[i];
if flag[i]=2 then a:=a+xi[i];
end;
if (a=0)and(b=0)and(c=0) then writeln('181818181818')
else
if a=0 then
  begin
  if  b<>0 then
   begin
   writeln(1);
   writeln((-c)/b:0:5);
   end
  else writeln(0);
  end
else
  begin
  dei:=b*b-4*a*c;
   if dei=0 then
      begin
      writeln(1);
      writeln((-b)/(2*a):0:5);
      end
   else
   if dei>0 then
      begin
      writeln(2);
      x1:=(-b+sqrt(dei))/(2*a);
      x2:=(-b-sqrt(dei))/(2*a);
      if x1>x2 then
           begin
           x1:=x1+x2;
           x2:=x1-x2;
           x1:=x1-x2;
           end;
           if x1=0 then x1:=0;
           if x2=0 then x2:=0;
      writeln(x1:0:5,' ',x2:0:5);
      end
     else
      writeln(181818181818);
  end;
end.
