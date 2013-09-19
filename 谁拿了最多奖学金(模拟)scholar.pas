program scholar;
var name:array[0..101]of string;
    mon,i,j,k,n,m,f,b,l,z,now:longint;
    ch,ch2:char;
    out:string;
begin
assign(input,'scholar.in');reset(input);
assign(output,'scholar.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 now:=0;
  read(ch);
  while ch<>' ' do
   begin
   name[i]:=name[i]+ch;
   read(ch);
   end;
 read(f,b);
 read(ch);
 read(ch);
 read(ch2);
 read(ch2);
 readln(l);
 if (f>80)and(l>=1) then now:=now+8000;
 if (b>80)and(f>85) then now:=now+4000;
 if (f>90) then now:=now+2000;
 if (f>85)and(ch2='Y') then now:=now+1000;
 if (b>80)and(ch='Y')  then now:=now+850;
 z:=z+now;
 if now>mon then
 begin
 mon:=now;
 out:=name[i];
 end;
 end;
writeln(out);
writeln(mon);
writeln(z);
close(output);
end.
