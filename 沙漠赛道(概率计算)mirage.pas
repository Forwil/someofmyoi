program mirage;
var s1,s2:array[0..4]of real;
  i,j,n,x:longint;
  k:extended;
  ans,mon,m1,m2,z,w1,w2,p,h1,h2:extended;
begin
assign(input,'mirage.in');reset(input);
assign(output,'mirage.out');rewrite(output);
readln(s1[1],s1[2],s1[3],s1[4]);
readln(s2[1],s2[2],s2[3],s2[4]);
readln(h1,h2);
s1[0]:=(1-s1[1])*(1-s1[2])*(1-s1[3])*(1-s1[4]);
s2[0]:=(1-s2[1])*(1-s2[2])*(1-s2[3])*(1-s2[4]);
w1:=h1/(h1+h2)*(s1[0])+h2/(h1+h2)*(1-s2[0])*s1[0];
w2:=h2/(h1+h2)*(s2[0])+h1/(h1+h2)*(1-s1[0])*s2[0];
p:=1-w1-w2;
readln(n);
m1:=0;m2:=0;z:=0;
K:=1;
for i:=1 to n do
begin
  readln(mon,x);
  if x=1 then m2:=m2+mon;
  if x=0 then m1:=m1+mon;
  z:=z+mon;
//  k:=k*exp((1/n)*ln(mon));
k:=k*mon;
end;
ans:=(z-m1*2)*w1+(z-m2*2)*w2+((z-(exp((1/n)*ln(k))){k}*n)*p);
writeln(w1:0:2,' ',w2:0:2,' ',p:0:2);
writeln(ans:0:2);
close(output);
end.
