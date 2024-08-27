-- Aula 1 - 20/08

-- Parte 1 - COMANDOS DDL (Data Definition Language)

-- DDL (Data Definition Language) é um conjunto de comandos SQL
-- utilizados para definir a estrutura do banco de dados,
-- como criar ou modificar tabelas.

-- Comandos DDL:
-- CREATE  - Cria novas tabelas no banco de dados.
-- ALTER   - Altera a estrutura de tabelas já existentes.
-- DROP    - Apaga tabelas do banco de dados.

--SINTAXE
/*Create table NomeDaTabela(
    NomeColuna1 TipoDeDado(Tamanho) [constraint],
    NomeColuna2 TipoDeDado(Tamanho) [constraint]
    ......................);*/

-- Exemplo de Estrutura de Tabela: Funcionario
-- Tabela: Funcionario
--     mat_fun - N - 4 - PK       -- Número do funcionário (Primary Key)
--     nm_fun  - A - 30 - NN      -- Nome do funcionário (Not Null)
--     dt_adm  - D - NN           -- Data de admissão (Not Null)
--     salario - N - 10,2         -- Salário do funcionário
--     sexo    - C - 1 - NN       -- Sexo do funcionário (Not Null)

-- N: Numérico
-- A: Alfanumérico (String)
-- D: Data
-- C: Caractere
-- PK: Chave Primária
-- NN: Not Null (Não Nulo)

-- Criando a Tabela Funcionario
CREATE TABLE funcionario (
    mat_fun NUMBER(4) PRIMARY KEY,      -- Chave primária
    nm_fun  VARCHAR(30) NOT NULL,       -- Nome do funcionário, campo obrigatório
    dt_adm  DATE NOT NULL,              -- Data de admissão, campo obrigatório
    salario NUMBER(10,2),               -- Salário com até 10 dígitos, 2 casas decimais
    sexo    CHAR(1) NOT NULL            -- Sexo do funcionário, campo obrigatório
);

-- Exibindo a estrutura da tabela funcionario
DESC funcionario;

-- Criando a Tabela funcionario_2024 com Restrições Nomeadas
CREATE TABLE funcionario_2024 (
    mat_fun NUMBER(4) CONSTRAINT func_mat_pk PRIMARY KEY,        -- Chave primária com nome personalizado
    nm_fun  VARCHAR(30) CONSTRAINT func_nm_nn NOT NULL,          -- Nome do funcionário, campo obrigatório
    dt_adm  DATE CONSTRAINT func_dt_nn NOT NULL,                 -- Data de admissão, campo obrigatório
    salario NUMBER(10,2),                                        -- Salário com até 10 dígitos, 2 casas decimais
    sexo    CHAR(1) CONSTRAINT func_sx_nn NOT NULL               -- Sexo do funcionário, campo obrigatório
);

-- Criando a Tabela cargo
CREATE TABLE cargo (
    cd_cargo NUMBER(4) CONSTRAINT cargo_cd_pk1 PRIMARY KEY,       -- Chave primária
    nm_cargo VARCHAR(25) CONSTRAINT cargo_nm_nn1 NOT NULL         -- Nome do cargo, campo obrigatório
                         CONSTRAINT cargo_nm_uk1 UNIQUE,          -- Nome do cargo, campo único
    salario  NUMBER(10,2)                                         -- Salário com até 10 dígitos, 2 casas decimais
);

-- Apagando a Tabela funcionario_2024
DROP TABLE funcionario_2024;

-- Recriando a Tabela funcionario_2024 com uma Foreign Key (FK)
CREATE TABLE funcionario_2024 (
    mat_fun NUMBER(4) CONSTRAINT func_mat_pk PRIMARY KEY,          -- Chave primária
    nm_fun  VARCHAR(30) CONSTRAINT func_nm_nn NOT NULL,            -- Nome do funcionário, campo obrigatório
    dt_adm  DATE CONSTRAINT func_dt_nn NOT NULL,                   -- Data de admissão, campo obrigatório
    salario NUMBER(10,2),                                          -- Salário com até 10 dígitos, 2 casas decimais
    sexo    CHAR(1) CONSTRAINT func_sx_nn NOT NULL,                -- Sexo do funcionário, campo obrigatório
    fk_cargo NUMBER(4) CONSTRAINT func_cargo_fk REFERENCES cargo   -- Chave estrangeira referenciando cargo
);


CREATE TABLE EXERCICIO_CURSO (
    cd_curso NUMBER(3)   CONSTRAINT curso_cd_pk PRIMARY KEY,        
    nm_curso VARCHAR(30) CONSTRAINT curso_nm_nn NOT NULL           
                         CONSTRAINT curso_nm_uk UNIQUE,          
    preco    NUMBER(6,2) CONSTRAINT curso_preco_nn NOT NULL        
);

CREATE TABLE EXERCICIO_DISCIPLINA (
    cd_disc    NUMBER(4)   CONSTRAINT disciplina_cd_disc PRIMARY KEY,
    nm_disc    VARCHAR(30) CONSTRAINT disciplina_nm_disc NOT NULL
                           CONSTRAINT disciplina_nm_uk UNIQUE,
    carga_hora number(4)   CONSTRAINT disciplina_carga_hora NOT NULL
);

