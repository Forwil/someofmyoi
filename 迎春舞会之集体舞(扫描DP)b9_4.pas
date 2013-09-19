program b9_4;
var dp:array[0..101,0..221]of longint;
    tab:array[0..101,0..221]of char;
    i,j,k,n,m,ans:longint;
    ch:char;
function min(a,b:longint):longint;
begin if a>b then exit(b)else exit(a);  end;
begin

readln(n);
for i:=1 to n do
begin
for j:=1 to 2*n-i do
 begin
 read(tab[i,j]);
 if (tab[i,j]='-') then
 dp[i,j]:=min(min(dp[i-1,j-1],dp[i-1,j]),dp[i-1,j+1])+1
 else
 dp[i,j]:=0;
 if (dp[i,j]>ans)and((j+i) mod 2 =0) then ans:=dp[i,j];
 end;
readln;
end;

fillchar(dp,sizeof(dp),0);
for i:=n downto 1 do
begin
for j:=1 to 2*n-i do
 begin
 if tab[i,j]='-'then
  dp[i,j]:=min(min(dp[i+1,j-1],dp[i+1,j]),dp[i+1,j+1])+1
  else
  dp[i,j]:=0;
  if (dp[i,j]>ans)and((j+i) mod 2=1) then ans:=dp[i,j];
 end;
end;
writeln(ans*ans);

end.
