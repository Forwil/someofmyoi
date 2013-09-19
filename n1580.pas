program n1580;
var z:array[0..100001,1..2]of longint;
 t,i,j,k,n,m,x,ans:longint;
begin
assign(input,'n1580.in');reset(input);
while not(eof) do
  begin
   read(n);
   t:=0;
   ans:=0;
    for i:=1 to n+1 do
     begin
     if i<=n then read(x)
     else x:=-1;
      if(x>z[t,2])or(t=0)then
         begin
         t:=t+1;
         z[t,2]:=x;
         z[t,1]:=i;
         end
      else
       begin
       while(z[t,2]>=x)and(t>0)do
         begin
         if (i-z[t,1])*z[t,2]>ans then
           ans:=(i-z[t,1])*z[t,2];
         t:=t-1;
         end;
       t:=t+1;
       z[t,2]:=x;
       end;
     end;
     readln;
     writeln(ans);
  end;
  writeln(0);
end.