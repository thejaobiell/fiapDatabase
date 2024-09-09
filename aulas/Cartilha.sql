-- Data Definition Language (DDL) - Definição de Estruturas

-- CREATE TABLE: Cria uma nova tabela.
CREATE TABLE produto (
    id_produto NUMBER(5) PRIMARY KEY,
    nome_produto VARCHAR(50) NOT NULL,
    preco NUMBER(8,2) NOT NULL,
    data_lancamento DATE
);

-- ALTER: Modifica a estrutura de tabelas existentes.
-- Adicionar uma nova coluna
ALTER TABLE produto
ADD categoria VARCHAR(30);

-- Modificar o tipo de dado de uma coluna existente
ALTER TABLE produto
MODIFY preco NUMBER(10,2);

-- Remover uma coluna existente
ALTER TABLE produto
DROP COLUMN categoria;

-- Renomear uma coluna existente
ALTER TABLE produto
RENAME COLUMN nome_produto TO descricao_produto;

-- DROP: Remove tabelas do banco de dados.
DROP TABLE produto;

-- Tipos de Dados e Restrições
-- NUMBER(p, s): Numérico com precisão e escala (ex.: NUMBER(10,2)).
-- VARCHAR(n): Cadeia de caracteres com comprimento variável (ex.: VARCHAR(30)).
-- CHAR(n): Cadeia de caracteres com comprimento fixo (ex.: CHAR(1)).
-- DATE: Tipo de dado para datas.
-- PRIMARY KEY: Identifica exclusivamente cada linha na tabela.
-- FOREIGN KEY: Cria uma relação com outra tabela.
-- NOT NULL: Garante que a coluna não aceita valores nulos.
-- UNIQUE: Garante que todos os valores na coluna são únicos.

-- Exemplos de Criação de Tabelas
-- Tabela funcionario:
CREATE TABLE funcionario (
    id_funcionario NUMBER(4) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL,
    salario NUMBER(10,2),
    sexo CHAR(1) NOT NULL
);

-- Tabela cargo com restrições:
CREATE TABLE cargo (
    id_cargo NUMBER(4) PRIMARY KEY,
    nome_cargo VARCHAR(25) NOT NULL UNIQUE,
    salario NUMBER(10,2)
);

-- Tabela funcionario_2024 com Foreign Key:
CREATE TABLE funcionario_2024 (
    id_funcionario NUMBER(4) PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    data_admissao DATE NOT NULL,
    salario NUMBER(10,2),
    sexo CHAR(1) NOT NULL,
    fk_cargo NUMBER(4),
    FOREIGN KEY (fk_cargo) REFERENCES cargo(id_cargo)
);

--------------------------

-- Data Manipulation Language (DML) - Manipulação de Dados

-- Inserir Dados:
-- Inserir Linha:
INSERT INTO cargo (id_cargo, nome_cargo, salario) VALUES (1, 'Programador JAVA', 10000);
INSERT INTO cargo (id_cargo, nome_cargo) VALUES (2, 'DBA');

-- Modificar e Apagar Dados:

-- Modificar Dados:
UPDATE funcionario
SET salario = 3000
WHERE id_funcionario = 1;

-- Apagar Dados:
DELETE FROM funcionario
WHERE id_funcionario = 2;

-- Confirmar Transações:
-- Commit: Salva todas as alterações feitas na sessão atual.
COMMIT;

--------------------------

-- Alteração de Estrutura de Tabelas (DML)

-- Adicionar Coluna:
ALTER TABLE funcionario ADD email VARCHAR(50);

-- Modificar Coluna:
ALTER TABLE funcionario MODIFY salario NUMBER(12,2);

-- Excluir Coluna:
ALTER TABLE funcionario DROP COLUMN email;

-- Renomear Coluna:
ALTER TABLE funcionario RENAME COLUMN nome TO nome_completo;

-- Exemplos de Alteração:

-- Adicionar e remover coluna, chave primária:
ALTER TABLE teste ADD codigo NUMBER(4);
ALTER TABLE teste ADD CONSTRAINT teste_pk PRIMARY KEY (codigo);
ALTER TABLE teste DROP COLUMN codigo;

--------------------------

-- Operadores SQL

-- Aritméticos: +, -, *, /, ()
-- Relacionais: >, >=, <, <=, =, <> ou !=
-- Lógicos: AND, OR, NOT

-- Atualização de Dados (UPDATE)

-- Sintaxe Básica:
UPDATE nomeTabela
SET nomeColuna = novo_valor
WHERE condição;    

-- Exemplos:

-- Atualizar o salário do cargo 'Estágio':
UPDATE cargo
SET salario = 3000
WHERE nome_cargo = 'Estágio';
COMMIT;

-- Aumentar o salário de todos os cargos em 10%:
UPDATE cargo
SET salario = salario * 1.1;
COMMIT;

-- Trocar o nome de um dos Funcionários para 'Marciel':
UPDATE funcionario_2024
SET nome = 'Marciel'
WHERE id_funcionario = 1;
COMMIT;

-- Atualizar os valores da coluna sexo:
-- Primeiro, altere o tipo de dado da coluna:
ALTER TABLE funcionario_2024 MODIFY sexo VARCHAR2(9);

-- Atualizar os valores:
UPDATE funcionario_2024
SET sexo = CASE
    WHEN sexo = 'M' THEN 'Masculino'
    WHEN sexo = 'F' THEN 'Feminino'
END;
COMMIT;

-- Atualizar salários para cargos com salários entre R$5.000 e R$15.000:
UPDATE cargo
SET salario = 2500
WHERE salario > 5000 AND salario < 15000;
ROLLBACK;  -- Reverte a atualização
SELECT * FROM cargo;
COMMIT;  -- Salva alterações se necessário

--------------------------

-- Remoção de Dados (DELETE)
-- Sintaxe Básica:
DELETE FROM nomeTabela
WHERE condição;
    
-- Exemplos:
-- Apagar dados do funcionário 'Marciel':
DELETE FROM funcionario_2024
WHERE nome = 'Marciel';
COMMIT;

-- Excluir todos os dados da tabela cargo (não funciona se há FK):
DELETE FROM cargo;

-- Observação: Para apagar uma tabela com chaves estrangeiras (FK),
-- pode ser necessário:
-- 1. Remover as restrições FK primeiro.
-- 2. Excluir a tabela.

-- Nota Importante: Ao usar o comando DELETE, sempre faça um COMMIT para salvar 
-- as alterações ou um ROLLBACK para reverter as mudanças se necessário.
