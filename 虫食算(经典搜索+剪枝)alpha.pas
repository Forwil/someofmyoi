program alpha;
var a:array['A'..'Z']of integer;
    b:array[0..26]of boolean;
    i,j,k,n,m:longint;
    s1,s2,s3:string;
procedure out;
var i,Y:char;
begin
Y:=chr(ord('A')+n-1);
for i:='A' to pred(y) do
write(a[i],' ');
write(a[y]);
close(output);
halt;
end;
procedure go(x,l,jin:longint);
var i,j,z:longint;
begin
if x=0 then
 begin
 if jin=0 then out
 else exit;
 end;

for z:=n downto 1 do
if (a[s2[z]]<>-1)and(a[s1[z]]<>-1)and(a[s3[z]]<>-1) then
if ((a[s2[z]]+a[s1[z]])mod n<>a[s3[z]])and((a[s2[z]]+a[s1[z]]+1)mod n<>a[s3[z]]) then exit;

if l=1 then
 begin
  if a[s1[x]]=-1 then
  begin
   for i:=n-1 downto 0 do
   if b[i] then
    begin
    b[i]:=false;
    a[s1[x]]:=i;
    go(x,2,jin);
    b[i]:=true;
    a[s1[x]]:=-1;
    end;
   end
   else go(x,2,jin);
 end;

if l=2 then
 begin
  if a[s2[x]]=-1 then
   begin
   for i:=n-1 downto 0 do
    if b[i] then
     begin
     b[i]:=false;
     a[s2[x]]:=i;
     go(x,3,jin);
     b[i]:=true;
     a[s2[x]]:=-1;
     end;
   end else    go(x,3,jin);
 end;

if l=3 then
 begin
 if a[s3[x]]<>-1 then
  begin
  if a[s3[x]]=(a[s1[x]]+a[s2[x]]+jin)mod n then
   go(x-1,1,(a[s1[x]]+a[s2[x]]+jin) div n);
  end
 else
  begin
   z:=a[s1[x]]+a[s2[x]]+jin;
  if b[z mod n] then
   begin
   b[z mod n]:=false;
   a[s3[x]]:=z mod n;
   go(x-1,1,z div n);
   b[z mod n]:=true;
   a[s3[x]]:=-1;
   end;
  end;
 end;
end;
begin
assign(input,'alpha.in');reset(input);
assign(output,'alpha.out');rewrite(output);
readln(n);
fillchar(a,sizeof(a),$ff);
fillchar(b,sizeof(b),true);
readln(s1);readln(s2);readln(s3);
go(n,1,0);
end.