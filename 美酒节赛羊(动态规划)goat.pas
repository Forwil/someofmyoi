program goat;
var dp:array[0..1,-10..101]of longint;
   q,t,x,y,z,time,now,s,i,j,k,n,m,v,p:longint;
   fi:boolean;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'goat.in');reset(input);
assign(output,'goat.out');rewrite(output);
readln(s,p);
   if s>1000 then
     if p>5 then begin
        q:=trunc((s-1000)/15)+1;
        s:=s-15*q;
        t:=6*q;
     end else
     if p=5 then begin
        q:=trunc((s-1000)/30)+1;
        s:=s-30*q;
        t:=12*q;
     end else
     if p>=2 then begin
        q:=trunc((s-1000)/14)+1;
        s:=s-14*q;
        t:=6*q;
     end;

now:=0;
fillchar(dp,sizeof(dp),$f7);
dp[0,0]:=0;
fi:=true;
while fi do
 begin
 time:=time+1;
 now:=time and 1;
  for i:=0 to p do
    begin
    dp[now,i]:=max(dp[1-now,i-5]+10,dp[1-now,i-2]+5);
    dp[now,i]:=max(dp[now,i],dp[1-now,i+1]+1);
   if i=0 then
    dp[now,i]:=max(dp[now,i],dp[1-now,0]+1);
    if dp[now,i]>=s then fi:=false;
   end;
 end;
writeln(time+t);
close(output);
end.
