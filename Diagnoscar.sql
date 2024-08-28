-- Tabela Cliente
CREATE TABLE Cliente (
    CPF_Cliente Varchar2(14) Primary Key Not Null,
    CNH_Cliente Number(11) Unique Not Null,
    Nome_Cliente Varchar2(100) Not Null,
    Sobrenome_Cliente Varchar2(100) Not Null,
    Email_Cliente Varchar2(100) Unique,
    Celular_Cliente Varchar2(15) Unique,
    Endereco Varchar2(200) Not Null,
    Constraint CHK_CPF_VALIDO CHECK (REGEXP_LIKE(CPF_Cliente, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$')),
    Constraint CHK_Celular_VALIDO CHECK (REGEXP_LIKE(Celular_Cliente, '^\(\d{2}\) \d{5}-\d{4}$')),
    Constraint CHK_Email_VALIDO CHECK (REGEXP_LIKE(Email_Cliente, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

-- Tabela Automovel
CREATE TABLE Automovel (
    Placa_Automovel Varchar2(7) Primary Key Not Null,
    Cliente_CPF_Cliente Varchar2(14),
    Marca_Automovel Varchar2 not null,
    Modelo_Automovel Varchar2(100),
    Ano_Automovel NUMBER(4),
    FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

-- Tabela Assistente
CREATE TABLE Assistente (
    ID_Chatbot Varchar2(1000) Primary Key Not Null,
    horario_chat_Chatbot DATE Not Null,
    Plano_Chatbot Varchar2(10) Not Null,
    Tipodechat_Chatbot CHAR(1) Not Null,
    Cliente_CPF_Cliente Varchar2(14),
    Constraint FK_CPF_Cliente FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente),
    Constraint UNQ_Cliente_CPF UNIQUE (Cliente_CPF_Cliente)
);

-- Tabela Loja_Parceira
CREATE TABLE Loja_Parceira (
    Endereco_Loja Varchar2(200) Primary Key Not Null,
    Nome_Loja Varchar2(100)
);

-- Tabela Pre_Diagnostico
CREATE TABLE Pre_Diagnostico (
    ID_PreDiagnostico NUMBER Primary Key Not Null,
    Diagnostico Varchar2(255),
    Assistente_ID_Chatbot Varchar2(1000),
    Constraint FK_Assistente FOREIGN KEY (Assistente_ID_Chatbot) REFERENCES Assistente(ID_Chatbot)
);

-- Tabela Peca
CREATE TABLE Peca (
    ID_Peca NUMBER Primary Key Not Null,
    Descricao_Peca Varchar2(100),
    Loja_Parceira_Endereco Varchar2(200),
    Constraint FK_Loja_Parceira FOREIGN KEY (Loja_Parceira_Endereco) REFERENCES Loja_Parceira(Endereco_Loja)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    ID NUMBER Primary Key Not Null,
    Loja_Parceira_Endereco Varchar2(200),
    Constraint FK_Entrega_Loja FOREIGN KEY (Loja_Parceira_Endereco) REFERENCES Loja_Parceira(Endereco_Loja)
);

-- Tabela Vincula
CREATE TABLE Vincula (
    Assistente_CPF_Cliente Varchar2(14),
    Loja_Parceira_Endereco Varchar2(200),
    Constraint FK_Vincula_Assistente FOREIGN KEY (Assistente_CPF_Cliente) REFERENCES Assistente(Cliente_CPF_Cliente),
    Constraint FK_Vincula_Loja FOREIGN KEY (Loja_Parceira_Endereco) REFERENCES Loja_Parceira(Endereco_Loja),
    Primary Key (Assistente_CPF_Cliente, Loja_Parceira_Endereco)
);


-- Inser��es para a Tabela Cliente
INSERT INTO Cliente 
VALUES ('539.371.598-60', 8672017436, 'Jo�o Gabriel', 'Boaventura Marques e Silva', 'joao.silva@gmail.com.br', '(11) 9936-5770', 'Rua das Flores, 123, S�o Paulo, SP');


-- Inser��es para a Tabela Automovel
INSERT INTO Automovel VALUES ('ABC1D23', '123.456.789-00', 'Fusca', 1980);

-- Inser��es para a Tabela Assistente
INSERT INTO Assistente VALUES ('chat123', SYSDATE, 'Premium', 'A', '123.456.789-00');

-- Inser��es para a Tabela Loja_Parceira
INSERT INTO Loja_Parceira VALUES ('Rua do Com�rcio, 456, S�o Paulo, SP', 'Loja do Mec�nico');

-- Inser��es para a Tabela Pre_Diagnostico
INSERT INTO Pre_Diagnostico VALUES (1, 'Problema no sistema de freios', 'chat123');

-- Inser��es para a Tabela Peca
INSERT INTO Peca VALUES (1, 'Pastilha de Freio', 'Rua do Com�rcio, 456, S�o Paulo, SP');

-- Inser��es para a Tabela Entrega
INSERT INTO Entrega VALUES (1, 'Rua do Com�rcio, 456, S�o Paulo, SP');

-- Inser��es para a Tabela Vincula
INSERT INTO Vincula VALUES ('123.456.789-00', 'Rua do Com�rcio, 456, S�o Paulo, SP');




DROP TABLE Vincula;
DROP TABLE Entrega;
DROP TABLE Peca;
DROP TABLE Pre_Diagnostico;
DROP TABLE Assistente;
DROP TABLE Automovel;
DROP TABLE Cliente;
DROP TABLE Loja_Parceira;
=======
DROP TABLE Cliente CASCADE ConstraintS;
DROP TABLE Automovel CASCADE ConstraintS;
DROP TABLE Assistente CASCADE ConstraintS;
DROP TABLE Loja_Parceira CASCADE ConstraintS;
DROP TABLE Pre_Diagnostico CASCADE ConstraintS;
DROP TABLE Peca CASCADE ConstraintS;
DROP TABLE Entrega CASCADE ConstraintS;
DROP TABLE Vincula CASCADE ConstraintS;
