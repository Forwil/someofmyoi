program rprp;
var s,ss,out:ansistring;
   r,p,rp,i,j,k,n,m,ans:longint;
begin
assign(input,'rprp.in');reset(input);
assign(output,'rprp.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 readln(ss);
 s:='';
 for j:=length(ss) downto 1 do
  s:=s+ss[j];
  k:=pos('jszxoier',s);
 if k<>0 then
  begin
    k:=pos('cow',s);
    r:=0;
    p:=0;
    rp:=0;
    while k<>0 do
     begin
     delete(s,k,3);
     inc(r);
     k:=pos('cow',s);
     end;
   for j:=1 to length(s) do
    if s[j]='r' then
     begin
     inc(r);
     if j<length(s) then
     if s[j+1]='p' then inc(rp);
     end
     else  if s[j]='p' then inc(p);
      if r*5+p*5+20*rp>ans then
      begin
      ans:=r*5+p*5+20*rp;
      out:=ss;
      end
     else if (r*5+p*5+20*rp=ans)and(length(ss)<length(out)) then
     out:=ss;
  end;
 end;
writeln(out);
writeln(ans);
close(output);
end.
