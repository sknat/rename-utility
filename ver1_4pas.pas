unit ver1_4pas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, filectrl, ComCtrls, inifiles, ShellCtrls;

type
  TForm1 = class(TForm)
    lbox: TListBox;
    dirbox: TShellTreeView;
    config: TGroupBox;
    cksousdos: TCheckBox;
    btrefresh: TButton;
    btstartdir: TButton;
    infos: TGroupBox;
    lbelem: TLabel;
    lbsel: TLabel;
    Label3: TLabel;
    edchampnum: TEdit;
    btchampdim: TButton;
    btchampadd: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    btrename: TButton;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    ComboBox4: TComboBox;
    Edit4: TEdit;
    ComboBox5: TComboBox;
    Edit5: TEdit;
    ComboBox6: TComboBox;
    Edit6: TEdit;
    ComboBox7: TComboBox;
    Edit7: TEdit;
    ComboBox1: TComboBox;
    procedure ReadDir(start: string);
    procedure FormActivate(Sender: TObject);
    procedure btrenameClick(Sender: TObject);
    procedure btrefreshClick(Sender: TObject);
    procedure btstartdirClick(Sender: TObject);
    procedure dirboxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lboxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label3Click(Sender: TObject);
    procedure btchampaddClick(Sender: TObject);
    procedure btchampdimClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure champvisible(numb: integer);
    procedure champcombo(id: integer);
    procedure Button1Click(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  curdir: string;
  extlist: array[0..9] of string;
  edlist: array[0..7] of TEdit;
  cblist: array[0..7] of TCombobox;
  startdir: string;

implementation

uses Unit1, config;

{$R *.dfm}
//****************************************************************************
//Memo : a ajouter
//  --> incrémant 'intelligent' en fonction des fichiers deja existants
//  --> possibilité de choisir dans l'app les ext
//  --> 2eme type renommer : modification a partir du nom d'origine
//*********
procedure TForm1.ReadDir(start: string);
var
  s:      tsearchrec;
  status: word;
  //jpgcnt: integer;

begin
  lbox.Clear;
  if start = '' then exit;
  status := FindFirst(start + '\*.*', faAnyFile, s);
  //jpgcnt:=0;
  while status = 0 do
    begin
      if not ((s.Name = '.') or (s.name = '..')) then
      if (s.Attr and fadirectory) <> 0 then begin
        if cksousdos.Checked=true then
        ReadDir(start + '\' + s.Name)  // recurse into subdirs
        end
    else begin
      //inc(JpgCnt);
      //stgphotos.Cells[0, stgphotos.RowCount - 1] := inttostr(stgphotos.RowCount - 1);
      //stgphotos.Cells[1, stgphotos.RowCount - 1] := s.Name;
      //stgphotos.RowCount := stgphotos.RowCount + 1;
      if (uppercase(extractfileext(s.Name))=extlist[0]) or
         (uppercase(extractfileext(s.Name))=extlist[1]) or
         (uppercase(extractfileext(s.Name))=extlist[2]) or
         (uppercase(extractfileext(s.Name))=extlist[3]) or
         (uppercase(extractfileext(s.Name))=extlist[4]) or
         (uppercase(extractfileext(s.Name))=extlist[5]) or
         (uppercase(extractfileext(s.Name))=extlist[6]) or
         (uppercase(extractfileext(s.Name))=extlist[7]) or
         (uppercase(extractfileext(s.Name))=extlist[8]) or
         (uppercase(extractfileext(s.Name))=extlist[9]) then
      lbox.Items.Add(s.name);
      end;
    status := FindNext(s);
  end;

  //stgphotos.RowCount := stgphotos.RowCount - 1;
  FindClose(s);
  lbelem.Caption:=inttostr(lbox.Count)+' fichiers en cours de visualisation';
end;
//****************************************************************************
procedure TForm1.FormActivate(Sender: TObject);
var
f: Tinifile;
i: integer;
begin
//on définit la liste des champs de manière a y acceder de manière reccursive par la suite (plus rapide)
edlist[1] := Edit1; edlist[2] := Edit2; edlist[3] := Edit3; edlist[4] := Edit4;
edlist[5] := Edit5; edlist[6] := Edit6; edlist[7] := Edit7;
cblist[1] := Combobox1; cblist[2] := Combobox2; cblist[3] := Combobox3;
cblist[4] := Combobox4; cblist[5] := Combobox5; cblist[6] := Combobox6;
cblist[7] := Combobox7;
//on duplique le premier combobox vers les autres
for i:=2 to 7 do begin
cblist[i].Items := cblist[1].Items;
end;
// on charge le .ini (si il existe)
if not fileexists(ChangeFileExt( Application.ExeName, '.INI' )) then exit;

  f:=Tinifile.create(ChangeFileExt( Application.ExeName, '.INI' ));
  Form1.Width  := f.ReadInteger('main','formw',613);
  Form1.Height := f.ReadInteger('main','formh',482);
  startdir     := f.ReadString('main','rootdir','rfDesktop');
//lecture du contenu des champs
  for i:=1 to 7 do begin
    edlist[i].Text := f.ReadString('champs','champ_ed'+inttostr(i),'');
    cblist[i].Text := f.ReadString('champs','champ_cb'+inttostr(i),'Texte');
    champcombo(i);
  end;
//affichage des champs visibles ou non
  edchampnum.Text := f.ReadString('champs','champsvisibles','7');
  champvisible(strtoint(edchampnum.Text));
//extensions autorisées
  for i:=0 to 9 do begin
    extlist[i]:=f.readstring('drawext','ext'+inttostr(i),'.JPG');
  end;
//chargement des booleans du ini
  if f.readbool('main','sousdos',false) then cksousdos.Checked:=true;
  if not f.readbool('main','drawconfig',true) then config.Visible:=false;
  if not f.readbool('main','drawinfos',true) then infos.Visible:=false;
//fin du chargement
f.Free;

dirbox.root:=startdir;
end;
//****************************************************************************
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
f: tinifile;
i: integer;
begin
f:=Tinifile.create(ChangeFileExt( Application.ExeName, '.INI' ));

//sauvegarde de startdir si il est correct (<>'')
if startdir<>'' then f.WriteString('main','rootdir',startdir);
//caractéristiques de la form
f.WriteInteger('main','formw',Form1.Width);
f.WriteInteger('main','formh',Form1.Height);
//ecriture des booleans sur le ini
f.WriteBool('main','sousdos',cksousdos.Checked);
f.WriteBool('main','drawconfig',config.Visible);
f.WriteBool('main','drawinfos',infos.Visible);
//sauvegarde du contenu des champs
for i:=1 to 7 do begin
f.WriteString('champs','champ_ed'+inttostr(i),edlist[i].Text);
f.WriteString('champs','champ_cb'+inttostr(i),cblist[i].Text);
end;
//affichage des champs visibles ou non
f.WriteString('champs','champsvisibles',edchampnum.Text);
//extensions autorisées
for i:=0 to 9 do begin
f.WriteString('drawext','ext'+inttostr(i),extlist[i]);
end;
//fin
f.Free;
end;
//****************************************************************************
procedure TForm1.btrenameClick(Sender: TObject);
var
x: integer;
i: integer;
numchamp: integer;
increm: integer;
filefrom: string;
fileto: string;
edinc: string;
begin
if lbox.SelCount = 0 then begin showmessage('Selectioner au moins un fichier a renommer.'); exit; end;
numchamp := strtoint(edchampnum.Text);
increm := 0; //increm est la variable qui sert a augmenter les incremants initiaux
    for x:=0 to lbox.Count-1 do begin
        if lbox.Selected[x] then  begin
          filefrom:=curdir+'\'+lbox.Items.Strings[x];//filefrom : fichier source
          fileto:=curdir+'\';                        //fileto : fichier destination
              for i:=1 to numchamp do begin
                  //si il s'agit d'un incrémant on le rajoute à fileto (avec tous les zéros...)
                  if cblist[i].Text = 'Incrémant' then begin
                  edinc := edlist[i].Text; //a voir : des fois sa plante si on l'introduit direct ds le calcul
                  fileto := fileto + copy('00000000000000000',1,length(edinc)-length(inttostr(strtoint(edinc)+increm)))+inttostr(strtoint(edinc)+increm);
                  end; //**
                  //si il s'agit de texte on le rajoute à fileto
                  if cblist[i].Text = 'Texte' then begin
                  fileto := fileto + edlist[i].Text;
                  end;//**
                  //si il s'agit d'un espace on le rajoute à fileto
                  if cblist[i].Text = 'Espace' then begin
                  fileto := fileto + ' ';
                  end;//**
              end;
          //on ajoute l'extension...
          fileto := fileto + extractfileext(curdir+'\'+lbox.Items.Strings[x]);
          //** et voila c'est fini...
          inc(increm);//de manière a pouvoir renommer les fichiers suivants avec un numero superieur
          renamefile(filefrom,fileto);// il n'y a plus qu'a renommer
        end;
    end;
Readdir(curdir);//pour rafraichir la liste des noms de fichier
end;
//****************************************************************************
procedure TForm1.btrefreshClick(Sender: TObject);
begin
Readdir(curdir);
end;
//****************************************************************************
procedure TForm1.btstartdirClick(Sender: TObject);
begin
SelectDirectory('Répertoire contenant les photos...','', startdir);
dirbox.Root:=startdir;
end;
//****************************************************************************
procedure TForm1.dirboxClick(Sender: TObject);
begin
curdir:=dirbox.Path;
Readdir(curdir);
end;
//****************************************************************************
procedure TForm1.lboxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
lbsel.Caption:=inttostr(lbox.SelCount)+' éléments actuellement selectionnés';
end;
//****************************************************************************
procedure TForm1.Label3Click(Sender: TObject);
begin
aboutbox.ShowModal;
end;
//****************************************************************************
procedure TForm1.btchampaddClick(Sender: TObject);
var
x:integer;
begin
x := strtoint(edchampnum.Text);
if x<7 then x := x+1;
edchampnum.text := inttostr(x);
champvisible(x);
end;
//****************************************************************************
procedure TForm1.btchampdimClick(Sender: TObject);
var
x:integer;
begin
x := strtoint(edchampnum.Text);
if x>1 then x := x-1;
edchampnum.text := inttostr(x);
champvisible(x);
end;
//****************************************************************************
procedure Tform1.champvisible(numb: integer);
var
i: integer;
begin
for i:=1 to numb do begin
edlist[i].Visible := true;
cblist[i].Visible := true;
end;
if numb<>7 then
for i:=numb+1 to 7 do begin
edlist[i].Visible := false;
cblist[i].Visible := false;
cblist[i].Text := ''
end;
end;
//****************************************************************************
procedure TForm1.ComboBox1Change(Sender: TObject);
begin champcombo(1); end;
procedure TForm1.ComboBox2Change(Sender: TObject);
begin champcombo(2); end;
procedure TForm1.ComboBox3Change(Sender: TObject);
begin champcombo(3); end;
procedure TForm1.ComboBox4Change(Sender: TObject);
begin champcombo(4); end;
procedure TForm1.ComboBox5Change(Sender: TObject);
begin champcombo(5); end;
procedure TForm1.ComboBox6Change(Sender: TObject);
begin champcombo(6); end;
procedure TForm1.ComboBox7Change(Sender: TObject);
begin champcombo(7); end;
//****************************************************************************
procedure TForm1.champcombo(id:integer);
begin
if Cblist[id].Text = 'Incrémant' then begin
Edlist[id].Text := '01';
Edlist[id].Enabled:=true;
end;
if Cblist[id].Text = 'Texte' then begin
Edlist[id].Enabled:=true;
end;
if Cblist[id].Text = 'Espace' then begin
Edlist[id].Enabled:=false;
Edlist[id].Text:='Espace';
end;
//placer ici les types suivants de champs...

//**
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
form2.ShowModal;
end;

end.
