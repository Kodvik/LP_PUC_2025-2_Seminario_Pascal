{feito pelo Maicon}
program NotasAlunos;
    uses crt;
    var
      nome: string;
      nota1, nota2, nota3, media: real;
    
    begin
      clrscr;
      
      writeln('Digite o nome do aluno:');
      readln(nome);
      
      writeln('Digite a primeira nota:');
      readln(nota1);
      
      writeln('Digite a segunda nota:');
      readln(nota2);
      
      writeln('Digite a terceira nota:');
      readln(nota3);
      
      media := (nota1 + nota2 + nota3) / 3;
      
      writeln('Aluno: ', nome);
      writeln('Media: ', media:0:2);
      
      if media >= 7 then
        writeln('Situacao: Aprovado')
      else if media >= 5 then
        writeln('Situacao: Recuperacao')
      else
        writeln('Situacao: Reprovado');
      
      readln;
end.
