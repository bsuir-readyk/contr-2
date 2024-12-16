uses sysutils;

const N = 4;
type TArr = array[0..N-1] of array[0..N-1] of integer;


procedure BubbleSortWithFlag(var arr: array of integer);
var
  i, j, temp, lastSwap: integer;
begin
  i := 0;
  while i < Length(arr) - 1 do
  begin
    lastSwap := Length(arr) - 1;
    j := Length(arr) - 1;

    while j >= i do
    begin
      if arr[j - 1] < arr[j] then
      begin
        temp := arr[j - 1];
        arr[j - 1] := arr[j];
        arr[j] := temp;
        lastSwap := j;
      end;
      j := j - 1;
    end;
    i := lastSwap + 1;
  end;
end;


var
  i, j: integer;
  arr: TArr;
  isOk: boolean;
begin
  randomize;
  i := 0;
  isOk := true;
  while (i < N) do
  begin
    j := 0;
    while (j < N) do
    begin
      arr[i][j] := Random(9);
      write(arr[i][j], '  ');
      if ((i < j) and (arr[i][j] = 0)) then
      begin
        isOk := false;
      end;
      Inc(j);
    end;
    writeln;
    Inc(i);
  end;
  
  writeln;
  writeln;
  writeln;
  writeln;
  if isOk then
  begin
    i := 0;
    while (i < N) do
    begin
      BubbleSortWithFlag(arr[i]);
      j := 0;
      while (j < N) do
      begin
        write(arr[i][j], '  ');
        Inc(j);
      end;
      writeln;
      Inc(i);
    end; 
  end;
end.
