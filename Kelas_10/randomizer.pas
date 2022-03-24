{$MODE DELPHI}

program randomizer;

{ Import needed libraries }
uses Crt, SysUtils, StrUtils;

{ Needed Variables }
Var
  list_names: Array of String; { Default list_names length is 5. if user input is more than 5, just set length to defined from input user. }
  i, j, total_name, selected_int: Integer; { i and j for loop and total_name for total name on input and selected_int for selected name in integer }

{ Initialize needed function }
{ See more at https://www.tutorialspoint.com/pascal/pascal_functions.htm }
Function ClearAndPrint(rows: Integer; input_string: String; column: Integer = 1): Boolean;

begin
  { Clear row and print input string }
  GotoXY(column, rows);
  Write(DupeString(#32, ScreenWidth));
  GotoXY(column, rows);
  WriteLn(input_string);
  result := TRUE
end;

Function ClearRows(first_row, last_row: Integer; column: Integer = 1): Boolean;
Var
  a, b: Integer;

begin
  if (first_row > last_row) then
  begin
    a := last_row;
    b := first_row;
  end
  else
  begin
    a := first_row;
    b := last_row;
  end;

  { Clear rows }
  For i:= a to b do
  begin
    GotoXY(column, i); WriteLn(DupeString(#32, ScreenWidth));
  end;
  result := TRUE
end;

begin
  
  clrscr(); { Clear console screen }
  
  { Show intro }
  WriteLn('==============================');
  WriteLn('Nama    : Aziz Ridhwan Pratama');
  WriteLn('Kelas   : X MIPA 3            ');
  WriteLn('Absen   : 02                  ');
  WriteLn('==============================');
  WriteLn();
  // WriteLn('Width: ' + IntToStr(ScreenWidth) + #10 + 'Height: ' + IntToStr(ScreenHeight));
  { End of intro }
  
  { Enter main of program }
  { Ask how many names will be randomized }
  Try
  begin
    Write('Masukkan jumlah nama yang akan dirandom? '); ReadLn(total_name);
  
  { Check input number }
  { if number is more than 5, set the list_names array length to inputted number }
  if (total_name > 5) then
  begin
    SetLength(list_names, total_name);
  end
  else if (total_name <= 0) then
  begin
    ClearAndPrint(7, 'Angka di bawah 0 tidak dapat diinput!');
    Exit;
  end
  else if (total_name < 3) then
  begin
    ClearAndPrint(7, 'Kedikitan bang 🗿');
    Exit;
  end
  else
  begin
    SetLength(list_names, 5);
  end;
  
  { Clear rows }
  ClearRows(7, 11);
  
  { Ask for names }  
  { Loop input name and assign it to list_names }
  For i := 1 to total_name do
  begin
    GotoXY(1, 7); WriteLn('##############################');
    GotoXY(1, 8); WriteLn('#        Input Dialog        #');
    GotoXY(1, 9); WriteLn('##############################');
    ClearAndPrint(10, 'Masukkan nama #' + IntToStr(i) + ' : ');
    GotoXY(Length(IntToStr(i)) + 19, 10); ReadLn(list_names[i - 1]);  { i decreased 1 to avoid EAccessViolation and default array index is started from 0! }
  end;
  WriteLn();
  
  { Clear rows }
  ClearRows(7, 11);
  
  { Randomize from list_names }
  Randomize();
  selected_int := Random(total_name);
  
  { Sleep }
  GotoXY(1, 7); WriteLn('Name has been chosen!');
  Sleep(1000);
  GotoXY(1, 8); WriteLn('Are you ready?');
  
  For j := 3 downto 1 do
  begin
    GotoXY(1, 10); WriteLn(j);
    Sleep(1000);
  end;

  { Clear rows }
  ClearRows(7, 11);

  { Output the name }
  GotoXY(1, 7); WriteLn('Congratulations to the chosen name!');
  WriteLn();
  GotoXY(1, 9); WriteLn('===================================');
  GotoXY(1, 10); WriteLn(list_names[selected_int]);
  GotoXY(1, 11); WriteLn('===================================');
  end;
  Except
    on E: EInOutError do 
    begin
      ClearAndPrint(7, 'Maaf, hanya angka yang dapat diinput!');
      Exit; 
    end;
    on E: Exception do begin WriteLn('Error: ', E.ClassName, ': ', E.Message); Exit; end;
    else 
    begin 
      ClearAndPrint(7, 'Unhandled error lmao!'); Exit; 
    End;
  End;
  
end.
