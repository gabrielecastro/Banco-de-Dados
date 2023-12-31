-- Criando a tabela funcionário
CREATE TABLE [FUNCIONARIO]
(
[COD_FUNCIONARIO] INTEGER NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[EMAIL] NVARCHAR(160) NOT NULL,
[FUNCAO] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_FUNCIONARIO] PRIMARY KEY ([COD_FUNCIONARIO])
);
CREATE UNIQUE INDEX [IPK_FUNCIONARIO] ON [FUNCIONARIO]([COD_FUNCIONARIO]);
-- Criando a tabela aeronave
CREATE TABLE [AERONAVE]
(
[COD_AERONAVE] INTEGER NOT NULL,
[MODELO] NVARCHAR(160) NOT NULL,
[TIPO] NVARCHAR(160) NOT NULL,
[COMBUSTIVEL] NVARCHAR(160) NOT NULL,
[AUTONOMIA] FLOAT(8,2) NOT NULL,
CONSTRAINT [PK_AERONAVE] PRIMARY KEY ([COD_AERONAVE])
);
CREATE UNIQUE INDEX [IPK_AERONAVE] ON [AERONAVE]([COD_AERONAVE]);
-- Criando a tabela passageiro
CREATE TABLE [PASSAGEIRO]
(
[COD_PASSAGEIRO] INTEGER NOT NULL,
[NOME] NVARCHAR(160) NOT NULL,
[CPF] NVARCHAR(160) NOT NULL,
[TELEFONE] NVARCHAR(160) NOT NULL,
CONSTRAINT [PK_PASSAGEIRO] PRIMARY KEY ([COD_PASSAGEIRO])
);
CREATE UNIQUE INDEX [IPK_PASSAGEIRO] ON [PASSAGEIRO]([COD_PASSAGEIRO]);
-- Criando a tabela assento
CREATE TABLE [ASSENTO]
(
[COD_ASSENTO] INTEGER NOT NULL,
[CATEGORIA] NVARCHAR(160) NOT NULL,
[VALOR] FLOAT(8,2) NOT NULL,
CONSTRAINT [PK_ASSENTO] PRIMARY KEY ([COD_ASSENTO])
);
CREATE UNIQUE INDEX [IPK_ASSENTO] ON [ASSENTO]([COD_ASSENTO]);
-- Criando a tabela assentos passagem
CREATE TABLE [ASSENTOS_PASSAGEM]
(
[COD_ASSENTOS_PASSAGEM] INTEGER NOT NULL,
[COD_ASSENTO] INTEGER NOT NULL,
[COD_PASSAGEM] INTEGER NOT NULL,
CONSTRAINT [PK_ASSENTOS_PASSAGEM] PRIMARY KEY ([COD_ASSENTOS_PASSAGEM]),
CONSTRAINT [FK_ASSENTO] FOREIGN KEY ([COD_ASSENTO]) REFERENCES
ASSENTO(COD_ASSENTO),
CONSTRAINT [FK_PASSAGEM] FOREIGN KEY ([COD_PASSAGEM]) REFERENCES
PASSAGEM(COD_PASSAGEM)
);
CREATE UNIQUE INDEX [IPK_ASSENTOS_PASSAGEM] ON [ASSENTOS_PASSAGEM]
([COD_ASSENTOS_PASSAGEM]);
-- Criando a tabela passagem
CREATE TABLE [PASSAGEM]
(
[COD_PASSAGEM] INTEGER NOT NULL,
[COD_PASSAGEIRO] INTEGER NOT NULL,
[COD_AERONAVE] INTEGER NOT NULL,
[ORIGEM] NVARCHAR(160) NOT NULL,
[DESTINO] NVARCHAR(160) NOT NULL,
[DATAHORA] DATETIME NOT NULL,
[VALOR_TOTAL] FLOAT(8,2) NOT NULL,
CONSTRAINT [PK_PASSAGEM] PRIMARY KEY ([COD_PASSAGEM]),
CONSTRAINT [FK_PASSAGEIRO] FOREIGN KEY ([COD_PASSAGEIRO]) REFERENCES
PASSAGEIRO(COD_PASSAGEIRO),
CONSTRAINT [FK_AERONAVE] FOREIGN KEY ([COD_AERONAVE]) REFERENCES
AERONAVE(COD_AERONAVE)
);
CREATE UNIQUE INDEX [IPK_PASSAGEM] ON [PASSAGEM]([COD_PASSAGEM]);
-- Criando a tabela produto
CREATE TABLE [PRODUTO]
(
[COD_PRODUTO] INTEGER NOT NULL,
[TIPO] NVARCHAR(160) NOT NULL,
[CATEGORIA] NVARCHAR(160) NOT NULL,
[QTD] INTEGER NOT NULL,
[PRECO] FLOAT(8,2) NOT NULL,
CONSTRAINT [PK_PRODUTO] PRIMARY KEY ([COD_PRODUTO])
);
CREATE UNIQUE INDEX [IPK_PRODUTO] ON [PRODUTO]([COD_PRODUTO]);
-- Criando a tabela produtos passagem
CREATE TABLE [PRODUTOS_PASSAGEM]
(
[COD_PRODUTOS_PASSAGEM] INTEGER NOT NULL,
[COD_PRODUTO] INTEGER NOT NULL,
[COD_PASSAGEM] INTEGER NOT NULL,
CONSTRAINT [PK_TRIPULACAO] PRIMARY KEY ([COD_PRODUTOS_PASSAGEM]),
CONSTRAINT [FK_PRODUTO] FOREIGN KEY ([COD_PRODUTO]) REFERENCES
PRODUTO(COD_PRODUTO),
CONSTRAINT [FK_PASSAGEM] FOREIGN KEY ([COD_PASSAGEM]) REFERENCES
PASSAGEM(COD_PASSAGEM)
);
CREATE UNIQUE INDEX [IPK_PRODUTOS_PASSAGEM] ON [PRODUTOS_PASSAGEM]
([COD_PRODUTOS_PASSAGEM]);
-- Criando a tabela escalas passagem
CREATE TABLE [ESCALAS_PASSAGEM]
(
[COD_ESCALAS_PASSAGEM] INTEGER NOT NULL,
[COD_PASSAGEM] INTEGER NOT NULL,
[LOCAL_ESCALA] NVARCHAR(160) NOT NULL,
[QTD] INTEGER NOT NULL,
CONSTRAINT [PK_ESCALAS_PASSAGEM] PRIMARY KEY ([COD_ESCALAS_PASSAGEM]),
CONSTRAINT [FK_PASSAGEM] FOREIGN KEY ([COD_PASSAGEM]) REFERENCES
PASSAGEM(COD_PASSAGEM)
);
CREATE UNIQUE INDEX [IPK_ESCALAS_PASSAGEM] ON [ESCALAS_PASSAGEM]
([COD_ESCALAS_PASSAGEM]);
-- Criando a tabela tripulação escala
CREATE TABLE [TRIPULACAO_ESCALA]
(
[COD_TRIPULACAO_ESCALA] INTEGER NOT NULL,
[COD_ESCALAS_PASSAGEM] INTEGER NOT NULL,
[COD_FUNCIONARIO] INTEGER NOT NULL,
CONSTRAINT [PK_TRIPULACAO_ESCALA] PRIMARY KEY ([COD_TRIPULACAO_ESCALA]),
CONSTRAINT [FK_ESCALAS_PASSAGEM] FOREIGN KEY ([COD_ESCALAS_PASSAGEM])
REFERENCES ESCALAS_PASSAGEM(COD_ESCALAS_PASSAGEM),
CONSTRAINT [FK_FUNCIONARIO] FOREIGN KEY ([COD_FUNCIONARIO]) REFERENCES
FUNCIONARIO(COD_FUNCIONARIO)
);
CREATE UNIQUE INDEX [IPK_TRIPULACAO_ESCALA] ON [TRIPULACAO_ESCALA]
([COD_TRIPULACAO_ESCALA]);
