# 💡 Dicas e Boas Práticas - Pascal

## 🎯 Convenções de Nomenclatura

### Variáveis
```pascal
// ✅ Bom - descritivo e claro
var
  idadeUsuario: integer;
  nomeCompleto: string;
  salarioMensal: real;

// ❌ Ruim - nomes não descritivos
var
  i, x, y: integer;
  s: string;
  r: real;
```

### Constantes
```pascal
// ✅ Use constantes para valores fixos
const
  MAX_ESTUDANTES = 50;
  PI = 3.14159;
  NOME_SISTEMA = 'Sistema Acadêmico';

// ❌ Evite números "mágicos" no código
if idade >= 18 then  // De onde vem 18?
```

### Funções e Procedimentos
```pascal
// ✅ Nomes descritivos com verbos
function CalcularMedia(nota1, nota2, nota3: real): real;
procedure ExibirResultado(media: real);

// ❌ Nomes genéricos
function Calc(a, b, c: real): real;
procedure Show(x: real);
```

## 📝 Comentários Eficazes

### Comentários de Cabeçalho
```pascal
program GerenciadorNotas;
{
  Programa: Gerenciador de Notas Escolares
  Autor: João Silva
  Data: 15/09/2024
  Descrição: Sistema para calcular médias e situação de alunos
  Versão: 1.0
}
```

### Comentários Inline
```pascal
// ✅ Explique o "porquê", não o "o quê"
media := (nota1 + nota2 + nota3) / 3;  // Média aritmética simples

// ✅ Explique lógica complexa
if (media >= 7.0) and (frequencia >= 0.75) then  // Aprovação: média ≥ 7 E frequência ≥ 75%
  situacao := 'Aprovado';

// ❌ Comentários óbvios
i := i + 1;  // Incrementa i
```

## 🔧 Estrutura do Código

### Indentação Consistente
```pascal
// ✅ Indentação clara
if idade >= 18 then
begin
  writeln('Maior de idade');
  if temCNH then
  begin
    writeln('Pode dirigir');
  end
  else
  begin
    writeln('Precisa tirar CNH');
  end;
end;
```

### Uso de Begin/End
```pascal
// ✅ Sempre use begin/end para clareza
if condicao then
begin
  comando1;
  comando2;
end
else
begin
  comando3;
end;

// ❌ Evite omitir begin/end mesmo com um comando
if condicao then
  comando1;  // Pode causar problemas ao adicionar comandos
```

## 🎯 Validação de Entrada

### Validação Robusta
```pascal
// ✅ Sempre valide entradas do usuário
repeat
  write('Digite sua idade (0-120): ');
  readln(idade);
  if (idade < 0) or (idade > 120) then
    writeln('Idade inválida! Tente novamente.');
until (idade >= 0) and (idade <= 120);

// ✅ Trate divisão por zero
if denominador <> 0 then
  resultado := numerador / denominador
else
  writeln('Erro: Divisão por zero!');
```

## 📊 Tipos de Dados

### Escolha o Tipo Adequado
```pascal
// ✅ Use tipos apropriados para cada situação
var
  idade: byte;           // 0-255, suficiente para idade
  populacao: longint;    // Para números grandes
  preco: real;           // Para valores monetários
  ativo: boolean;        // Para flags verdadeiro/falso
  nome: string[50];      // Limite de tamanho para nomes
```

### Arrays com Constantes
```pascal
// ✅ Use constantes para tamanhos de arrays
const
  MAX_ALUNOS = 30;
  
type
  TNotas = array[1..MAX_ALUNOS] of real;
  
var
  notas: TNotas;
```

## 🔄 Estruturas de Repetição

### Escolha a Estrutura Correta
```pascal
// ✅ FOR - quando souber quantas iterações
for i := 1 to 10 do
  writeln(i);

// ✅ WHILE - condição testada antes
while (numero > 0) do
begin
  numero := numero div 2;
  contador := contador + 1;
end;

// ✅ REPEAT - condição testada depois (executa ao menos uma vez)
repeat
  write('Digite um número positivo: ');
  readln(numero);
until numero > 0;
```

