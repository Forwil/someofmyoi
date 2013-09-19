program d10_23;
var   goalh,goals,nns,nnh:array[0..21,0..21]of integer;
      b:array[0..21,0..21]of integer;
      nowh,nows,dh,ds:array[0..21]of integer;
  t,x,i,j,k,n,m:longint;
function can(x,y,z:integer):boolean;
var i,j,t,l:longint;
begin
 if z=0 then
 begin
 if nowh[x]+(m-y)<dh[x]then exit(false);
 if nows[y]+(n-x)<ds[y]then exit(false);
 for i:=1 to nnh[x,0] do
  if nnh[x,i]<>goalh[x,i] then exit(false);
 for i:=1 to nns[y,0] do
  if nns[y,i]<>goals[y,i] then exit(false);
 exit(true);
 end;
 if z=1 then
 begin
 if nowh[x]+1>dh[x] then exit(false);
 if nows[y]+1>ds[y] then exit(false);

  if ((nnh[x,0]=goalh[x,0])and(nnh[x,nnh[x,0]]=goalh[x,goalh[x,0]]))or
     ((nns[y,0]=goals[y,0])and(nns[y,nns[y,0]]=goals[y,goals[y,0]]))then exit(false);

  if (b[x,y-1]=1)and(nnh[x,nnh[x,0]]=goalh[x,nnh[x,0]])then exit(false);
  if (b[x-1,y]=1)and(nns[y,nns[y,0]]=goals[y,nns[y,0]])then exit(false);

  if (nnh[x,nnh[x,0]]<goalh[x,nnh[x,0]])and(b[x,y-1]=1) then
    inc(nnh[x,nnh[x,0]])
  else
   begin
    nnh[x,0]:=nnh[x,0]+1;
    nnh[x,nnh[x,0]]:=1;
   end;

  if (nns[y,nns[y,0]]<goals[y,nns[y,0]])and(b[x-1,y]=1) then
    inc(nns[y,nns[y,0]])
  else
   begin
    nns[y,0]:=nns[y,0]+1;
    nns[y,nns[y,0]]:=1;
   end;
   exit(true);
 end;
end;

procedure out;
var i,j:longint;
begin
for i:=1 to n do
for j:=1 to m do
begin
if b[i,j]=1 then write('##')
else write('  ');
if j=m then writeln;
end;
close(output);
halt;
end;
procedure go(x,y:integer);
begin
 if y>m then
  begin
  if nowh[x]<>dh[x] then exit;
  x:=x+1;
  y:=1;
  end;
 if x>n then out;
 if can(x,y,0) then
  begin
  b[x,y]:=0;
  go(x,y+1);
  end;

 if can(x,y,1) then
  begin
  b[x,y]:=1;
  nowh[x]:=nowh[x]+1;
  nows[y]:=nows[y]+1;
  go(x,y+1);
  b[x,y]:=0;
  nnh[x,nnh[x,0]]:=nnh[x,nnh[x,0]]-1;
  nns[y,nns[y,0]]:=nns[y,nns[y,0]]-1;
  if nnh[x,nnh[x,0]]=0 then dec(nnh[x,0]);
  if nns[y,nns[y,0]]=0 then dec(nns[y,0]);
  nowh[x]:=nowh[x]-1;
  nows[y]:=nows[y]-1;
 end;
end;
begin
assign(input,'d.in');reset(input);
assign(output,'d.out');rewrite(output);
readln(m,n);
for i:=1 to m do
 begin
  read(x);
  goals[i,0]:=0;
 while x<>0 do
  begin
  goals[i,0]:=goals[i,0]+1;
  goals[i,goals[i,0]]:=x;
  ds[i]:=ds[i]+x;
  read(x);
  end;
  readln;
 end;
for i:=1 to n do
 begin
  read(x);
  goalh[i,0]:=0;
 while x<>0 do
  begin
  goalh[i,0]:=goalh[i,0]+1;
  dh[i]:=dh[i]+x;
  goalh[i,goalh[i,0]]:=x;
  read(x);
  end;
  readln;
 end;
go(1,1);
end.