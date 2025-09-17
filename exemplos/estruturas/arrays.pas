program ExemplosArrays;
{
  Programa: Demonstração de Arrays em Pascal
  Descrição: Exemplos de uso de arrays (vetores e matrizes)
  Autor: Seminário Pascal - PUC Minas 2025/2
}

const
  MAX_ELEMENTOS = 5;

var
  numeros: array[1..MAX_ELEMENTOS] of integer;
  i: integer;
  soma, media: real;

begin
  writeln('=== DEMONSTRAÇÃO DE ARRAYS ===');
  writeln;
  
  { Leitura dos elementos }
  writeln('Digite ', MAX_ELEMENTOS, ' números inteiros:');
  for i := 1 to MAX_ELEMENTOS do
  begin
    write('Número ', i, ': ');
    readln(numeros[i]);
  end;
  
  { Cálculo da soma }
  soma := 0;
  for i := 1 to MAX_ELEMENTOS do
    soma := soma + numeros[i];
    
  media := soma / MAX_ELEMENTOS;
  
  { Exibição dos resultados }
  writeln;
  writeln('=== RESULTADOS ===');
  write('Números digitados: ');
  for i := 1 to MAX_ELEMENTOS do
  begin
    write(numeros[i]);
    if i < MAX_ELEMENTOS then
      write(', ');
  end;
  writeln;
  
  writeln('Soma: ', soma:0:0);
  writeln('Média: ', media:0:2);
  
  { Encontrar maior e menor }
  var maior, menor: integer;
  maior := numeros[1];
  menor := numeros[1];
  
  for i := 2 to MAX_ELEMENTOS do
  begin
    if numeros[i] > maior then
      maior := numeros[i];
    if numeros[i] < menor then
      menor := numeros[i];
  end;
  
  writeln('Maior número: ', maior);
  writeln('Menor número: ', menor);
end.