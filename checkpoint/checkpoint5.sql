/*
João Gabriel Boaventura Marques e Silva RM554874
Lucas de Melo Pinho Pinheiro RM558791
1TDSB-2024
*/

DROP TABLE Aluno CASCADE CONSTRAINTS;
DROP TABLE Curso CASCADE CONSTRAINTS;

TRUNCATE TABLE Aluno;
TRUNCATE TABLE Curso;

--1
CREATE TABLE Aluno (
    Matricula NUMBER(4),
    PrimeiroNome VARCHAR2(50),
    SegundoNome VARCHAR2(50),
    UltimoNome VARCHAR2(50),
    DataNasci DATE,
    CPF VARCHAR2(14),
    RG VARCHAR2(12),
    Endereco VARCHAR2(100),
    CEP VARCHAR(9),
    Cidade VARCHAR(50),
    Fone VARCHAR(15),
    CodigoCurso NUMBER(6),
    DtMatricula DATE
);

CREATE TABLE Curso (
    CodCurso NUMBER(6),
    NomeCurso VARCHAR(100),
    Unidade VARCHAR(100)
);

--2
ALTER TABLE Aluno 
ADD CONSTRAINT PK_Matricula Primary Key (Matricula);

ALTER TABLE Curso 
ADD CONSTRAINT PK_CodCurso Primary Key (CodCurso);

ALTER TABLE Aluno
ADD CONSTRAINT FK_CodigoCurso FOREIGN KEY (CodigoCurso) 
REFERENCES Curso(CodCurso);

--3
INSERT ALL
    INTO Curso(CodCurso, NomeCurso, Unidade) VALUES (0001, 'Python', 'Mooca')
    INTO Curso(CodCurso, NomeCurso, Unidade) VALUES (0002, 'Java', 'Mooca')
    INTO Curso(CodCurso, NomeCurso, Unidade) VALUES (0003, 'SQL', 'Mooca')
    INTO Curso(CodCurso, NomeCurso, Unidade) VALUES (0004, 'React', 'Paes de Barros')
    INTO Curso(CodCurso, NomeCurso, Unidade) VALUES (0005, 'NodeJS', 'Paes de Barros')
select * from dual;
Select * from Curso;

insert into aluno values(0123,'Lucas','Antonio','Azevedo',TO_DATE('2005-03-11', 'YYYY-MM-DD'),'123.456.789-01','29.838.018-4','Rua dos Verdes 85', '87195-190','São Paulo','(11) 99724-2784','0001',SYSDATE);
insert into aluno values(9270,'Andre','Bernardo','Lima',TO_DATE('2003-12-21', 'YYYY-MM-DD'),'839.108.187-08','45.199.189-7','Rua Felicidade 13','Curitiba', '19874-360','1199029-1848','0002',SYSDATE);
insert into aluno values(1795,'Beatriz','Vitoria','Nascimento',TO_DATE('1985-09-02', 'YYYY-MM-DD'),'190.720.098-10','10.189.108-9','Rua Comodoro 188', '81948-172','Santa Isabel','1190285-1885','0003',SYSDATE);
insert into aluno values(1085,'Carol','Prado','Lima',TO_DATE('1998-11-01', 'YYYY-MM-DD'),'179.964.682-89','82.917.184-3','Rua da Mooca 99', '71994-671','Santa Maria','1192085-1908','0004',SYSDATE);
insert into aluno values(0370,'Mateus','Cicero','Nascimento',TO_DATE('1997-07-02', 'YYYY-MM-DD'),'398.239.786-98','13.187.098-2','Rua Travessuras 360', '91903-981','Santa Cecilia', '1190287-0286','0005',SYSDATE);
select * from Aluno;

--4
UPDATE Curso
SET Unidade = 'Tuiuti'
WHERE Unidade = 'Mooca';
Select * from Curso;

--5
SELECT PrimeiroNome, UltimoNome
FROM Aluno
ORDER BY UltimoNome;

--6
SELECT *
FROM Aluno
WHERE Cidade IN ('Santa Isabel', 'Curitiba', 'São Paulo')
ORDER BY Cidade;

--7
SELECT PrimeiroNome, UltimoNome
FROM Aluno
WHERE Matricula BETWEEN 100 AND 5000 
AND DataNasci BETWEEN TO_DATE('1980-01-01', 'YYYY-MM-DD') AND TO_DATE('1990-12-31', 'YYYY-MM-DD')
ORDER BY PrimeiroNome;


