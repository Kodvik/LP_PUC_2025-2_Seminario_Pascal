# 🔧 Guia de Compilação - Pascal

## 🚀 Compilação Básica

### Compilar um programa Pascal
```bash
fpc programa.pas
```

### Executar o programa compilado
```bash
# Linux/macOS
./programa

# Windows
programa.exe
```

## 📋 Exemplos Práticos

### 1. Compilando o "Olá Mundo"
```bash
cd exemplos/basicos/
fpc ola_mundo.pas
./ola_mundo
```

### 2. Compilando com debug
```bash
fpc -g programa.pas
```

### 3. Compilação otimizada
```bash
fpc -O2 programa.pas
```

### 4. Especificar nome do executável
```bash
fpc -o meu_programa programa.pas
```

## 🛠️ Opções Úteis do Compilador

| Opção | Descrição | Exemplo |
|-------|-----------|---------|
| `-g` | Inclui informações de debug | `fpc -g programa.pas` |
| `-O2` | Otimização nível 2 | `fpc -O2 programa.pas` |
| `-o nome` | Define nome do executável | `fpc -o calc calculadora.pas` |
| `-v` | Modo verboso | `fpc -v programa.pas` |
| `-h` | Mostra ajuda | `fpc -h` |
| `-l` | Mostra informações durante link | `fpc -l programa.pas` |

## 🎯 Scripts de Compilação

### Script para Linux/macOS (compile.sh)
```bash
#!/bin/bash
echo "Compilando $1..."
fpc -O2 "$1"
if [ $? -eq 0 ]; then
    echo "Compilação bem-sucedida!"
    echo "Execute com: ./${1%.*}"
else
    echo "Erro na compilação!"
fi
```

### Script para Windows (compile.bat)
```batch
@echo off
echo Compilando %1...
fpc -O2 %1
if %errorlevel% == 0 (
    echo Compilacao bem-sucedida!
    echo Execute com: %~n1.exe
) else (
    echo Erro na compilacao!
)
```

## 🐛 Solucionando Problemas Comuns

### Erro: "Command not found: fpc"
**Solução:** Instale o Free Pascal Compiler
```bash
# Ubuntu/Debian
sudo apt install fpc

# macOS
brew install fpc

# Windows: Baixe do site oficial
```

### Erro: "Fatal: Can't find unit..."
**Solução:** Verifique se todas as units necessárias estão instaladas
```bash
# Instalar units adicionais no Ubuntu/Debian
sudo apt install fp-units-base fp-units-fcl
```

### Erro: "Error while linking"
**Solução:** Verifique se todas as dependências estão instaladas
```bash
# Ubuntu/Debian
sudo apt install build-essential
```

### Arquivo não executa
**Problemas possíveis:**
1. **Permissões:** `chmod +x programa`
2. **Arquitetura:** Verifique se foi compilado para sua arquitetura
3. **Dependências:** Instale bibliotecas necessárias

## 📁 Estrutura de Projeto Recomendada

```
meu_projeto/
├── src/           # Código fonte (.pas)
├── bin/           # Executáveis compilados
├── obj/           # Arquivos objeto (.o)
├── docs/          # Documentação
├── tests/         # Testes
└── Makefile       # Automação de build
```

## 🔄 Makefile Exemplo

```makefile
# Variáveis
COMPILER = fpc
FLAGS = -O2
SRCDIR = src
BINDIR = bin
OBJDIR = obj

# Alvos
all: $(BINDIR)/programa

$(BINDIR)/programa: $(SRCDIR)/programa.pas
	@mkdir -p $(BINDIR) $(OBJDIR)
	$(COMPILER) $(FLAGS) -o$(BINDIR)/programa $<

clean:
	rm -rf $(BINDIR)/* $(OBJDIR)/*

install:
	sudo cp $(BINDIR)/programa /usr/local/bin/

.PHONY: all clean install
```

### Uso do Makefile:
```bash
make           # Compila o projeto
make clean     # Limpa arquivos compilados
make install   # Instala o programa
```

## 🧪 Testando os Exemplos

### Teste rápido de todos os exemplos básicos:
```bash
#!/bin/bash
cd exemplos/basicos/
for arquivo in *.pas; do
    echo "Testando $arquivo..."
    fpc "$arquivo"
    if [ $? -eq 0 ]; then
        echo "✅ $arquivo compilou com sucesso"
    else
        echo "❌ Erro ao compilar $arquivo"
    fi
done
```

## 📊 Análise de Performance

### Comparando otimizações:
```bash
# Sem otimização
time fpc programa.pas

# Com otimização
time fpc -O2 programa.pas

# Comparar tamanho dos executáveis
ls -lh programa
```

## 🔍 Debug e Profiling

### Usando GDB para debug:
```bash
# Compilar com debug
fpc -g programa.pas

# Executar no debugger
gdb ./programa
```

### Comandos úteis no GDB:
- `run` - Executa o programa
- `break main` - Adiciona breakpoint
- `step` - Executa linha por linha
- `print variavel` - Mostra valor da variável
- `quit` - Sai do debugger

## 💡 Dicas de Produtividade

1. **Use aliases:** `alias fpc-debug='fpc -g'`
2. **Script de limpeza:** `find . -name "*.o" -delete`
3. **Compilação rápida:** `fpc -B programa.pas` (força recompilação)
4. **Check syntax:** `fpc -S programa.pas` (apenas verifica sintaxe)

## 🌐 Compilação Cruzada

### Para Windows (a partir do Linux):
```bash
fpc -Twin32 programa.pas  # Windows 32-bit
fpc -Twin64 programa.pas  # Windows 64-bit
```

### Para outras arquiteturas:
```bash
fpc -Tlinux -Px86_64 programa.pas    # Linux 64-bit
fpc -Tdarwin -Paarch64 programa.pas  # macOS ARM
```

---

**Dica Final:** Sempre teste seus programas com diferentes entradas para garantir que funcionam corretamente em todos os cenários!