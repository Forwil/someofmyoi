program a9_8;
var s:ansistring;
    hash:Array[0..550]of longint;
    ans:array[0..550]of longint;
    b:array[0..1000]of boolean;
    z:array[0..1000,0..2]of longint;
    out,q,p,i,j,k,n,m,o,x,y:longint;
procedure go(x,l:longint);
begin
if z[x,1]<>0 then go(z[x,1],l+1);
if z[x,2]<>0 then go(z[x,2],l+1);
ans[x]:=l;
end;
begin


readln(s);
while s<>'END'  do
 begin
 fillchar(hash,sizeof(hash),0);
 fillchar(z,sizeof(z),0);
 fillchar(b,sizeof(b),true);
 fillchar(ans,sizeof(ans),0);
 o:=0;
  for i:=1 to length(s) do
    begin
     if hash[ord(s[i])]=0 then
        begin
        o:=o+1;
        hash[ord(s[i])]:=o;
        end;
     inc(z[hash[ord(s[i])],0]);
   end;

   for i:=1 to o-1  do
    begin
    q:=maxlongint;
    p:=maxlongint;
     for j:=1 to o+i-1 do
     if b[j] then
      begin
      if z[j,0]<p then
          begin
          q:=p;
          x:=y;
          p:=z[j,0];
          y:=j;
          end
     else
       if z[j,0]<q then
          begin
          q:=z[j,0];
          x:=j;
          end;
      end;

   z[o+i,1]:=x;
   z[o+i,2]:=y;
   z[o+i,0]:=q+p;
   b[x]:=false;
   b[y]:=false;
  end;

 go(2*o-1,0);
 out:=0;
 for i:=1 to o  do
  out:=out+ans[i]*z[i,0];
if out=0 then writeln(length(s)*8,' ',length(s),' ',8.0:0:1)else
 writeln(length(s)*8,' ',out,' ',(length(s))*8/out:0:1);
 readln(s);
 end;
end.
