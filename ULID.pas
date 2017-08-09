unit ULID;

interface

{
  ULID: Universally Unique Lexicographically Sortable Identifier

  String Representation: ttttttttttrrrrrrrrrrrrrrrr
  where t is Timestamp
        r is Randomness

  For more information see: https://github.com/martinusso/ulid/blob/master/README.md
}
function CreateULID: string;

function EncodeTime(Time: Int64): string;

implementation

uses
  DateUtils,
  SysUtils,
  Windows;

const
  ENCODING: array[0..31] of string = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                                      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K',
                                      'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X',
                                      'Y', 'Z'); // Crockford's Base32
  ENCODING_LENGTH = Length(ENCODING);

function CreateULID: string;

  function UNIXTimeInMilliseconds: Int64;
  var
    ST: SystemTime;
    DT: TDateTime;
  begin
    GetSystemTime(ST);
    DT := EncodeDate(ST.wYear, ST.wMonth, ST.wDay) +
          SysUtils.EncodeTime(ST.wHour, ST.wMinute, ST.wSecond, ST.wMilliseconds);
    Result := DateUtils.MilliSecondsBetween(DT, UnixDateDelta);
  end;

begin
  Result := EncodeTime(UNIXTimeInMilliseconds) + EncodeRandom;
end;

function EncodeRandom: string;
const
  ENCODED_RANDOM_LENGTH = 16;
var
  I: Word;
  Rand: Integer;
begin
  Result := '';
  for I := ENCODED_RANDOM_LENGTH downto 1 do
  begin
    Rand := Trunc(ENCODING_LENGTH * Random);
    Result := ENCODING[Rand] + Result;
  end;
end;

function EncodeTime(Time: Int64): string;
const
  ENCODED_TIME_LENGTH = 10;
var
  I: Word;
  M: Integer;
begin
  Result := '';
  for I := ENCODED_TIME_LENGTH downto 1 do
  begin
    M := (Time mod ENCODING_LENGTH);
    Result := ENCODING[M] + Result;
    Time := Trunc((Time - M) / ENCODING_LENGTH);
  end;
end;

end.
