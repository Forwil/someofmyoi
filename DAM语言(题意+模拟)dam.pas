program dam;
var z:array[0..101,0..201]of int64;
    out:array[0..201]of int64;
    i,j,k,n,m:longint;
    top:longint;
    s:string;
    first:boolean;
begin
ASSIGN(input,'dam.in');reset(input);
Assign(output,'dam.out');rewrite(output);
readln(s);
top:=1;
z[top,1]:=1;
for i:=1 to length(s) do
begin
if s[i]='D' then
  begin
    z[top+1]:=z[top];
    top:=top+1;
  end;
if s[i]='A' then
  begin
  for j:=1 to 100 do
  z[top-1,j]:=z[top-1,j]+z[top,j];
  top:=top-1;
  end;
if s[i]='M' then
  begin
  fillchar(out,sizeof(out),0);
  for j:=1 to 100 do
  for k:=1 to 100 do
  out[j+k]:=out[j+k]+z[top-1,j]*z[top,k];
  z[top-1]:=out;
  top:=top-1;
  end;
end;
first:=true;
out:=z[top];
for i:=100 downto 2 do
if out[i]<>0 then
 begin
 if first then
  begin
  if out[i]=1 then write('x^',i)
  else             write(out[i],'x^',i);
  first:=false;
  end
 else
 if out[i]=1 then write('+x^',i)
 else             write('+',out[i],'x^',i);
 end;
 if out[1]<>0 then
  if out[1]=1 then writeln('+','x')
  else             writeln('+',out[1],'x');
 close(output);
end.
