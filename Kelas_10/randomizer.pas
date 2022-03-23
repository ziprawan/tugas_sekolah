{$MODE DELPHI}

program randomizer;

uses Crt, SysUtils, StrUtils;

Var
  list_names: Array of String; { Default list_names length is 5. if user input is more than 5, just set length to defined from input user. }
  i, j, total_name, selected_int: Integer; { i and j for loop and total_name for total name on input and selected_int for selected name in integer }

begin
  
  clrscr(); { Clear console screen }
  
  { Show intro }
  WriteLn('==============================');
  WriteLn('Name    : Aziz Ridhwan Pratama');
  WriteLn('Class   : X MIPA 3            ');
  WriteLn('Number  : 02                  ');
  WriteLn('==============================');
  WriteLn();
  { End of intro }
  
  { Enter main of program }
  { Ask how many names will be randomized }
  Write('How many names will be randomized? '); ReadLn(total_name);
  
  { Check input number }
  { if number is more than 5, set the list_names array length to inputted number }
  if (total_name > 5) then
  begin
    SetLength(list_names, total_name);
  end
  else if (total_name <= 0) then
  begin
    GotoXY(1, 7); WriteLn(DupeString(#32, ScreenWidth)); 
    GotoXY(1, 7); WriteLn('Number zero or lower isn' + #39 + 't allowed!');
    Exit;
  end
  else
  begin
    SetLength(list_names, 5);
  end;
  
  { Ask for names }
  
  { Loop input name and assign it to list_names }
  For i := 1 to total_name do
  begin
    GotoXY(1, 7); WriteLn('##############################');
    GotoXY(1, 8); WriteLn('#        Input Dialog        #');
    GotoXY(1, 9); WriteLn('##############################');
    GotoXY(1, 10); WriteLn(DupeString(#32, ScreenHeight));
    GotoXY(1, 10); Write('Input name ' + IntToStr(i) + ' : ');
    GotoXY(Length(IntToStr(i)) + 15, 10); ReadLn(list_names[i - 1]);  { i decreased 1 to avoid EAccessViolation and default array index is started from 0! }
  end;
  WriteLn();
  
  { Clean up dialog }
  For i:= 7 to 11 do
  begin
    GotoXY(1, i); WriteLn(DupeString(#32, ScreenWidth));
  end;
  
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

  { Output the name }
  GotoXY(1, 7); WriteLn('Congratulations to the chosen name!');
  WriteLn();
  GotoXY(1, 9); WriteLn('===================================');
  GotoXY(1, 10); WriteLn(list_names[selected_int]);
  GotoXY(1, 11); WriteLn('==================================');
  
end.