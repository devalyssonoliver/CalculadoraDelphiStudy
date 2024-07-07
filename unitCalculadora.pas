unit unitCalculadora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TForm1 = class(TForm)
    lt_buttons: TLayout;
    btn_zero: TButton;
    btn_ponto: TButton;
    btn_result: TButton;
    btn_mais: TButton;
    btn_um: TButton;
    btn_dois: TButton;
    btn_tres: TButton;
    btn_menos: TButton;
    btn_quatro: TButton;
    btn_cinco: TButton;
    btn_seis: TButton;
    btn_multi: TButton;
    btn_sete: TButton;
    btn_oito: TButton;
    btn_nove: TButton;
    btn_dividir: TButton;
    btn_apagar: TButton;
    btn_cc: TButton;
    btn_c: TButton;
    pnl_valores: TPanel;
    lt_valores: TLayout;
    lb_n1: TLabel;
    lb_operador: TLabel;
    lb_n2: TLabel;
    // Eventos de clique dos botões
    procedure btn_maisClick(Sender: TObject);
    procedure btn_menosClick(Sender: TObject);
    procedure btn_multiClick(Sender: TObject);
    procedure btn_dividirClick(Sender: TObject);
    procedure btn_resultClick(Sender: TObject);
    procedure btn_umClick(Sender: TObject);
    procedure btn_pontoClick(Sender: TObject);
    procedure btn_tresClick(Sender: TObject);
    procedure btn_doisClick(Sender: TObject);
    procedure btn_quatroClick(Sender: TObject);
    procedure btn_cincoClick(Sender: TObject);
    procedure btn_seisClick(Sender: TObject);
    procedure btn_seteClick(Sender: TObject);
    procedure btn_oitoClick(Sender: TObject);
    procedure btn_noveClick(Sender: TObject);
    procedure btn_apagarClick(Sender: TObject);
    procedure btn_ccClick(Sender: TObject);
    procedure btn_cClick(Sender: TObject);
  private
    // Declaração de métodos privados
    procedure AddNumber(const AValue: string); // Adiciona um número ao valor atual
    procedure EnableOperators; // Habilita os botões de operadores
  public
    // Declarações públicas
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

// Método para adicionar um número ao valor atual
procedure TForm1.AddNumber(const AValue: string);
begin
  if lb_operador.Text = '.' then
    lb_n1.Text := lb_n1.Text + AValue
  else
    lb_n2.Text := lb_n2.Text + AValue;
end;

// Método para habilitar os botões de operadores
procedure TForm1.EnableOperators;
begin
  btn_mais.Enabled := True;
  btn_multi.Enabled := True;
  btn_menos.Enabled := True;
  btn_dividir.Enabled := True;
end;

// Evento de clique do botão "Apagar"
procedure TForm1.btn_apagarClick(Sender: TObject);
begin
  if lb_operador.Text = '.' then
    lb_n1.Text := Copy(lb_n1.Text, 0, Length(lb_n1.Text) - 1)
  else
    lb_n2.Text := Copy(lb_n2.Text, 0, Length(lb_n2.Text) - 1);
end;

// Evento de clique do botão "CC" (limpar tudo)
procedure TForm1.btn_ccClick(Sender: TObject);
begin
  lb_n1.Text := '';
  lb_n2.Text := '';
  lb_operador.Text := '.';
  EnableOperators;
end;

// Evento de clique do botão "C" (limpar valor atual)
procedure TForm1.btn_cClick(Sender: TObject);
begin
  if lb_operador.Text = '.' then
    lb_n1.Text := ''
  else
    lb_n2.Text := '';
end;

// Evento de clique do botão "5"
procedure TForm1.btn_cincoClick(Sender: TObject);
begin
  AddNumber('5');
end;

// Evento de clique do botão "Dividir"
procedure TForm1.btn_dividirClick(Sender: TObject);
begin
  lb_operador.Text := '/';
  EnableOperators;
  btn_dividir.Enabled := False;
end;

// Evento de clique do botão "2"
procedure TForm1.btn_doisClick(Sender: TObject);
begin
  AddNumber('2');
end;

// Evento de clique do botão "Mais"
procedure TForm1.btn_maisClick(Sender: TObject);
begin
  lb_operador.Text := '+';
  EnableOperators;
  btn_mais.Enabled := False;
end;

// Evento de clique do botão "Menos"
procedure TForm1.btn_menosClick(Sender: TObject);
begin
  lb_operador.Text := '-';
  EnableOperators;
  btn_menos.Enabled := False;
end;

// Evento de clique do botão "Multiplicar"
procedure TForm1.btn_multiClick(Sender: TObject);
begin
  lb_operador.Text := 'x';
  EnableOperators;
  btn_multi.Enabled := False;
end;

// Evento de clique do botão "9"
procedure TForm1.btn_noveClick(Sender: TObject);
begin
  AddNumber('9');
end;

// Evento de clique do botão "8"
procedure TForm1.btn_oitoClick(Sender: TObject);
begin
  AddNumber('8');
end;

// Evento de clique do botão "Ponto"
procedure TForm1.btn_pontoClick(Sender: TObject);
begin
  AddNumber(',');
end;

// Evento de clique do botão "4"
procedure TForm1.btn_quatroClick(Sender: TObject);
begin
  AddNumber('4');
end;

// Evento de clique do botão "Resultado"
procedure TForm1.btn_resultClick(Sender: TObject);
var
  n1, n2: Double;
  x: Char;
begin
  try
    // Converte os textos dos rótulos para números
    n1 := StrToFloat(lb_n1.Text);
    n2 := StrToFloat(lb_n2.Text);

    // Pega o operador
    x := lb_operador.Text[1];
    case x of
      '+': ShowMessage(FloatToStr(n1 + n2)); // Soma
      '-': ShowMessage(FloatToStr(n1 - n2)); // Subtração
      '/': ShowMessage(FloatToStr(n1 / n2)); // Divisão
      'x': ShowMessage(FloatToStr(n1 * n2)); // Multiplicação
    end;
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message); // Exibe mensagem de erro
  end;

  // Limpa os rótulos e habilita os botões de operadores
  btn_ccClick(Sender);
end;

// Evento de clique do botão "6"
procedure TForm1.btn_seisClick(Sender: TObject);
begin
  AddNumber('6');
end;

// Evento de clique do botão "7"
procedure TForm1.btn_seteClick(Sender: TObject);
begin
  AddNumber('7');
end;

// Evento de clique do botão "3"
procedure TForm1.btn_tresClick(Sender: TObject);
begin
  AddNumber('3');
end;

// Evento de clique do botão "1"
procedure TForm1.btn_umClick(Sender: TObject);
begin
  AddNumber('1');
end;

end.

