unit frm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RichEdit1: TRichEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  myFile : TextFile;
  arrNames : array[1..10] of string;
  sline : string;
  end;
const
IcurYear = 2023;

var
  Form1: TForm1;
  myFile : TextFile;
  arrNames : array[1..10] of string;
  sline,sname,sSurname: string;
  iage, birth : integer;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
a,ipos : integer;
begin
RichEdit1.Lines.Clear;

  RichEdit1.Paragraph.TabCount := 3;
  RichEdit1.Paragraph.tab[0] := 140;
  RichEdit1.Paragraph.tab[1] := 260;
  RichEdit1.Paragraph.tab[2] := 360;


RichEdit1.Lines.Add('Name' + #9 + 'Surname' + #9 + 'Age' + #9 + 'birth year') ;
RichEdit1.Lines.Add('');

 AssignFile(myFile,'name.txt');

// Reset(myFile);
 try
   Reset(myFile);
 except
   ShowMessage('File not found');
   Exit
 end;

while not Eof(myFile) do
 begin
   Readln(myFile,sline);

   ipos := Pos('#',sline);
   sname := Copy(sline,1,ipos-1);
   Delete(sline,1,ipos);

   ipos := Pos('#',sline);
   sSurname := Copy(sline,1,ipos-1);
   Delete(sline,1,ipos);

   iage := StrToInt(sline);
   birth := IcurYear - iage;

   RichEdit1.Lines.Add(sName + #9 + sSurname + #9 + IntToStr(iage) + #9 + IntToStr(birth));
 end;

CloseFile(myFile);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
iAge, ilnCOunt : Integer;
sNew : string;
begin

snew := InputBox('','Enter Name','')+'#'+InputBox('','Enter Surname','')+
                 '#'+inttostr(StrToInt(InputBox('','Enter Age','')));

AssignFile(myFile,'name.txt');

 Append(myFile);
 Writeln(myFile,sNew);

CloseFile(myFile);

Button1.Click;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 RichEdit1.Left := 5;
 RichEdit1.Top:= 5;
end;

end.
