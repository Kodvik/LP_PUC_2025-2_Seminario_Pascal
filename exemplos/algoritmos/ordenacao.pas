program AlgoritmosOrdenacao;
{
  Programa: Algoritmos de Ordenação
  Descrição: Implementação do Bubble Sort em Pascal
  Autor: Seminário Pascal - PUC Minas 2025/2
}

const
  MAX = 10;

type
  TArray = array[1..MAX] of integer;

var
  numeros: TArray;
  n, i: integer;

{ Procedimento para ler o array }
procedure LerArray(var arr: TArray; var tamanho: integer);
var
  i: integer;
begin
  write('Quantos números deseja ordenar (máximo ', MAX, '): ');
  readln(tamanho);
  
  if tamanho > MAX then
    tamanho := MAX;
    
  writeln('Digite os números:');
  for i := 1 to tamanho do
  begin
    write('Número ', i, ': ');
    readln(arr[i]);
  end;
end;

{ Procedimento para exibir o array }
procedure ExibirArray(const arr: TArray; tamanho: integer; titulo: string);
var
  i: integer;
begin
  writeln(titulo);
  write('[');
  for i := 1 to tamanho do
  begin
    write(arr[i]);
    if i < tamanho then
      write(', ');
  end;
  writeln(']');
end;

{ Implementação do Bubble Sort }
procedure BubbleSort(var arr: TArray; tamanho: integer);
var
  i, j, temp: integer;
  trocou: boolean;
begin
  for i := 1 to tamanho - 1 do
  begin
    trocou := false;
    for j := 1 to tamanho - i do
    begin
      if arr[j] > arr[j + 1] then
      begin
        { Troca os elementos }
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
        trocou := true;
      end;
    end;
    
    { Se não houve troca, o array já está ordenado }
    if not trocou then
      break;
  end;
end;

begin
  writeln('=== ALGORITMO DE ORDENAÇÃO - BUBBLE SORT ===');
  writeln;
  
  { Leitura dos dados }
  LerArray(numeros, n);
  
  { Exibição do array original }
  writeln;
  ExibirArray(numeros, n, 'Array original:');
  
  { Ordenação }
  BubbleSort(numeros, n);
  
  { Exibição do array ordenado }
  ExibirArray(numeros, n, 'Array ordenado:');
  
  writeln;
  writeln('Ordenação concluída com sucesso!');
end.