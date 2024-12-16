uses sysutils;

const N = 16;
const AN = 3;
type TXArr = array[0..N-1] of double;
type TAArr = array[0..AN-1] of TXArr;

const EPS2 = 0.01;
const EPS3 = 0.001;
const EPS4 = 0.0001;

procedure printArr(a: array of double);
var i: integer;
begin
  i:=low(a);
  write('[');
  while i <= high(a) do
  begin
    if i <> low(a) then
    begin
      write(', ');
    end;
    write(a[i]:0:6);
    Inc(i);
  end;
  writeln(']');
end;

var
  xarr: TXArr;
  aarr: TAArr;
  i, j: integer;
  cur: double;
  curPower: double;
  curFact: double;
  prev: double;
  sum: double;
  EPS2_logged, EPS3_logged: boolean;
begin
  randomize;
  i := 0;
  while i < N do 
  begin
    xarr[i] := -0.6 + Random * 1.2;
    writeln(i, ': ', xarr[i]:0:6);
    Inc(i);
  end;

  // printArr(xarr); 

  j := 0;
  while (j < N) do
  begin
    cur := 1;
    curPower := xarr[j];
    curFact := 1;
    prev := 99999;
    sum := cur;
    i := 2;
    EPS2_logged := false;
    EPS3_logged := false;

    // while (Abs(prev - Abs(cur)) > EPS4) do
    while (Abs(cur) > EPS4) do
    begin
      curPower := curPower * xarr[j];
      curFact := curFact * i;
      prev := cur;
      cur := curPower / curFact;
      sum := sum + cur;
      {
      writeln;
      writeln('prev:', prev:0:6);
      writeln('cur:', cur:0:6);
      writeln('i:', i);
}
      Inc(i);
      // if ((not EPS2_logged) and (Abs(prev - Abs(cur)) < EPS2)) then
      if ((not EPS2_logged) and (Abs(cur) < EPS2)) then
      begin
        aarr[0][j] := sum;
        write(sum:0:4, '   ');
        EPS2_logged := true;
      end;
      // if ((not EPS3_logged) and (Abs(prev - Abs(cur)) < EPS3)) then
      if ((not EPS3_logged) and (Abs(cur) < EPS3)) then
      begin
        aarr[1][j] := sum;
        write(sum:0:4, '   ');
        EPS3_logged := true;
      end;
    end;

    aarr[2][j] := sum;
    Inc(j);
    write(sum:0:4);
    writeln;
  end;

  // printArr(aarr[0]);
  // printArr(aarr[1]);
  // printArr(aarr[2]);

end.
