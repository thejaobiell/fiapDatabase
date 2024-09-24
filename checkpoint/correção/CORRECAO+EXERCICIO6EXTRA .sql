-- João Gabriel Boaventura Marques e Silva 554874

-- 1-)
CREATE TABLE categoria (
    Codcateg number(4) primary key,
    Descricao varchar(50) not null
);

CREATE TABLE cliente (
    CodCli number(4) Primary Key,
    Prenome varchar(50) NOT NULL,
    Sobrenome varchar(50),
    Endereco varchar(70),
    Telefone varchar(20)
);

CREATE TABLE ator (
    Codator number(4) Primary Key,
    Nome_popular varchar(50) NOT NULL,
    Nome_artistico varchar(50),
    Datanasc DATE
);

CREATE TABLE filme (
    Codfilme number(4) Primary Key,
    Titulo varchar(70) NOT NULL,
    codcat number(4) REFERENCES categoria(Codcateg)
);

CREATE TABLE dvd (
    NumDVD number(4) Primary Key,
    Tipo CHAR(1),
    codfilme number(4) REFERENCES filme(Codfilme)
);

CREATE TABLE filme_ator (
    codator number(4) REFERENCES ator(Codator),
    codfilme number(4) REFERENCES filme(Codfilme)
);

CREATE TABLE locacao (
    codclie number(4) REFERENCES cliente(CodCli),
    numdvd number(4) REFERENCES dvd(NumDVD), 
    dataret DATE, 
    datadev DATE
);


---------------------------------------------------
-- 2-)

INSERT INTO categoria (codcateg, descricao) VALUES (1, 'Comédia');
INSERT INTO categoria (codcateg, descricao) VALUES (2, 'Drama');
INSERT INTO categoria (codcateg, descricao) VALUES (3, 'Aventura');
INSERT INTO categoria (codcateg, descricao) VALUES (4, 'Terror');

INSERT INTO filme (codfilme, titulo, codcat) VALUES (1, 'Sai pra lá', 1);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (2, 'Ajuda Eterna', 2);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (3, 'Anjos Malditos', 2);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (4, 'Pânico II', 4);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (5, 'Um dia de furia', 3);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (6, 'Lente Cega', 3);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (7, 'Sinais do Tempo', 2);
INSERT INTO filme (codfilme, titulo, codcat) VALUES (8, 'A melodia da vida', 1);

INSERT INTO cliente (codcli, prenome, sobrenome, endereco, telefone) VALUES (1, 'João', 'Silva', 'Rua da Cruz sem Pé', '4444-1111');
INSERT INTO cliente (codcli, prenome, sobrenome, endereco, telefone) VALUES (2, 'Antônio', 'Ferreira', 'Av. da Vila Velha', '6660-9333');
INSERT INTO cliente (codcli, prenome, sobrenome, endereco, telefone) VALUES (3, 'Fabio', 'Dias', 'Rua Antonio Vieira', '2337-0393');
INSERT INTO cliente (codcli, prenome, sobrenome, endereco, telefone) VALUES (4, 'Andreia', 'Melo', 'Rua da Praia Bonita', '8989-7777');
INSERT INTO cliente (codcli, prenome, sobrenome, endereco, telefone) VALUES (5, 'Murilo', 'Fontes', 'Av. dos Autonomistas', '9090-9090');

INSERT INTO dvd (numdvd, codfilme, tipo) VALUES (1, 1, 'S');
INSERT INTO dvd (numdvd, codfilme, tipo) VALUES (2, 1, 'S');
INSERT INTO dvd (numdvd, codfilme, tipo) VALUES (3, 1, 'S');
INSERT INTO dvd (numdvd, codfilme, tipo) VALUES (4, 2, 'D');
INSERT INTO dvd (numdvd, codfilme, tipo) VALUES (5, 3, 'S');

INSERT INTO locacao values (1,1, '05-jan-84','07-jan-84');
INSERT INTO locacao values (2,2, '13-jun-00','15-jun-00');
INSERT INTO locacao values (3,3, '22-oct-22','24-oct-22');

-------------------------------------------------------
-- 3-)

SELECT * FROM filme;
UPDATE filme SET codcat = NULL WHERE codcat = 1;

SELECT * FROM categoria;
UPDATE filme SET codcat = 8 WHERE codcat = NULL;

UPDATE categoria SET codcateg = 8 WHERE codcateg = 1;
UPDATE filme SET codcat = 8 WHERE codcat IS NULL;

-------------------------------------------------------

-- 4-)
alter table filme add sinopse varchar(300);

-------------------------------------------------------

-- 5-)
insert into categoria values (5, 'Ficção');

-------------------------------------------------------

-- 6-) EXERCICIO DE PONTO EXTRA

delete from DVD where CodFilme IN (SELECT CodFilme FROM filme where Titulo IN ('Anjos Malditos', 'A melodia da vida'));
delete from filme where Titulo IN ('Anjos Malditos', 'A melodia da vida');

select * from filme;
select * from dvd;

-------------------------------------------------------
DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE dvd CASCADE CONSTRAINTS;
DROP TABLE filme CASCADE CONSTRAINTS;
DROP TABLE ator CASCADE CONSTRAINTS;
DROP TABLE categoria CASCADE CONSTRAINTS;
DROP TABLE filme_ator CASCADE CONSTRAINTS;
DROP TABLE locacao CASCADE CONSTRAINTS;
