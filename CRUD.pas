program CRUD_Estudantes;
uses crt;

const
  MAX_ESTUDANTES = 100; { Limite do array }

type
  TEstudante = record
    id: integer;
    nome: string[50];
    nota: integer;
    ativo: boolean; { Flag para indicar se o registro está ativo }
    {notem que a linguagem deixa muito bem definida os tipos das variaveis}
  end;

var
  estudantes: array[1..MAX_ESTUDANTES] of TEstudante;
  totalEstudantes: integer;

{ Procedimento para inicializar o array }
procedure Inicializar;
var
  i: integer;
begin
  totalEstudantes := 0;
  for i := 1 to MAX_ESTUDANTES do
    estudantes[i].ativo := false;
end;

{ Função para encontrar um slot livre }
function EncontrarSlotLivre: integer;
var
  i: integer;
begin
  for i := 1 to MAX_ESTUDANTES do
    if not estudantes[i].ativo then
    begin
      EncontrarSlotLivre := i;
      exit;
    end;
  EncontrarSlotLivre := 0; { Retorna 0 se não houver slot livre }
end;

{ Procedimento para criar um novo estudante }
procedure CriarEstudante;
var
  inputId, inputNota: integer;
  inputNome: string[50];
  slot: integer;
begin
  clrscr; {comando para limpar o console/janela atual}
  writeln('=== Criar Estudante ===');
  slot := EncontrarSlotLivre;
  if slot = 0 then
  begin
    writeln('Erro: Banco cheio!');
    readln;
    exit;
  end;
  writeln('Digite o ID: ');
  readln(inputId);
  writeln('Digite o nome: ');
  readln(inputNome);
  writeln('Digite a nota: ');
  readln(inputNota);
  with estudantes[slot] do
  begin
    id := inputId;
    nome := inputNome;
    nota := inputNota;
    ativo := true;
  end;
  totalEstudantes := totalEstudantes + 1;
  writeln('Estudante criado com sucesso!');
  readln;
end;

{ Procedimento para ler (listar) todos os estudantes }
procedure ListarEstudantes;
var
  i: integer;
begin
  clrscr; {comando para limpar o console/janela atual}
  writeln('=== Lista de Estudantes ===');
  if totalEstudantes = 0 then
  begin
    writeln('Nenhum estudante cadastrado.');
    readln;
    exit;
  end;
  for i := 1 to MAX_ESTUDANTES do
    if estudantes[i].ativo then
      writeln('ID: ', estudantes[i].id, ' | Nome: ', estudantes[i].nome, ' | Nota: ', estudantes[i].nota);
      {notem que não posso fazer uma 'quebra de linha nessa definição ou causa um erro, tentem separa-la caso queiram testar'}
  readln;
end;

{ Função para buscar estudante por ID }
function BuscarEstudante(id: integer): integer;
var
  i: integer;
begin
  for i := 1 to MAX_ESTUDANTES do
    if (estudantes[i].ativo) and (estudantes[i].id = id) then
    begin
      BuscarEstudante := i;
      exit;
    end;
  BuscarEstudante := 0; { Retorna 0 se não encontrado }
end;

{ Procedimento para atualizar um estudante }
procedure AtualizarEstudante;
var
  inputId, inputNota: integer;
  inputNome: string[50];
  indice: integer;
begin
  clrscr; {comando para limpar o console/janela atual}
  writeln('=== Atualizar Estudante ===');
  writeln('Digite o ID do estudante: ');
  readln(inputId);
  indice := BuscarEstudante(inputId);
  if indice = 0 then
  begin
    writeln('Estudante não encontrado!');
    readln;
    exit;
  end;
  writeln('Digite o novo nome: ');
  readln(inputNome);
  writeln('Digite a nova nota: ');
  readln(inputNota);
  with estudantes[indice] do
  begin
    nome := inputNome;
    nota := inputNota;
  end;
  writeln('Estudante atualizado com sucesso!');
  readln;
end;

{ Procedimento para deletar um estudante }
procedure DeletarEstudante;
var
  id, indice: integer;
begin
  clrscr; {comando para limpar o console/janela atual}
  writeln('=== Deletar Estudante ===');
  writeln('Digite o ID do estudante: ');
  readln(id);
  indice := BuscarEstudante(id);
  if indice = 0 then
  begin
    writeln('Estudante não encontrado!');
    readln;
    exit;
  end;
  estudantes[indice].ativo := false;
  totalEstudantes := totalEstudantes - 1;
  writeln('Estudante deletado com sucesso!');
  readln;
end;

{ Procedimento para exibir o menu }
procedure ExibirMenu;
begin
  clrscr; {comando para limpar o console/janela atual}
  writeln('=== Sistema CRUD de Estudantes ===');
  writeln('1. Criar estudante');
  writeln('2. Listar estudantes');
  writeln('3. Atualizar estudante');
  writeln('4. Deletar estudante');
  writeln('5. Sair');
  writeln('Escolha uma opção: ');
end;

{ Programa principal }
{Como o professor explicou durante a apresentação, o programa em si, se resume a esta linha para baixo}
{sendo tudo acima,modulos/blocos para o funcionamento do programa, e como dito a modularização poderia ser ainda maior}
var
  opcao: integer;
begin
  Inicializar;
  repeat
    ExibirMenu;
    readln(opcao);
    case opcao of
      1: CriarEstudante;
      2: ListarEstudantes;
      3: AtualizarEstudante;
      4: DeletarEstudante;
      5: writeln('Saindo...');
      else
      begin
        writeln('Opção inválida! Pressione Enter para continuar.'); {simples tratamento de opção invalida}
        readln;
      end;
    end;
  until opcao = 5;
end.
