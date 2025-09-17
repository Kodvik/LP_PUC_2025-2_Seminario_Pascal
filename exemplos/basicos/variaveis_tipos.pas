program VariaveisTipos;
{
  Programa: Demonstração de Variáveis e Tipos em Pascal
  Descrição: Exemplos dos principais tipos de dados em Pascal
  Autor: Seminário Pascal - PUC Minas 2025/2
}

var
  nome: string;
  idade: integer;
  altura: real;
  ativo: boolean;
  nota: char;

begin
  { Atribuição de valores }
  nome := 'João Silva';
  idade := 20;
  altura := 1.75;
  ativo := true;
  nota := 'A';
  
  { Exibição dos valores }
  writeln('=== DEMONSTRAÇÃO DE TIPOS ===');
  writeln('Nome: ', nome);
  writeln('Idade: ', idade, ' anos');
  writeln('Altura: ', altura:0:2, ' metros');
  writeln('Ativo: ', ativo);
  writeln('Nota: ', nota);
  
  { Operações básicas }
  writeln;
  writeln('=== OPERAÇÕES ===');
  writeln('Idade em meses: ', idade * 12);
  writeln('Altura em centímetros: ', altura * 100:0:0, ' cm');
end.