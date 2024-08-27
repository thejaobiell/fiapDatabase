-- Tabela Cliente
CREATE TABLE Cliente (
    CPF_Cliente VARCHAR2(14) PRIMARY KEY NOT NULL,
    Nome_Cliente VARCHAR2(100) NOT NULL,
    Email_Cliente VARCHAR2(100) UNIQUE,
    Telefone_Cliente VARCHAR2(14) UNIQUE,
    CONSTRAINT CHK_CPF_FORMAT CHECK (REGEXP_LIKE(CPF_Cliente, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$')),
    CONSTRAINT CHK_Telefone_FORMAT CHECK (REGEXP_LIKE(Telefone_Cliente, '^\(\d{2}\) \d{4,5}-\d{4}$'))
);

-- Tabela Automovel
CREATE TABLE Automovel (
    Placa_Automovel VARCHAR2(7) PRIMARY KEY NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14),
    Modelo_Automovel VARCHAR2(100),
    Ano_Automovel NUMBER(4),
    FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

-- Tabela Assistente
CREATE TABLE Assistente (
    ID_Chatbot VARCHAR2(1000) PRIMARY KEY NOT NULL,
    horario_chat_Chatbot DATE NOT NULL,
    Plano_Chatbot VARCHAR2(10) NOT NULL,
    Tipodechat_Chatbot CHAR(1) NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14),
    CONSTRAINT FK_CPF_Cliente FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

-- Tabela Loja_Parceira
CREATE TABLE Loja_Parceira (
    Endereco_Loja VARCHAR2(200) PRIMARY KEY NOT NULL,
    Nome_Loja VARCHAR2(100)
);

-- Tabela Pre_Diagnostico
CREATE TABLE Pre_Diagnostico (
    ID NUMBER PRIMARY KEY NOT NULL,
    Diagnostico VARCHAR2(255),
    Assistente_ID_Chatbot VARCHAR2(1000),
    CONSTRAINT FK_Assistente FOREIGN KEY (Assistente_ID_Chatbot) REFERENCES Assistente(ID_Chatbot)
);

-- Tabela Peca
CREATE TABLE Peca (
    ID_Peca NUMBER PRIMARY KEY NOT NULL,
    Descricao_Peca VARCHAR2(100),
    Loja_Parceira_Endereco VARCHAR2(200),
    CONSTRAINT FK_Loja_Parceira FOREIGN KEY (Loja_Parceira_Endereco) REFERENCES Loja_Parceira(Endereco_Loja)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    ID NUMBER PRIMARY KEY NOT NULL,
    Loja_Parceira_Endereco VARCHAR2(200),
    CONSTRAINT FK_Entrega_Loja FOREIGN KEY (Loja_Parceira_Endereco) REFERENCES Loja_Parceira(Endereco_Loja)
);

-- Tabela Vincula
CREATE TABLE Vincula (
    Assistente_CPF_Cliente VARCHAR2(14),
    Loja_Parceira_Endereco VARCHAR2(200),
    CONSTRAINT FK_Vincula_Assistente FOREIGN KEY (Assistente_CPF_Cliente) REFERENCES Assistente(Cliente_CPF_Cliente),
    CONSTRAINT FK_Vincula_Loja FOREIGN KEY (Loja_Parceira_Endereco) REFERENCES Loja_Parceira(Endereco_Loja),
    PRIMARY KEY (Assistente_CPF_Cliente, Loja_Parceira_Endereco)  -- Assuming this combination should be unique
);

-- Dropping tables
DROP TABLE Cliente;
DROP TABLE Automovel;
DROP TABLE Assistente;
DROP TABLE Loja_Parceira;
DROP TABLE Pre_Diagnostico;
DROP TABLE Peca;
DROP TABLE Entrega;
DROP TABLE Vincula;




















-- Primeiro, remova as tabelas que têm chaves estrangeiras
-- Se a tabela Vincula referenciar Assistente e Loja_Parceira
DROP TABLE Vincula;

-- Se a tabela Entrega referenciar Loja_Parceira
DROP TABLE Entrega;

-- Se a tabela Peca referenciar Loja_Parceira
DROP TABLE Peca;

-- Se a tabela Pre_Diagnostico referenciar Assistente
DROP TABLE Pre_Diagnostico;

-- Se a tabela Assistente referenciar Cliente
DROP TABLE Assistente;

-- Se a tabela Automovel referenciar Cliente
DROP TABLE Automovel;

-- Finalmente, remova as tabelas restantes sem chaves estrangeiras
DROP TABLE Cliente;

-- Loja_Parceira deve ser removida por último se outras tabelas referenciam ela
DROP TABLE Loja_Parceira;