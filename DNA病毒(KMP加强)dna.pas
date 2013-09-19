program dna;
var p:array[0..8001]of integer;
   s,ss:ansistring;
 t,i,j,k,n,m,x:longint;

function find:boolean;
var i,j:longint;
 ssss,sss:ansistring;
begin
j:=0;
for i:=1 to length(s) do
 begin
 while (j>0)and(ss[j+1]<>s[i]) do j:=p[j];
 if ss[j+1]=s[i] then j:=j+1;

 if j=length(ss) then exit(true);

 if i-length(ss)+1>=1 then
 begin
 if (ss[length(ss)]<>s[i-j])
 or(ss[j+1]<>s[i-length(ss)+1]) then
 continue;

 sss:=copy(ss,j+1,length(ss)-j);
 ssss:=copy(s,i-length(ss)+1,length(sss));
 if sss=ssss then exit(true);
 end;
 end;
exit(false);
end;

begin
assign(input,'dna.in');reset(input);
assign(output,'dna.out');rewrite(output);
readln(t);
for k:=1 to t do
 begin
 readln(s);
 readln(ss);
 j:=0;
     for x:=2 to length(ss) do
      begin
      while (j>0)and(ss[j+1]<>ss[x]) do j:=p[j];
      if ss[j+1]=ss[x] then j:=j+1;
      p[x]:=j;
      end;

 if find then writeln('YES')
 else writeln('NO');
 end;
 close(output);
end.
