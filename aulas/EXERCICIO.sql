-- 01.Criar a tabela CIDADE, conforme a especifica��o abaixo
CREATE TABLE CIDADE (
    Codigo INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL         
);

-- 02.Criar a tabela SOCIO, conforme a especifica��o abaixo.
CREATE TABLE SOCIO (
    CPF CHAR(11) NOT NULL PRIMARY KEY,
    Nome VARCHAR2(20) NOT NULL,
    DataNasc DATE NOT NULL,
    RG VARCHAR2(15) NOT NULL,
    Cidade INT NOT NULL,
    FOREIGN KEY (Cidade) REFERENCES CIDADE(Codigo)
);

-- 03. Alterar a tabela CIDADE para incluir nela o campo abaixo especificado
ALTER TABLE CIDADE ADD Uf CHAR(2) NOT NULL;
DESC CIDADE;

-- 04. Alterar a tabela S�CIO para incluir nela os campos abaixo especificados
ALTER TABLE SOCIO ADD Fone VARCHAR2(10);
ALTER TABLE SOCIO ADD Sexo CHAR(1);
DESC SOCIO;

-- 05. Alterar, na tabela S�CIO, o tipo do campo NOME para alfanum�rico de tamanho 35
ALTER TABLE SOCIO MODIFY Nome VARCHAR2(35);
DESC SOCIO;

-- 06. Criar a tabela SETOR, conforme a especifica��o abaixo
CREATE TABLE SETOR(
    Codigo number(3) PRIMARY KEY NOT NULL,
    Nome varchar2(30) not null
);

-- 07. Alterar a tabela S�CIO para incluir o campo abaixo especificado.
ALTER TABLE SOCIO ADD Setor NUMBER(3);
ALTER TABLE SOCIO ADD CONSTRAINT fk_setor FOREIGN KEY (Setor) REFERENCES SETOR(Codigo);
;

-- 08. Criar a tabela DEPENDENTE, conforme a especifica��o abaixo.
Create table DEPENDEDENTE(
    Socio CHAR not null,
    Numero number(4) primary key not null,
    Nome varchar2(30) not null,
    DataNasc date not null,
    FOREIGN KEY (Socio) REFERENCES Socio(CPF)
);

INSERT INTO CIDADE (Codigo, Nome, Uf) VALUES (1, 'S�o Paulo', 'SP');
INSERT INTO CIDADE (Codigo, Nome, Uf) VALUES (2, 'Rio de Janeiro', 'RJ');
INSERT INTO CIDADE (Codigo, Nome, Uf) VALUES (3, 'Belo Horizonte', 'MG');
INSERT INTO CIDADE (Codigo, Nome, Uf) VALUES (4, 'Porto Alegre', 'RS');

INSERT INTO SETOR (Codigo, Nome) VALUES (1, 'Financeiro');
INSERT INTO SETOR (Codigo, Nome) VALUES (2, 'Recursos Humanos');
INSERT INTO SETOR (Codigo, Nome) VALUES (3, 'Tecnologia');
INSERT INTO SETOR (Codigo, Nome) VALUES (4, 'Marketing');

INSERT INTO SOCIO (CPF, Nome, DataNasc, RG, Cidade, Setor) VALUES ('12345678901', 'Ana Silva', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'MG123456', 1, 1);
INSERT INTO SOCIO (CPF, Nome, DataNasc, RG, Cidade, Setor) VALUES ('23456789012', 'Carlos Oliveira', TO_DATE('1990-08-22', 'YYYY-MM-DD'), 'RJ234567', 2, 2);
INSERT INTO SOCIO (CPF, Nome, DataNasc, RG, Cidade, Setor) VALUES ('34567890123', 'Fernanda Santos', TO_DATE('1985-12-10', 'YYYY-MM-DD'), 'MG345678', 3, 3);
INSERT INTO SOCIO (CPF, Nome, DataNasc, RG, Cidade, Setor) VALUES ('45678901234', 'Jo�o Pereira', TO_DATE('1975-03-05', 'YYYY-MM-DD'), 'RS456789', 4, 4);

INSERT INTO DEPENDENTE (Socio, Numero, Nome, DataNasc) VALUES ('12345678901', 1, 'Lucas Silva', TO_DATE('2005-07-01', 'YYYY-MM-DD'));
INSERT INTO DEPENDENTE (Socio, Numero, Nome, DataNasc) VALUES ('12345678901', 2, 'Mariana Silva', TO_DATE('2007-11-25', 'YYYY-MM-DD'));
INSERT INTO DEPENDENTE (Socio, Numero, Nome, DataNasc) VALUES ('23456789012', 1, 'Pedro Oliveira', TO_DATE('2010-02-20', 'YYYY-MM-DD'));
INSERT INTO DEPENDENTE (Socio, Numero, Nome, DataNasc) VALUES ('34567890123', 1, 'J�lia Santos', TO_DATE('2008-09-30', 'YYYY-MM-DD'));
