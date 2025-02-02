unit uFrmP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, uFrmDataHora ;

type
  Tfrmprincipal = class(TForm)
    pnltitulo: TPanel;
    pgctrlprincipal: TPageControl;
    aba1: TTabSheet;
    aba2: TTabSheet;
    aba3: TTabSheet;
    GroupBox1: TGroupBox;
    senhalabel: TLabel;
    senha: TEdit;
    botaotimer: TButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    btaba2: TButton;
    opcoes1: TRadioGroup;
    animefav: TLabel;
    btanime: TButton;
    listanimefav: TListBox;
    btlimpar: TButton;
    Panel2: TPanel;
    btaba1: TButton;
    btaba3: TButton;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    observacoes: TMemo;
    procedure FormShow(Sender: TObject);
    procedure senhaEnter(Sender: TObject);
    procedure senhaExit(Sender: TObject);
    procedure btaba2Click(Sender: TObject);
    procedure btanimeClick(Sender: TObject);
    procedure btlimparClick(Sender: TObject);
    procedure btaba1Click(Sender: TObject);
    procedure btaba3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure aba1Enter(Sender: TObject);
    procedure botaotimerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.dfm}

procedure Tfrmprincipal.aba1Enter(Sender: TObject);
begin
  senha.SetFocus;
end;

procedure Tfrmprincipal.botaotimerClick(Sender: TObject);
begin
  FrmDataHora.ShowModal;
end;

procedure Tfrmprincipal.btaba1Click(Sender: TObject);
begin
  pgctrlprincipal.ActivePageIndex := 0;
end;

procedure Tfrmprincipal.btaba2Click(Sender: TObject);
begin
  pgctrlprincipal.ActivePageIndex := 1;
end;

procedure Tfrmprincipal.btaba3Click(Sender: TObject);
begin
  pgctrlprincipal.ActivePageIndex := 2;
end;

procedure Tfrmprincipal.btanimeClick(Sender: TObject);
begin
  if opcoes1.ItemIndex >= 0 then
  begin
    listanimefav.Items.Add(opcoes1.Items[opcoes1.ItemIndex]);
    opcoes1.ItemIndex := -1
  end
  else
  MessageDlg('Selecione um item', mtInformation, [mbOK], 0);
end;

procedure Tfrmprincipal.btlimparClick(Sender: TObject);
begin
  listanimefav.Items.Clear;
end;

procedure Tfrmprincipal.Button1Click(Sender: TObject);
begin
  pgctrlprincipal.ActivePageIndex := 1;
end;

procedure Tfrmprincipal.Button2Click(Sender: TObject);
begin
  pgctrlprincipal.ActivePageIndex := 0;
end;

procedure Tfrmprincipal.Button3Click(Sender: TObject);
begin
  observacoes.SelectAll;
  observacoes.SetFocus;
end;

procedure Tfrmprincipal.Button4Click(Sender: TObject);
begin
  observacoes.Lines.Clear;
end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
  pnltitulo.Caption := 'Teste Programa Delphi' ;
end;

procedure Tfrmprincipal.senhaEnter(Sender: TObject);
begin
  senha.Color :=$00B9FFFF;
end;

procedure Tfrmprincipal.senhaExit(Sender: TObject);
begin
 senha.Color := $ffffff ;
 if senha.Text = '' then
 begin
   MessageDlg ('Voce nao digitou nada', mtInformation, [mbOK], 0);
   senha.SetFocus;
 end
 else
  if Length (senha.Text) <> 4 then
  begin
    MessageDlg ('Voce nao digitou 4 caracteres', mtInformation, [mbOK], 0);
    senha.SetFocus;
    senha.SelectAll
  end
  else
  senha.Color := clWindow;
end;

end.
