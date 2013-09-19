program bags;
var dp:array[0..5001,0..61]of longint;
    ind:array[0..201,1..2]of longint;
    p:array[0..61]of longint;
 z,x,y,l,s,v,o,i,j,k,n,m,t,out:longint;
function min(a,b:longint):longint;
begin if a>b then exit(b) else exit(a);end;
begin
assign(input,'bags.in');reset(input);
assign(output,'bags.out');rewrite(output);
readln(k,v,n);
for i:=1 to n do
 readln(ind[i,1],ind[i,2]);
s:=0;
dp[0,0]:=1;
for i:=1 to n do
 for j:=s downto 0 do
 if (j+ind[i,1]<=v)and(dp[j,0]>0) then
   begin
    l:=j+ind[i,1];
    x:=1;
    y:=1;
    fillchar(p,sizeof(p),$f7);
    for z:=1 to min(dp[j,0]+dp[l,0],k) do
      begin
      if (x<=dp[j,0])and(dp[j,x]+ind[i,2]>dp[l,y]) then
          begin
            p[z]:=dp[j,x]+ind[i,2];
            x:=x+1;
          end
        else
         begin
           p[z]:=dp[l,y];
           y:=y+1;
         end;
      end;
    p[0]:=min(dp[l,0]+dp[j,0],k);
    dp[l]:=p;
    if l>s then s:=l;
   end;

   for i:=1 to k do
   out:=out+dp[v,i];
 writeln(out);
 close(output);
end.
