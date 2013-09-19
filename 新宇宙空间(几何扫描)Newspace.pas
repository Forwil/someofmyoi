type
  dis=array[0..4] of integer;
var
  map:array[-50..50,-50..50,-50..50] of boolean;
  max:array[-50..50,-50..50,-50..50] of byte;
  dat:array[1..1000] of dis;
  tmp,ma:dis;
  st:char;
  a,b,c,d,n,m,x,y,z:integer;
procedure readdata;
begin
  readln(ma[1],ma[2],ma[3],n);
  for a:=1 to n do begin
    read(st);
    b:=ord(st)-ord('x')+1;
    dat[a][0]:=b;
    readln(dat[a][1],dat[a][2],dat[a][3],dat[a][4]);
    if dat[a][b]>dat[a][4] then begin
      c:=dat[a][b];
      dat[a][b]:=dat[a][4];
      dat[a][4]:=c;
    end;
    tmp:=dat[a];
    for c:=dat[a][b] to dat[a][4] do begin
      tmp[b]:=c;
      map[tmp[1]][tmp[2]][tmp[3]]:=true;
    end;
  end;
end;
begin
  fillchar(map,sizeof(map),0);
  fillchar(max,sizeof(max),0);
  readdata;
  m:=0;
  for x:=-ma[1] to ma[1] do
    for y:=-ma[2] to ma[2] do
      for z:=-ma[3] to ma[3] do if not map[x][y][z] then begin
        a:=x+ma[1];
        if a>y+ma[2] then a:=y+ma[2];
        if a>z+ma[3] then a:=z+ma[3];
        if a>0 then begin
          if a>max[x-1][y][z] then a:=max[x-1][y][z];
          if a>max[x][y-1][z] then a:=max[x][y-1][z];
          if a>max[x][y][z-1] then a:=max[x][y][z-1];
          if a>max[x-1][y-1][z] then a:=max[x-1][y-1][z];
          if a>max[x][y-1][z-1] then a:=max[x][y-1][z-1];
          if a>max[x-1][y][z-1] then a:=max[x-1][y][z-1];
          if a>max[x-1][y-1][z-1] then a:=max[x-1][y-1][z-1];
          b:=a+1;
        end else b:=1;
        if b>m then begin
          m:=b;
        end;
        max[x][y][z]:=b;
      end;
  writeln(m);
end.
