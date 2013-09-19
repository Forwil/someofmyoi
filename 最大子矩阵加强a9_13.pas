program a9_13;
var
    l,r,d,dd,up,ll,rr:array[0..2001]of longint;
    i,j,k,n,m,now,last,ans1,ans2,len:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'a.in');reset(input);
readln(n,m);
for i:=1 to n do
 begin
 now:=i and 1;
 last:=1-now;
  for j:=1 to m do
    begin
    k:=j;
    read(d[j]);
    if ((d[j]<>d[j-1])and(j<>1)) then r[j]:=r[j-1]
    else r[j]:=j;

    if d[j]<>dd[j] then up[j]:=up[j]+1 else up[j]:=1;

    while (k>1)and(up[k-1]>=up[j]) do k:=rr[k-1];
    rr[j]:=k;
   end;
   readln;
  for j:=m downto 1 do
    begin
    if (d[j]<>d[j+1])and(j<>m) then l[j]:=l[j+1]
    else l[j]:=j;

    k:=j;
    while (up[k+1]>=up[j])and(k<m) do
    k:=ll[k+1];
    ll[j]:=k;

    len:=min(l[j],ll[j])-max(r[j],rr[j])+1;
    if len*up[j]>ans1 then ans1:=len*up[j];
    len:=min(len,up[j]);
    if len>ans2 then ans2:=len;
    end;
    dd:=d;
    fillchar(l,sizeof(l),0);
    fillchar(r,sizeof(r),0);
 end;
 writeln(ans2*ans2);
 writeln(ans1);
end.

