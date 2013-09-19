program double;
var dp:array[0..4,0..4,0..4
            ,0..4,0..4,0..4
            ,0..4,0..4,0..4]of real;
   tab:array[1..9,0..4]of char;
   ii:Array[1..9]of integer;
   t,i,j,k,n,m:longint;
   ch:char;
   g:real;
begin
assign(input,'double.in');reset(input);
assign(output,'double.out');rewrite(output);
for i:=1 to 9 do
 for j:=1 to 4 do
 begin
 read(tab[i,j]);
 read(ch);
 if ch='0'then
 begin
 tab[i,j]:='0';
 read(ch);
 end;
 read(ch);
 if j=4 then readln;
 end;
dp[4,4,4,4,4,4,4,4,4]:=1;
for ii[1]:=4 downto 0 do
for ii[2]:=4 downto 0 do
for ii[3]:=4 downto 0 do
for ii[4]:=4 downto 0 do
for ii[5]:=4 downto 0 do
for ii[6]:=4 downto 0 do
for ii[7]:=4 downto 0 do
for ii[8]:=4 downto 0 do
for ii[9]:=4 downto 0 do
if dp[ii[1],ii[2],ii[3],ii[4],ii[5],ii[6],ii[7],ii[8],ii[9]]<>0 then
begin
g:=dp[ii[1],ii[2],ii[3],ii[4],ii[5],ii[6],ii[7],ii[8],ii[9]];
t:=0;
for i:=1 to 9 do
for j:=i+1 to 9 do
if (ii[i]<>0)and(ii[j]<>0)and(tab[i,ii[i]]=tab[j,ii[j]])then
inc(t);

for i:=1 to 9 do
for j:=i+1 to 9 do
if (ii[i]<>0)and(ii[j]<>0)and(tab[i,ii[i]]=tab[j,ii[j]])then
 begin
 ii[i]:=ii[i]-1;ii[j]:=ii[j]-1;
 dp[ii[1],ii[2],ii[3],ii[4],ii[5],ii[6],ii[7],ii[8],ii[9]]:=
 dp[ii[1],ii[2],ii[3],ii[4],ii[5],ii[6],ii[7],ii[8],ii[9]]+g*(1/t);
 ii[i]:=ii[i]+1;ii[j]:=ii[j]+1;
 end;

end;
writeln(dp[0,0,0,0,0,0,0,0,0]:0:6);
close(output);
end.
