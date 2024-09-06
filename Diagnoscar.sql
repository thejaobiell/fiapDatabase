-- Tabela Cliente
CREATE TABLE Cliente (
    CPF_Cliente VARCHAR2(14) PRIMARY KEY NOT NULL,
    CNH_Cliente NUMBER(11) UNIQUE NOT NULL,
    Nome_Cliente VARCHAR2(100) NOT NULL,
    Sobrenome_Cliente VARCHAR2(100) NOT NULL,
    Email_Cliente VARCHAR2(100) UNIQUE,
    Telefone_Cliente VARCHAR2(15) UNIQUE,
    Endereco_Cliente VARCHAR2(200) NOT NULL,
    CONSTRAINT CHK_CPF_VALIDO CHECK (REGEXP_LIKE(CPF_Cliente, '^[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}$')),
    CONSTRAINT CHK_Telefone_VALIDO CHECK (REGEXP_LIKE(Telefone_Cliente, '^\(\d{2}\) \d{5}-\d{4}$')),
    CONSTRAINT CHK_Email_VALIDO CHECK (REGEXP_LIKE(Email_Cliente, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')),
    CONSTRAINT Cliente_PK PRIMARY KEY (CPF_Cliente)
);

-- Tabela Automovel
CREATE TABLE Automovel (
    Placa_Automovel VARCHAR2(7) PRIMARY KEY NOT NULL,
    Marca_Automovel VARCHAR2(20) NOT NULL, 
    Modelo_Automovel VARCHAR2(100) NOT NULL,
    Cor_Automovel VARCHAR2(15) NOT NULL,
    Ano_Automovel NUMBER(4) NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14),
    CONSTRAINT Automovel_PK PRIMARY KEY (Placa_Automovel),
    CONSTRAINT chk_marca CHECK (Marca_Automovel IN ('Toyota', 'Honda', 'Ford', 'Chevrolet', 'Nissan', 'Volkswagen', 'Hyundai', 'Kia', 'BMW', 'Mercedes-Benz','Audi', 'Jeep', 'Subaru', 'Mazda', 'Fiat', 'Renault', 'Peugeot', 'Mitsubishi', 'Volvo', 'Land Rover')),
    CONSTRAINT Automovel_Cliente_FK FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

-- Tabela Chatbot
CREATE TABLE Chatbot(
    ID_Chatbot VARCHAR2(1000) NOT NULL,
    Horario_Chat_Chatbot DATE NOT NULL,
    Plano_Chatbot VARCHAR2(10) NOT NULL,
    Tipodechat_Chatbot VARCHAR2(1) NOT NULL,
    Cliente_CPF_Cliente VARCHAR2(14),
    CONSTRAINT Chatbot_PK PRIMARY KEY (ID_Chatbot, Cliente_CPF_Cliente),
    CONSTRAINT Chatbot_Cliente_FK FOREIGN KEY (Cliente_CPF_Cliente) REFERENCES Cliente(CPF_Cliente)
);

-- Tabela Pre_Diagnostico
CREATE TABLE Pre_Diagnostico (
    ID_PreDiagnostico VARCHAR(1000) NOT NULL,
    Nivel_Diagnostico NUMBER(3) CHECK (Nivel_Diagnostico >= 1 AND Nivel_Diagnostico <= 100), 
    Diagnostico VARCHAR2(500) NOT NULL,
    Assistente_ID_Chatbot VARCHAR2(1000) NOT NULL,
    CONSTRAINT PreDiagnostico_PK PRIMARY KEY (ID_PreDiagnostico),
    CONSTRAINT PreDiagnostico_Chatbot_FK FOREIGN KEY (Chatbot_ID_Chatbot) REFERENCES Chatbot(ID_Chatbot)
);

-- Tabela Loja_Parceira
CREATE TABLE Loja_Parceira (
    Endereco_Loja VARCHAR2(200) PRIMARY KEY NOT NULL,
    Cnpj_Loja VARCHAR2(18) NOT NULL UNIQUE,
    Nome_Loja VARCHAR2(120) NOT NULL,
    Avaliacao_Loja NUMBER(3, 2),
    Especializacao_Loja VARCHAR2(50) NOT NULL,
    CONSTRAINT Cnpj_Loja_Check CHECK (REGEXP_LIKE(Cnpj_Loja, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}$'))
);

-- Tabela Oficina
CREATE TABLE Oficina (
    Endereco_Oficina VARCHAR2(200) PRIMARY KEY NOT NULL,
    Cnpj_Oficina VARCHAR2(18) NOT NULL UNIQUE,
    Nome_Oficina VARCHAR2(120) NOT NULL,
    Avaliacao_Oficina NUMBER(3, 2),
    Especializacao_Oficina VARCHAR2(50) NOT NULL,
    CONSTRAINT Cnpj_Oficina_Check CHECK (REGEXP_LIKE(Cnpj_Oficina, '^[0-9]{2}\.[0-9]{3}\.[0-9]{3}/[0-9]{4}-[0-9]{2}$'))
);

-- Tabela Peca
CREATE TABLE Peca (
    Id_Peca NUMBER PRIMARY KEY NOT NULL,
    Tipo_Peca VARCHAR2(30) NOT NULL UNIQUE,
    Nome_Peca VARCHAR2(40) NOT NULL,
    Endereco_Loja VARCHAR2(200)NOT NULL,
    CONSTRAINT Peca_Loja_Parceira_FK FOREIGN KEY (Endereco_Loja) REFERENCES Loja_Parceira(Endereco_Loja)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    Id_Entrega VARCHAR2(100) PRIMARY KEY NOT NULL,
    Data_Entrega DATE NOT NULL,
    Destino_Entrega VARCHAR2(200)NOT NULL,
    Item_Entrega VARCHAR2(100) NOT NULL,
    Endereco_Loja VARCHAR2(200) NOT NULL,
    CONSTRAINT Entrega_Loja_Parceira_FK FOREIGN KEY (Endereco_Loja) REFERENCES Loja_Parceira(Endereco_Loja)
);

-- Tabela Vincula
CREATE TABLE Vincula (
    CPF_Cliente VARCHAR2(14) NOT NULL,
    ID_Chatbot VARCHAR2(1000) NOT NULL,
    Endereco_Loja VARCHAR2(200),
    CONSTRAINT Vincula_PK PRIMARY KEY (CPF_Cliente, ID_Chatbot, Endereco_Loja),
    CONSTRAINT Vincula_Assistente_FK FOREIGN KEY (CPF_Cliente, ID_Chatbot) REFERENCES Chatbot(CPF_Cliente, ID_Chatbot),
    CONSTRAINT Vincula_Loja_Parceira_FK FOREIGN KEY (Endereco_Loja) REFERENCES Loja_Parceira(Endereco_Loja)
);


-- Comandos de DROP TABLE
DROP TABLE Cliente CASCADE CONSTRAINTS;
DROP TABLE Automovel CASCADE CONSTRAINTS;
DROP TABLE Assistente CASCADE CONSTRAINTS;
DROP TABLE Oficina CASCADE CONSTRAINTS;
DROP TABLE Loja_Parceira CASCADE CONSTRAINTS;
DROP TABLE Pre_Diagnostico CASCADE CONSTRAINTS;
DROP TABLE Peca CASCADE CONSTRAINTS;
DROP TABLE Entrega CASCADE CONSTRAINTS;
DROP TABLE Vincula CASCADE CONSTRAINTS;