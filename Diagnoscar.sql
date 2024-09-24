CREATE TABLE Cliente (
    CPF_Cliente VARCHAR2(14) PRIMARY KEY NOT NULL,
    CNH_Cliente VARCHAR2(11) UNIQUE NOT NULL,
    Nome_Cliente VARCHAR2(100) NOT NULL,
    Sobrenome_Cliente VARCHAR2(100) NOT NULL,
    Email_Cliente VARCHAR2(100) UNIQUE,
    Telefone_Cliente VARCHAR2(15) UNIQUE,
    Endereco_Cliente VARCHAR2(200) NOT NULL,
    CONSTRAINT CHK_Cliente_CPF CHECK (REGEXP_LIKE(CPF_Cliente, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$')),
    CONSTRAINT CHK_Cliente_Telefone CHECK (REGEXP_LIKE(Telefone_Cliente, '^\(\d{2}\) \d{4,5}-\d{4}$')),
    CONSTRAINT CHK_Cliente_Email CHECK (REGEXP_LIKE(Email_Cliente, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

CREATE TABLE Automovel (
    Placa_Automovel VARCHAR2(7) PRIMARY KEY NOT NULL,
    Marca_Automovel VARCHAR2(20) NOT NULL, 
    Modelo_Automovel VARCHAR2(100) NOT NULL,
    Cor_Automovel VARCHAR2(15) NOT NULL,
    Ano_Automovel NUMBER(4) NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14),
    CONSTRAINT FK_Automovel_Cliente FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

CREATE TABLE Chatbot(
    ID_Chatbot VARCHAR2(1000) NOT NULL,
    Horario_Chat DATE NOT NULL,
    Plano VARCHAR2(10) NOT NULL,
    Tipo_Chat VARCHAR2(1) NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14),
    CONSTRAINT PK_Chatbot PRIMARY KEY (ID_Chatbot, Cliente_CPF_Cliente),
    CONSTRAINT FK_Chatbot_Cliente FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

CREATE TABLE Pre_Diagnostico (
    ID_PreDiagnostico VARCHAR2(1000) PRIMARY KEY NOT NULL,
    Nivel_Diagnostico NUMBER(3) CHECK (Nivel_Diagnostico >= 1 AND Nivel_Diagnostico <= 100), 
    Diagnostico VARCHAR2(500) NOT NULL,
    Assistente_ID_Chatbot VARCHAR2(1000) NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14) NOT NULL,
    CONSTRAINT FK_PreDiagnostico_Chatbot FOREIGN KEY (Assistente_ID_Chatbot, Cliente_CPF_Cliente) 
        REFERENCES Chatbot(ID_Chatbot, Cliente_CPF_Cliente)
);

CREATE TABLE Loja_Parceira (
    Endereco_Loja VARCHAR2(200) PRIMARY KEY NOT NULL,
    Cnpj_Loja VARCHAR2(18) NOT NULL UNIQUE,
    Nome_Loja VARCHAR2(120) NOT NULL,
    Avaliacao_Loja NUMBER(3, 2),
    Especializacao_Loja VARCHAR2(50) NOT NULL,
    CONSTRAINT CHK_Loja_Cnpj CHECK (REGEXP_LIKE(Cnpj_Loja, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}$')),
    CONSTRAINT CHK_Loja_Avaliacao CHECK (Avaliacao_Loja BETWEEN 0 AND 10)
);

CREATE TABLE Oficina (
    Endereco_Oficina VARCHAR2(200) PRIMARY KEY NOT NULL,
    Cnpj_Oficina VARCHAR2(18) NOT NULL UNIQUE,
    Nome_Oficina VARCHAR2(120) NOT NULL,
    Avaliacao_Oficina NUMBER(3, 2),
    Especializacao_Oficina VARCHAR2(50) NOT NULL,
    Chatbot_ID_Chatbot VARCHAR2(1000),
    Chatbot_Cliente_CPF_Cliente VARCHAR2(14),
    CONSTRAINT FK_Oficina_Chatbot FOREIGN KEY (Chatbot_ID_Chatbot, Chatbot_Cliente_CPF_Cliente) REFERENCES Chatbot(ID_Chatbot, Cliente_CPF_Cliente),
    CONSTRAINT CHK_Oficina_Cnpj CHECK (REGEXP_LIKE(Cnpj_Oficina, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}$')),
    CONSTRAINT CHK_Oficina_Avaliacao CHECK (Avaliacao_Oficina BETWEEN 0 AND 10)
);

CREATE TABLE Peca (
    ID_Peca NUMBER PRIMARY KEY NOT NULL,
    Tipo_Peca VARCHAR2(30) NOT NULL UNIQUE,
    Nome_Peca VARCHAR2(40) NOT NULL,
    Endereco_Peca VARCHAR2(200) NOT NULL,
    Loja_Parceira_Endereco_Loja VARCHAR2(200),
    CONSTRAINT FK_Peca_Loja FOREIGN KEY (Loja_Parceira_Endereco_Loja) REFERENCES Loja_Parceira(Endereco_Loja)
);

CREATE TABLE Entrega (
    ID_Entrega VARCHAR2(100) PRIMARY KEY NOT NULL,
    Data_Entrega DATE NOT NULL,
    Destino_Entrega VARCHAR2(200) NOT NULL,
    Item_Entrega VARCHAR2(100) NOT NULL,
    Endereco_Loja VARCHAR2(200) NOT NULL,
    CONSTRAINT FK_Entrega_Loja FOREIGN KEY (Endereco_Loja) REFERENCES Loja_Parceira(Endereco_Loja)
);

CREATE TABLE Vincula (
    CPF_Cliente VARCHAR2(14) NOT NULL,
    ID_Chatbot VARCHAR2(1000) NOT NULL,
    Endereco_Loja VARCHAR2(200),
    CONSTRAINT PK_Vincula PRIMARY KEY (CPF_Cliente, ID_Chatbot, Endereco_Loja),
    CONSTRAINT FK_Vincula_Chatbot FOREIGN KEY (CPF_Cliente, ID_Chatbot) REFERENCES Chatbot(Cliente_CPF_Cliente, ID_Chatbot),
    CONSTRAINT FK_Vincula_Loja FOREIGN KEY (Endereco_Loja) REFERENCES Loja_Parceira(Endereco_Loja)
);

--INSERTS

INSERT INTO Cliente (CPF_Cliente, CNH_Cliente, Nome_Cliente, Sobrenome_Cliente, Email_Cliente, Telefone_Cliente, Endereco_Cliente)
VALUES ('243.187.590-60', '75391826405', 'Lucas', 'Silva', 'lucas.silva@email.com', '(11) 91234-5678', 'Rua A, 123, S o Paulo, SP');
INSERT INTO Cliente (CPF_Cliente, CNH_Cliente, Nome_Cliente, Sobrenome_Cliente, Email_Cliente, Telefone_Cliente, Endereco_Cliente)
VALUES ('987.654.321-09', '85236974126', 'Simone', 'Santos', 'simone.santos@email.com', '(21) 91234-5678', 'Rua B, 456, Rio de Janeiro, RJ');

INSERT INTO Automovel (Placa_Automovel, Marca_Automovel, Modelo_Automovel, Cor_Automovel, Ano_Automovel, Cliente_CPF_Cliente)
VALUES ('ABC1234', 'Toyota', 'Corolla', 'Preto', 2019, '243.187.590-60');
INSERT INTO Automovel (Placa_Automovel, Marca_Automovel, Modelo_Automovel, Cor_Automovel, Ano_Automovel, Cliente_CPF_Cliente)
VALUES ('XYZ5678', 'Honda', 'Civic', 'Branco', 2020, '987.654.321-09');

INSERT INTO Chatbot (ID_Chatbot, Horario_Chat, Plano, Tipo_Chat, Cliente_CPF_Cliente)
VALUES ('CHAT001', TO_DATE('15/09/2024 10:30', 'DD/MM/YYYY HH24:MI'), 'Premium', 'A', '243.187.590-60');
INSERT INTO Chatbot (ID_Chatbot, Horario_Chat, Plano, Tipo_Chat, Cliente_CPF_Cliente)
VALUES ('CHAT002', TO_DATE('16/09/2024 11:00', 'DD/MM/YYYY HH24:MI'), 'B sico', 'T', '987.654.321-09');

INSERT INTO Pre_Diagnostico (ID_PreDiagnostico, Nivel_Diagnostico, Diagnostico, Assistente_ID_Chatbot, Cliente_CPF_Cliente)
VALUES ('DIAG001', 85, 'Diagn stico Completo', 'CHAT001', '243.187.590-60');
INSERT INTO Pre_Diagnostico (ID_PreDiagnostico, Nivel_Diagnostico, Diagnostico, Assistente_ID_Chatbot, Cliente_CPF_Cliente)
VALUES ('DIAG002', 60, 'Diagn stico Parcial', 'CHAT002', '987.654.321-09');

INSERT INTO Loja_Parceira (Endereco_Loja, Cnpj_Loja, Nome_Loja, Avaliacao_Loja, Especializacao_Loja)
VALUES ('Rua C, 789, S o Paulo, SP', '12.345.678/0001-90', 'Loja de Pe as S o Paulo', 9.5, 'Pe as Automotivas');
INSERT INTO Loja_Parceira (Endereco_Loja, Cnpj_Loja, Nome_Loja, Avaliacao_Loja, Especializacao_Loja)
VALUES ('Rua D, 101, Rio de Janeiro, RJ', '98.765.432/0001-10', 'Loja de Pe as Rio', 8.7, 'Pe as Automotivas');

INSERT INTO Oficina (Endereco_Oficina, Cnpj_Oficina, Nome_Oficina, Avaliacao_Oficina, Especializacao_Oficina, Chatbot_ID_Chatbot, Chatbot_Cliente_CPF_Cliente)
VALUES ('Rua E, 111, S o Paulo, SP', '23.456.789/0001-11', 'Oficina S o Paulo', 9.0, 'Mec nica Geral', 'CHAT001', '243.187.590-60');
INSERT INTO Oficina (Endereco_Oficina, Cnpj_Oficina, Nome_Oficina, Avaliacao_Oficina, Especializacao_Oficina, Chatbot_ID_Chatbot, Chatbot_Cliente_CPF_Cliente)
VALUES ('Rua F, 202, Rio de Janeiro, RJ', '87.654.321/0001-22', 'Oficina Rio', 8.2, 'Mec nica Geral', 'CHAT002', '987.654.321-09');

INSERT INTO Peca (ID_Peca, Tipo_Peca, Nome_Peca, Endereco_Peca, Loja_Parceira_Endereco_Loja)
VALUES (1, 'Filtro de  leo', 'Filtro 123', 'Rua G, 222, S o Paulo, SP', 'Rua C, 789, S o Paulo, SP');
INSERT INTO Peca (ID_Peca, Tipo_Peca, Nome_Peca, Endereco_Peca, Loja_Parceira_Endereco_Loja)
VALUES (2, 'Pneu', 'Pneu 456', 'Rua H, 333, Rio de Janeiro, RJ', 'Rua D, 101, Rio de Janeiro, RJ');

INSERT INTO Entrega (ID_Entrega, Data_Entrega, Destino_Entrega, Item_Entrega, Endereco_Loja)
VALUES ('ENT001', TO_DATE('17/09/2024', 'DD/MM/YYYY'), 'Rua A, 123, S o Paulo, SP', 'Filtro 123', 'Rua C, 789, S o Paulo, SP');
INSERT INTO Entrega (ID_Entrega, Data_Entrega, Destino_Entrega, Item_Entrega, Endereco_Loja)
VALUES ('ENT002', TO_DATE('18/09/2024', 'DD/MM/YYYY'), 'Rua B, 456, Rio de Janeiro, RJ', 'Pneu 456', 'Rua D, 101, Rio de Janeiro, RJ');

INSERT INTO Vincula (CPF_Cliente, ID_Chatbot, Endereco_Loja)
VALUES ('243.187.590-60', 'CHAT001', 'Rua C, 789, S o Paulo, SP');
INSERT INTO Vincula (CPF_Cliente, ID_Chatbot, Endereco_Loja)
VALUES ('987.654.321-09', 'CHAT002', 'Rua D, 101, Rio de Janeiro, RJ');



DROP TABLE Vincula CASCADE CONSTRAINTS;
DROP TABLE Entrega CASCADE CONSTRAINTS;
DROP TABLE Peca CASCADE CONSTRAINTS;
DROP TABLE Oficina CASCADE CONSTRAINTS;
DROP TABLE Loja_Parceira CASCADE CONSTRAINTS;
DROP TABLE Pre_Diagnostico CASCADE CONSTRAINTS;
DROP TABLE Chatbot CASCADE CONSTRAINTS;
DROP TABLE Automovel CASCADE CONSTRAINTS;
DROP TABLE Cliente CASCADE CONSTRAINTS;