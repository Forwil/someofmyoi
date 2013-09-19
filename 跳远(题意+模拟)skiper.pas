program skiper;
var ind:array[0..50]of real;
    sum:array[0..50]of real;
    out:array[0..50]of longint;
    i,j,k,n,m,v:longint;
    y,t,vv:real;
begin
assign(input,'skiper.in');reset(input);
assign(output,'skiper.out');rewrite(output);
readln(n,v);
for i:=1 to n do
 begin
 read(ind[i]);
 sum[i]:=sum[i-1]+ind[i];
 end;
 for i:=1 to n do
 sum[i]:=sum[i]-ind[i];
 vv:=v;
 for i:=1 to n-1 do
 begin
 k:=0;
  for j:=i+1 to n do
   begin
   t:=sum[j]+ind[j]/2-(sum[i]+ind[i]/2);
   t:=t/vv;
   y:=ind[i]*sqrt(3)/2+vv*t-5*t*t;
   if y<=ind[j]*sqrt(3)/2 then
        break
    else k:=j;
  end;
  out[i]:=k;
 end;
 write(out[1]);
 for i:=2 to n-1 do
  begin
  write(' ',out[i]);
  end;
  close(output);
end.
