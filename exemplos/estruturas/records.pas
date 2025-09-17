program ExemplosRecords;
{
  Programa: Demonstração de Records em Pascal
  Descrição: Exemplos de uso de registros (structures)
  Autor: Seminário Pascal - PUC Minas 2025/2
}

type
  { Definição do tipo registro para estudante }
  TEstudante = record
    nome: string[50];
    idade: integer;
    curso: string[30];
    nota1, nota2, nota3: real;
    media: real;
  end;

var
  estudante: TEstudante;
  
{ Função para calcular média }
function CalcularMedia(n1, n2, n3: real): real;
begin
  CalcularMedia := (n1 + n2 + n3) / 3;
end;

{ Procedimento para exibir dados do estudante }
procedure ExibirEstudante(e: TEstudante);
begin
  writeln('=== DADOS DO ESTUDANTE ===');
  writeln('Nome: ', e.nome);
  writeln('Idade: ', e.idade, ' anos');
  writeln('Curso: ', e.curso);
  writeln('Nota 1: ', e.nota1:0:1);
  writeln('Nota 2: ', e.nota2:0:1);
  writeln('Nota 3: ', e.nota3:0:1);
  writeln('Média: ', e.media:0:2);
  
  if e.media >= 7.0 then
    writeln('Situação: APROVADO')
  else if e.media >= 5.0 then
    writeln('Situação: RECUPERAÇÃO')
  else
    writeln('Situação: REPROVADO');
end;

begin
  writeln('=== SISTEMA DE CADASTRO DE ESTUDANTE ===');
  writeln;
  
  { Leitura dos dados }
  write('Nome do estudante: ');
  readln(estudante.nome);
  
  write('Idade: ');
  readln(estudante.idade);
  
  write('Curso: ');
  readln(estudante.curso);
  
  write('Nota 1: ');
  readln(estudante.nota1);
  
  write('Nota 2: ');
  readln(estudante.nota2);
  
  write('Nota 3: ');
  readln(estudante.nota3);
  
  { Cálculo da média }
  estudante.media := CalcularMedia(estudante.nota1, estudante.nota2, estudante.nota3);
  
  { Exibição dos resultados }
  writeln;
  ExibirEstudante(estudante);
end.