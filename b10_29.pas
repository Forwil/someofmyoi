program b10_29;
var s,ss,goal:string;
  b:array[0..500]of boolean;
  i,j,k,n,m,tot:longint;
  find,t:boolean;
begin
readln(n);
for i:=1 to n do
 s:=s+'O';
for i:=1 to n do
 s:=s+'*';
 goal:=goal+'  ';
for i:=1 to n do
 goal:=goal+'O*';
 s:=s+'  ';
 j:=2*n+1;
 t:=true;
 fillchar(b,sizeof(b),true);
 tot:=0;
 writeln('step ',0,':',s);
repeat
 if j mod 2=1 then  ss:='O*';
 if j mod 2=0 then  ss:='*O';
 find:=false;
 for i:=n*2+1 downto 1  do
   if (copy(s,i,2)=ss)and(b[i])and(b[i+1]) then
    begin find:=true;b[j+1]:=false; break;end;
 if find=false then
  for i:=n*2+2 downto 1 do
   if (s[i+1]=ss[2])and(b[i+1])and(b[i])then
    begin find:=true;b[j+1]:=false;break;end;
 if find=false then
  for i:=n*2+2 downto 1 do
   if (s[i]=ss[1])and(b[i])and(b[i+1]) then
    begin find:=true;b[j]:=false;break;end;
 s[j]:=s[i];
 s[j+1]:=s[i+1];
 s[i]:=' ';
 s[i+1]:=' ';
 j:=i;
 m:=m+1;
 writeln('step ',m,':',s);
until s=goal;
end.
