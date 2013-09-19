program mm1;
const p:array['0'..'9']of boolean=
 (true,true,false,false,true,true,true,false,false,true);
var s1,s2:string;
c1,c2:char;
begin
while true do
 begin
 readln(s1);
 if s1<>'-1' then readln(s2)
 else break;
 c1:=s1[length(s1)];
 c2:=s2[length(s2)];
 if p[c1] or p[c2] then
      writeln('MengMeng')
 else writeln('SheepDaddy');
 end;
end.