## 🛡️ Tratamento de Erros

### Verificações Preventivas
```pascal
// ✅ Verifique limites de arrays
if (i >= 1) and (i <= MAX_ELEMENTOS) then
  array[i] := valor
else
  writeln('Índice fora dos limites!');

// ✅ Verifique arquivos antes de usar
if FileExists(nomeArquivo) then
  // processar arquivo
else
  writeln('Arquivo não encontrado: ', nomeArquivo);
```

## 🎨 Formatação de Saída

### Saída Bem Formatada
```pascal
// ✅ Use formatação para números reais
writeln('Preço: R$ ', preco:0:2);        // 2 casas decimais
writeln('Porcentagem: ', percent:0:1, '%'); // 1 casa decimal

// ✅ Alinhe saídas tabulares
writeln('Nome':20, 'Idade':8, 'Salário':12);
writeln(nome:20, idade:8, salario:12:2);

// ✅ Use separadores visuais
writeln('===============================');
writeln('       RELATÓRIO FINAL        ');
writeln('===============================');
```

## 🧩 Modularização

### Funções e Procedimentos
```pascal
// ✅ Uma função = uma responsabilidade
function EhPrimo(numero: integer): boolean;
var
  i: integer;
begin
  if numero < 2 then
  begin
    EhPrimo := false;
    exit;
  end;
  
  for i := 2 to trunc(sqrt(numero)) do
    if numero mod i = 0 then
    begin
      EhPrimo := false;
      exit;
    end;
    
  EhPrimo := true;
end;

// ✅ Procedimentos para tarefas específicas
procedure ExibirMenu;
begin
  writeln('1 - Cadastrar aluno');
  writeln('2 - Listar alunos');
  writeln('3 - Calcular médias');
  writeln('0 - Sair');
  write('Escolha uma opção: ');
end;
```

## ⚡ Performance

### Otimizações Simples
```pascal
// ✅ Evite cálculos desnecessários em loops
limite := trunc(sqrt(numero));  // Calcule uma vez
for i := 2 to limite do
  // usar limite ao invés de sqrt(numero)

// ✅ Use exit para sair cedo de funções
function BuscarElemento(array: TArray; elemento: integer): integer;
var
  i: integer;
begin
  for i := 1 to Length(array) do
    if array[i] = elemento then
    begin
      BuscarElemento := i;
      exit;  // Sai assim que encontra
    end;
  BuscarElemento := -1;  // Não encontrou
end;
```

## 🚫 Erros Comuns a Evitar

### Arrays
```pascal
// ❌ Não inicializar arrays quando necessário
for i := 1 to MAX do
  soma := soma + array[i];  // array pode conter lixo

// ✅ Inicialize quando necessário
for i := 1 to MAX do
  array[i] := 0;
```

### Loops Infinitos
```pascal
// ❌ Condição que nunca muda
i := 1;
while i <= 10 do
  writeln(i);  // i nunca é incrementado!

// ✅ Sempre altere a condição de parada
i := 1;
while i <= 10 do
begin
  writeln(i);
  i := i + 1;  // Incrementa i
end;
```

### Comparação de Reais
```pascal
// ❌ Comparação direta de números reais
if preco = 10.50 then  // Pode não funcionar devido à precisão

// ✅ Use tolerância para comparação
if abs(preco - 10.50) < 0.01 then  // Tolerância de 1 centavo
```

## 📚 Dicas de Estudo

1. **Pratique regularmente** - 30 minutos por dia são melhores que 5 horas uma vez por semana
2. **Leia código de outros** - Analise diferentes soluções para o mesmo problema
3. **Use debugger** - Aprenda a usar step-by-step para entender o fluxo
4. **Documente suas soluções** - Explique seu raciocínio
5. **Teste casos extremos** - Valores negativos, zero, muito grandes
6. **Refatore código antigo** - Volte e melhore códigos que você escreveu antes

---

*"A prática leva à perfeição, mas a prática perfeita leva à excelência!"*