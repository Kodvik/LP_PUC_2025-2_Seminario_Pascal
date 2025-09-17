program EntradaSaida;
{
  Programa: Entrada e Saída de Dados
  Descrição: Demonstra como ler dados do usuário e exibir resultados
  Autor: Seminário Pascal - PUC Minas 2025/2
}

var
  nome: string;
  idade: integer;
  salario: real;

begin
  writeln('=== CALCULADORA DE INFORMAÇÕES PESSOAIS ===');
  writeln;
  
  { Leitura de dados }
  write('Digite seu nome: ');
  readln(nome);
  
  write('Digite sua idade: ');
  readln(idade);
  
  write('Digite seu salário: R$ ');
  readln(salario);
  
  { Processamento e saída }
  writeln;
  writeln('=== RESUMO DAS INFORMAÇÕES ===');
  writeln('Nome: ', nome);
  writeln('Idade: ', idade, ' anos');
  writeln('Salário: R$ ', salario:0:2);
  writeln('Salário anual: R$ ', (salario * 12):0:2);
  
  { Verificação de maioridade }
  if idade >= 18 then
    writeln('Status: Maior de idade')
  else
    writeln('Status: Menor de idade');
    
  writeln;
  writeln('Obrigado por usar nosso programa!');
end.