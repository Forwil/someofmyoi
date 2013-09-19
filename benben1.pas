program benben1;
var
    s,ss:ansistring;
   t,ans,i,k,n,m:longint;
procedure go(s:ansistring;j:longint);
var
   sss:ansistring;
begin
 t:=t+1;
 writeln('STEP',t:5,':',s);
if s=ss then halt;
if (j>=3)and(j<=m+n-1) then
 begin
  sss:=copy(s,j-2,5);
 if sss='BB_WW' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end;
 if sss='BB_BW' then begin s[j]:=s[j+2];s[j+2]:='_';go(s,j+2);end;
 if sss='BB_WB' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end;

 if sss='WB_WW' then begin s[j]:=s[j+1];s[j+1]:='_';go(s,j+1);end;
 if sss='WB_BW' then begin s[j]:=s[j+2];s[j+2]:='_';go(s,j+2);end;
 if sss='WB_BB' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end;

 if sss='BW_WB' then begin s[j]:=s[j-2];s[j-2]:='_';go(s,j-2);end;
 if sss='BW_BB' then begin s[j]:=s[j-2];s[j-2]:='_';go(s,j-2);end;
 if sss='BW_WW' then begin s[j]:=s[j-2];s[j-2]:='_';go(s,j-2);end;

 if sss='WW_WB' then begin s[j]:=s[j+1];s[j+1]:='_';go(s,j+1);end;
 if sss='WW_BW' then begin s[j]:=s[j+2];s[j+2]:='_';go(s,j+2);end;
 if sss='WB_WB' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end;
 end;
if j=2 then
 begin
  sss:=copy(s,1,4);
 if sss='B_WB' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end;
 if sss='W_WB' then begin s[j]:=s[j+1];s[j+1]:='_';go(s,j+1);end;
 if sss='W_BW' then begin s[j]:=s[j+2];s[j+2]:='_';go(s,j+2);end;
 if sss='B_BW' then begin s[j]:=s[j+2];s[j+2]:='_';go(s,j+2);end;
 end;

if j=1 then
begin
sss:=copy(s,1,3);
if sss='_WB' then begin s[j]:=s[j+1];s[j+1]:='_';go(s,j+1);end;
if sss='_BW' then begin s[j]:=s[j+2];s[j+2]:='_';go(s,j+2);end;
end;
if j=n+m then
  begin
  sss:=copy(s,j-2,4);
 if sss='BW_W' then begin s[j]:=s[j-2];s[j-2]:='_';go(s,j-2);end;
 if sss='BW_B' then begin s[j]:=s[j-2];s[j-2]:='_';go(s,j-2);end;
 if sss='WB_W' then begin s[j]:=s[j+1];s[j+1]:='_';go(s,j+1);end;
 if sss='WB_B' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end;
 end;

if j=n+m+1 then
begin
sss:=copy(s,j-2,3);
if sss='BW_' then begin s[j]:=s[j-2];s[j-2]:='_';go(s,j-2);end;
if sss='WB_' then begin s[j]:=s[j-1];s[j-1]:='_';go(s,j-1);end
end;

end;
begin
readln(n,m);
s:='_';
ss:='_';
for i:=1 to n do
 begin
 s:='B'+s;
 ss:=ss+'B';
 end;
for i:=1 to m do
 begin
 s:=s+'W';
 ss:='W'+ss;
 end;
t:=-1;
go(s,n+1);
writeln(t);
end.
