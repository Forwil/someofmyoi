program wisdom;
 var  a,b,c,a1,b1,c1,i,j,k,n,m,ans:longint;
procedure go(p,q,p1,q1,k:longint);
begin
if p1<=0 then exit;
if p<=0 then inc(ans);
if p<=0 then exit;
if (q>=100)and(q1>=100) then
 go(p-25,q-90,p1-15,q1-100,k+1)
else
if (q>=100)and(q1<100) then
 begin
 if k<5 then go(p-b1,q-90,p1-15,q1,k+1);
 go(p,q-90,p1-15,q1+20,0);
 end
else
if (q<100)and(q1>=100) then
 begin
 go(p-25,q+10,p1-b,q1-100,k+1);
 end
else
 begin
 if k<5 then go(p-b1,q+10,p1-b,q1,k+1);
 go(p,q+10,p1-b,q1+20,0);
 end;
end;
begin
assign(input,'wisdom.in');reset(input);
assign(output,'wisdom.out');rewrite(output);
readln(a,b,c);
readln(a1,b1,c1);
ans:=0;
go(a,c,a1,c1,0);
if ans <>0 then
writeln(ans)
else
writeln('No answer');
close(output);
end.
