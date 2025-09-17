program CalculadoraBasica;
{
  Exercício 1 - Lista 1: Calculadora Básica
  Autor: Exemplo de Solução
  Descrição: Programa que realiza as quatro operações básicas
  Data: 2025
}

var
  numero1, numero2: real;
  soma, subtracao, multiplicacao, divisao: real;

begin
  writeln('=== CALCULADORA BÁSICA ===');
  writeln;
  
  { Leitura dos números }
  write('Digite o primeiro número: ');
  readln(numero1);
  
  write('Digite o segundo número: ');
  readln(numero2);
  
  { Cálculos }
  soma := numero1 + numero2;
  subtracao := numero1 - numero2;
  multiplicacao := numero1 * numero2;
  
  { Exibição dos resultados }
  writeln;
  writeln('=== RESULTADOS ===');
  writeln('Soma: ', numero1:0:2, ' + ', numero2:0:2, ' = ', soma:0:2);
  writeln('Subtração: ', numero1:0:2, ' - ', numero2:0:2, ' = ', subtracao:0:2);
  writeln('Multiplicação: ', numero1:0:2, ' × ', numero2:0:2, ' = ', multiplicacao:0:2);
  
  { Divisão com tratamento de erro }
  if numero2 <> 0 then
  begin
    divisao := numero1 / numero2;
    writeln('Divisão: ', numero1:0:2, ' ÷ ', numero2:0:2, ' = ', divisao:0:2);
  end
  else
  begin
    writeln('Divisão: Erro - Não é possível dividir por zero!');
  end;
  
  writeln;
  writeln('Obrigado por usar nossa calculadora!');
end.