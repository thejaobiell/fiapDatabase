-- Aula 2 - 27/08

references � a cria��o da foreign key(fk) ou chave estrangeira  
Create table pessoa1(
    cod_pess1 number(3) primary key,
    nm_pess1 varchar(30) not null);
Create table pessoa2 (
    cod_pess2 number(3) primary key,
    nm_pess2 varchar(30) not null,
    fk_pess number(3) unique references pessoa1);
    
-- ------------------------------------- --

DML - Altera��o de estrutura - tabela

Sintaxe: alter table NomeDaTabela...
Varia��es: 
    incluir coluna: add ColunaNome
    incluir constraint(regra): add constraint ConstraintNome
    modificar tipo de dados: modify ColunaNome TipoDeDado(Tamanho)
    modificar tamanho: modify ColunaNome TipoDeDado(Tamanho)
    apagar coluna: drop column ColunaNome
    apagar constraint: drop constraint NomeConstraint
    renomear coluna: rename column ColunaAntiga to ColunaNova


-- ------------------------------------- --

drop table teste cascade constraints;
create table teste (nome number(4));
desc teste;

-- incluir na tabela teste a colna codigo de tipo n�merica com 4 posi��es
alter table teste add codigo number(4)
desc teste;

-- incluir na coluna c�digo da table teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo);
-- ou
alter table teste add primary key (codigo);
desc teste;

-- alterar o tipo de dados da coluna nome para alfanm�rico com 30 posi��es
alter table teste modify nome varchar(30);
desc teste;

-- alterar o tamanho da coluna nome para 45 posi��es;
alter table teste modify nome varchar(45)
desc teste;

-- apagar a pk da coluna c�digo
alter table teste drop constraint teste_cd_pk;
desc teste;

-- apagar a coluna c�digo da tabela teste.
alter table teste drop column codigo;
desc teste;

-- renomear a coluna nome para nome_cliente.
alter table teste rename column nome to nome_cliente;
desc teste;

-- incluir a regra not null na coluna nome_cliente.
alter table teste modify nome_cliente varchar2(45) not null;
desc teste;
            -- cuidado, existe uma pegadinha com notnull
            alter table teste modify nome_cliente varchar(45) not null;

DML - Data Manupulation Language - Dados
