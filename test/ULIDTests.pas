unit ULIDTests;

interface

uses
  TestFramework,
  ULID;

type
  TULIDTests = class(TTestCase)
  published
    procedure TestCreateULID;
    procedure TestSortable;
    procedure TestEncodeTime;
  end;

implementation

uses
  Classes,
  SysUtils;
  
{ TULIDTests }

procedure TULIDTests.TestCreateULID;
var
  Ulid: string;
begin
  Ulid := CreateULID;
  CheckEquals(Length(Ulid), 26);
end;

procedure TULIDTests.TestEncodeTime;
var
  Got: string;
begin
  Got := ULID.EncodeTime(1469918176385);
  CheckEquals('01ARYZ6S41', Got);
end;

procedure TULIDTests.TestSortable;
var
  I: Integer;
  Ulids, SortedUlids: TStringList;
begin
  Ulids := nil;
  SortedUlids := nil;
  try
    Ulids := TStringList.Create;
    for I := 0 to 10 do
    begin
      Ulids.Add(CreateULID);
      Sleep(42);
    end;

    SortedUlids := TStringList.Create;
    SortedUlids.Text := Ulids.Text;
    SortedUlids.Sort;

    for I := 0 to Ulids.Count - 1 do
      CheckEquals(SortedUlids[I], Ulids[I]);
  finally
    Ulids.Free;
    SortedUlids.Free;
  end;
end;

initialization
  RegisterTest(TULIDTests.Suite);

end.
