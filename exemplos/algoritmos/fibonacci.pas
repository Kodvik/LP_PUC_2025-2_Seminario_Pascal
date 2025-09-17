program SequenciaFibonacci;
{
  Programa: Sequência de Fibonacci
  Descrição: Demonstra recursão e iteração para calcular Fibonacci
  Autor: Seminário Pascal - PUC Minas 2025/2
}

var
  n: integer;

{ Função recursiva para calcular Fibonacci }
function FibonacciRecursivo(n: integer): longint;
begin
  if n <= 1 then
    FibonacciRecursivo := n
  else
    FibonacciRecursivo := FibonacciRecursivo(n - 1) + FibonacciRecursivo(n - 2);
end;

{ Função iterativa para calcular Fibonacci (mais eficiente) }
function FibonacciIterativo(n: integer): longint;
var
  a, b, temp, i: longint;
begin
  if n <= 1 then
  begin
    FibonacciIterativo := n;
    exit;
  end;
  
  a := 0;
  b := 1;
  
  for i := 2 to n do
  begin
    temp := a + b;
    a := b;
    b := temp;
  end;
  
  FibonacciIterativo := b;
end;

{ Procedimento para exibir a sequência }
procedure ExibirSequencia(quantidade: integer);
var
  i: integer;
begin
  writeln('Sequência de Fibonacci (primeiros ', quantidade, ' números):');
  for i := 0 to quantidade - 1 do
  begin
    write(FibonacciIterativo(i));
    if i < quantidade - 1 then
      write(', ');
  end;
  writeln;
end;

begin
  writeln('=== SEQUÊNCIA DE FIBONACCI ===');
  writeln;
  
  write('Digite um número: ');
  readln(n);
  
  if n < 0 then
  begin
    writeln('Por favor, digite um número não-negativo.');
    exit;
  end;
  
  writeln;
  writeln('=== RESULTADOS ===');
  
  { Cálculo usando método iterativo }
  writeln('Fibonacci(', n, ') = ', FibonacciIterativo(n));
  
  { Exibir a sequência }
  if n <= 20 then  { Evita sequências muito longas }
  begin
    writeln;
    ExibirSequencia(n + 1);
  end;
  
  { Comparação de métodos para números pequenos }
  if n <= 10 then
  begin
    writeln;
    writeln('=== COMPARAÇÃO DE MÉTODOS ===');
    writeln('Método iterativo: ', FibonacciIterativo(n));
    writeln('Método recursivo: ', FibonacciRecursivo(n));
  end
  else
  begin
    writeln;
    writeln('Nota: Para números grandes, apenas o método iterativo é usado (mais eficiente).');
  end;
end.