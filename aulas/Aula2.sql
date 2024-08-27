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

drop table teste cascade constraints;
create table teste (nome number(4));
- incluir na tabela teste a colna codigo de tipo númerica com 4 posições
desc teste;
alter table teste add codigo number(4)
desc teste;

- incluir na coluna código da table teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo);
-- ou
alter table teste add primary key (codigo);
desc teste;

- alterar o tipo de dados da coluna nome para alfanmérico com 30 posições
alter table teste modify nome varchar(30);

- alterar o tamanho da coluna nome para 45 posições;
alter table teste modify nome varchar(45)

- apagar a pk da coluna código
alter table teste drop constraint teste_cd_pk;
desc teste;
