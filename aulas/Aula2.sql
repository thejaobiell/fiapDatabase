-- Aula 2 - 27/08

references é a criação da foreign key(fk) ou chave estrangeira  
Create table pessoa1(
    cod_pess1 number(3) primary key,
    nm_pess1 varchar(30) not null);
Create table pessoa2 (
    cod_pess2 number(3) primary key,
    nm_pess2 varchar(30) not null,
    fk_pess number(3) unique references pessoa1);
    
-- ------------------------------------- --

DML - Alteração de estrutura - tabela

Sintaxe: alter table NomeDaTabela...
Variações: 
    incluir coluna: add ColunaNome
    incluir constraint(regra): add constraint ConstraintNome
    modificar tipo de dados: modify ColunaNome TipoDeDado(Tamanho)
    modificar tamanho: modify ColunaNome TipoDeDado(Tamanho)
    apagar coluna: drop column ColunaNome
    apagar constraint: drop constraint NomeConstraint
    renomear coluna: rename column ColunaAntiga to ColunaNova


-- ------------------------------------- --

-- Apaga a tabela 'teste' juntamente com todas as suas restrições
DROP TABLE teste CASCADE CONSTRAINTS;

-- Cria uma nova tabela 'teste' com uma coluna 'nome' do tipo NUMBER(4)
CREATE TABLE teste (
    nome NUMBER(4)
);

-- Adiciona uma nova coluna 'codigo' do tipo NUMBER(4) na tabela 'teste'
ALTER TABLE teste ADD codigo NUMBER(4);

-- Adiciona uma chave primária à coluna 'codigo'
ALTER TABLE teste ADD CONSTRAINT teste_cd_pk PRIMARY KEY (codigo);

-- OU (alternativa)
ALTER TABLE teste ADD PRIMARY KEY (codigo);

-- Altera o tipo de dados da coluna 'nome' para VARCHAR2(30)
ALTER TABLE teste MODIFY nome VARCHAR2(30);

-- Altera o tamanho da coluna 'nome' para 45 posições
ALTER TABLE teste MODIFY nome VARCHAR2(45);

-- Remove a chave primária da coluna 'codigo'
ALTER TABLE teste DROP CONSTRAINT teste_cd_pk;

-- Remove a coluna 'codigo' da tabela 'teste'
ALTER TABLE teste DROP COLUMN codigo;

-- Renomeia a coluna 'nome' para 'nome_cliente'
ALTER TABLE teste RENAME COLUMN nome TO nome_cliente;

-- Adiciona a regra NOT NULL à coluna 'nome_cliente'
ALTER TABLE teste MODIFY nome_cliente VARCHAR2(45) NOT NULL;

-- Nota: Atenção ao tipo de dados na regra NOT NULL
ALTER TABLE teste MODIFY nome_cliente VARCHAR2(45) NOT NULL;

-- ------------------------------------- --

DML - Data Manupulation Language - Dados

Novas linhas
sintaxe: insert into NomeDaTabela values(valorColuna1, ......., valorColunaN);
         insert into NomeDaTabela (valorColuna1, ......., valorColunaN);
         values (valorColuna1, ......., valorColunaN);
         
usando nulo  null;
dados não numéricos precisam de ''

Exemplo:
CREATE TABLE cargo (
    cd_cargo NUMBER(4) CONSTRAINT cargo_cd_pk1 PRIMARY KEY,       
    nm_cargo VARCHAR(25) CONSTRAINT cargo_nm_nn1 NOT NULL         
                         CONSTRAINT cargo_nm_uk1 UNIQUE,          
    salario  NUMBER(10,2)                                        
);

desc cargo;
insert into cargo values(1, 'prog. JAVA', 10000);
select * from cargo;

insert into cargo values(2, 'DBA', 12580.00);
select * from cargo;

incluir os seguintes dados na tablea cargo
3 - CEO - 25000
4 - Adm Redes - 8500
5 - Estágio -  3300

insert into cargo values(3, 'CEO', 25000);
insert into cargo values(4, 'Adm Redes', 8500);
insert into cargo values(5, 'Estágio', 3300);
select * from cargo;

caso não tenha dados para uma ou mais colunas??????
6 -  Adm. Seg - null
/* versão 1*/:insert into cargo values(6, 'Adm. Seg', null);
/* versão 2*/:insert into cargo (cd_cargo, nm_cargo) values(7,'Adm. Seg2')
select * from cargo

validando os dados
commit

-- Inserir 3 linhas de dados na tabela funcionário a seu critério
CREATE TABLE funcionario_2024 (
    mat_fun NUMBER(4) CONSTRAINT func_mat_pk PRIMARY KEY,          
    nm_fun  VARCHAR(30) CONSTRAINT func_nm_nn NOT NULL,           
    dt_adm  DATE CONSTRAINT func_dt_nn NOT NULL,                   
    salario NUMBER(10,2),                                         
    sexo    CHAR(1) CONSTRAINT func_sx_nn NOT NULL,                
    fk_cargo NUMBER(4) CONSTRAINT func_cargo_fk REFERENCES cargo  
);

desc funcionario_2024;
select sysdate from dual;
INSERT INTO funcionario_2024 VALUES(0001, 'João', SYSDATE, NULL, 'M', 6);
INSERT INTO funcionario_2024 VALUES(0002, 'Guilherme', '10-JAN-22', 100000, 'M', 6);
INSERT INTO funcionario_2024 VALUES(0003, 'Felipe', '22-DEC-24', 15000, 'M', 6);

select * from funcionario_2024
