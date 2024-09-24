--João Gabriel Boaventura Marques e Silva 554874
--Lucas de Melo Pinho Pinheiro 558791

-- 1-)
CREATE TABLE CATEGORIA (
    Codcateg number(4) Primary Key,
    Descricao varchar(50) NOT NULL
);

CREATE TABLE FILME (
    CodFilme number(4) Primary Key,
    Titulo varchar(70) NOT NULL,
    CodCat number(4),
    Foreign Key (CodCat) references CATEGORIA(Codcateg)
);

CREATE TABLE DVD (
    NumDVD number(4) Primary Key,
    Tipo CHAR(1),
    CodFilme number(4),
    Foreign Key (CodFilme) references FILME(CodFilme)
);

CREATE TABLE CLIENTE (
    CodCli number(4) Primary Key,
    Prenome varchar(50) NOT NULL,
    Sobrenome varchar(50),
    Endereco varchar(70),
    Telefone varchar(20)
);

CREATE TABLE ATOR (
    Codator number(4) Primary Key,
    Nome_popular varchar(50) NOT NULL,
    Nome_artistico varchar(50),
    Datanasc DATE
);

CREATE TABLE FILME_ATOR (
    CodFilme number(4),
    Codator number(4),
    Primary Key (CodFilme, Codator),
    Foreign Key (CodFilme) references FILME(CodFilme),
    Foreign Key (Codator) references ATOR(Codator)
);

CREATE TABLE LOCACAO (
    CodLocacao number(4) Primary Key,
    CodCli number(4),
    NumDVD number(4),
    DataLocacao DATE,
    DataDevolucao DATE,
    Foreign Key (CodCli) references CLIENTE(CodCli),
    Foreign Key (NumDVD) references DVD(NumDVD)
);


CREATE TABLE Classifica (
    CodFilme number(4),
    CodCat number(4),
    Primary Key (CodFilme, CodCat),
    Foreign Key (CodFilme) references FILME(CodFilme),
    Foreign Key (CodCat) references CATEGORIA(Codcateg)
);

----------------------------------------------------------------------------
-- 2-)
insert into CATEGORIA (Codcateg, Descricao) values (1, 'Com�dia');
insert into CATEGORIA (Codcateg, Descricao) values (2, 'Drama');
insert into CATEGORIA (Codcateg, Descricao) values (3, 'Aventura');
insert into CATEGORIA (Codcateg, Descricao) values (4, 'Terror');

insert into FILME (CodFilme, Titulo, CodCat) values (1, 'Sai pra l�', 1);
insert into FILME (CodFilme, Titulo, CodCat) values (2, 'Ajuda Eterna', 2);
insert into FILME (CodFilme, Titulo, CodCat) values (3, 'Anjos Malditos', 2);
insert into FILME (CodFilme, Titulo, CodCat) values (4, 'P�nico II', 4);
insert into FILME (CodFilme, Titulo, CodCat) values (5, 'Um dia de furia', 3);
insert into FILME (CodFilme, Titulo, CodCat) values (6, 'Lente Cega', 3);
insert into FILME (CodFilme, Titulo, CodCat) values (7, 'Sinais do Tempo', 2);
insert into FILME (CodFilme, Titulo, CodCat) values (8, 'A melodia da vida', 1);

insert into CLIENTE (CodCli, Prenome, Sobrenome, Endereco, Telefone) values (1, 'Jo�o', 'Silva', 'Rua da Cruz sem P�', '4444-1111');
insert into CLIENTE (CodCli, Prenome, Sobrenome, Endereco, Telefone) values (2, 'Ant�nio', 'Ferreira', 'Av. da Vila Velha', '6660-9333');
insert into CLIENTE (CodCli, Prenome, Sobrenome, Endereco, Telefone) values (3, 'Fabio', 'Dias', 'Rua Antonio Vieira', '2337-0393');
insert into CLIENTE (CodCli, Prenome, Sobrenome, Endereco, Telefone) values (4, 'Andreia', 'Melo', 'Rua da Praia Bonita', '8989-7777');
insert into CLIENTE (CodCli, Prenome, Sobrenome, Endereco, Telefone) values (5, 'Murilo', 'Fontes', 'Av. dos Autonomistas', '9090-9090');

insert into DVD (NumDVD, CodFilme, Tipo) values (1, 1, 'S');
insert into DVD (NumDVD, CodFilme, Tipo) values (2, 1, 'S');
insert into DVD (NumDVD, CodFilme, Tipo) values (3, 1, 'S');
insert into DVD (NumDVD, CodFilme, Tipo) values (4, 2, 'D');
insert into DVD (NumDVD, CodFilme, Tipo) values (5, 3, 'S');
-----------------------------------------------------

-- 3-)
insert into CATEGORIA (Codcateg, Descricao) values (8, 'Com�dia');
update FILME SET CodCat = 8 where CodCat = 1;
delete from CATEGORIA where Codcateg = 1;

-- 4-)
ALTER table FILME ADD Sinopse varchar(300);

-- 5-)
insert into CATEGORIA (Codcateg, Descricao) values (5, 'Fic��o');

-- 6-)
delete from DVD where CodFilme IN (
    SELECT CodFilme FROM FILME where Titulo IN ('Anjos Malditos', 'A melodia da vida')
);
delete from FILME where Titulo IN ('Anjos Malditos', 'A melodia da vida');

-------------------------------------------------------
DROP TABLE ATOR CASCADE CONSTRAINTS;
DROP TABLE FILME CASCADE CONSTRAINTS;
DROP TABLE CATEGORIA CASCADE CONSTRAINTS;
DROP TABLE CLASSIFICA CASCADE CONSTRAINTS;
DROP TABLE CLIENTE CASCADE CONSTRAINTS;
DROP TABLE DVD CASCADE CONSTRAINTS;
DROP TABLE LOCACAO CASCADE CONSTRAINTS;
DROP TABLE FILME_ATOR CASCADE CONSTRAINTS;







    