Aula 1 - 20/08/24

-- coment�rios de linha
/* coment�rios v�rias linhas*/


Parte 1 - comandos DDL - estrutura

Data Definition Language

Create - cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
         mat_fun - N - 4 - Pk
         nm_fun  - A - 30 - Nn
         dt_adm  - D - Nn
         salario - N - 8,2
         sexo    - C - 1 - Nn
         
Criando tabelas:
Sintaxe: create table table_name (column_name1 datatype(size) [constraint],
                                  column_name2 datatype(size) [constraint],
                                  ......................);
                                  
obs: constraint � opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando a tabela funcion�rio:


create table funcionario (mat_fun Number(4) Primary key,
                          nm_fun  varchar(30) Not null,
                          dt_adm  Date Not null,
                          salario Number(10,2),
                          sexo    Char(1) not null);

desc funcionario;

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null);
 
Relacionamentos: 1 - N - criando a FK

Tabela: cargo - cd_cargo - N - 4 - PK
                nm_cargo - A - 25 - Nn, Uk -- unique
                salario  - N - 8,2
                
create table cargo (cd_cargo number(4) constraint cargo_cd_pk1 primary key,
                    nm_cargo varchar(25) constraint cargo_nm_nn1 not null
                                         constraint cargo_nm_uk1 unique,
                    salario number(10,2));
                    
Tabela: Funcion�rio, j� existe???? vamos apagar

Apagando uma tabela sem relacionamento

sintaxe: drop table table_name;

drop table funcionario_2024;

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null,
 fk_cargo number(4) constraint func_cargo_fk references cargo);
 
 obs fk: column_name datatype(syze) [constraint] references table_name
 
 references � a cria��o da foreign key (fk) ou chave estrangeira
 
 Aula 2 - criando 1 - 1
 
 Create table pessoa1 (cod_pess1 number(3) primary key,
                       nm_pess1 varchar(30) not null);
                       
 Create table pessoa2 (cod_pess2 number(3) primary key,
                       nm_pess2 varchar(30) not null,
                       fk_pess number(3) unique references pessoa1);
                       
 DML - Altera��o de estrutura - tabela
 
 sintaxe: alter table table_name.....
 varia��es: incluir coluna: add column_name
            incluir constraint: add constraint constraint_name
            modificar tipo de dados: modify
            modificar tamanho: modify
            apagar coluna: drop column column_name
            apagar constraint: drop constraint constraint_name
            renomear coluna: rename column
            
drop table teste cascade constraints;            
            
create table teste (nome number(4));            

- incluir na tabela teste a coluna c�digo de tipo num�rica com 4 posi��es.
desc teste;
alter table teste add codigo number(4);

- incuir na coluna c�digo da tabela teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo);
ou
alter table teste add primary key (codigo);

- alterar o tipo de dados da coluna nome para alfanum�rico com 30 posi��es
alter table teste modify nome varchar(30);

- alterar o tamanho da coluna nome para 45 posi��es
alter table teste modify nome varchar(45);

- apagar a pk da coluna c�digo
alter table teste drop constraint teste_cd_pk;

- apagar a coluna na c�digo da tabela teste.
alter table teste drop column codigo;

-renomear a coluna nome para nome_cliente.
alter table teste rename column nome to nome_cliente;

- incluir a regra not null na coluna nome_cliente.
alter table teste add constraint teste_nome_nn not null (nome_cliente);
- cuidado, existe uma pegadinha com not null
alter table teste modify nome_cliente varchar(45) 
constraint teste_nome_nn not null;

DML - Data Manipulation Language - Dados

Novas linhas 
sintaxe: insert into table_name values (value_column1,......, value_columnN);
         insert into table_name (name_column1,......., name_columnN)
         values (value_column1,......, value_columnN);

usando nulo = null
dados n�o num�ricos precisam de ''

Exemplificar;

desc cargo
insert into cargo values (1,'prog. JAVA', 10000);
-- visualizando dados
select * from cargo;
insert into cargo values (2,'DBA', 12500.80);

incluir os seguintes dados na tabela cargo
3 - CEO - 25000
4 - Adm Redes - 8500
5 - Est�gio - 33000

insert into cargo values (3,'CEO', 25000);
insert into cargo values (4,'Adm Redes', 8500);
insert into cargo values (5,'Est�gio', 33000);

caso n�o tenha dados para uma ou mais colunas?????

6 - Adm. Seg - null
select * from cargo;
desc cargo
vers�o 1: insert into cargo values (6,'Adm. Seg', null);
vers�o 2: insert into cargo (cd_cargo, nm_cargo) values(7,'Adm Seg');
validando os dados
commit;

Inserir 3 linhas de dados na tabela funcion�rio a seu crit�rio
desc funcionario_2024;
procurando pelo padr�o de data
select sysdate from dual; -- acha a data cadastrada
insert into funcionario_2024 values (1,'Marcel','10-jan-20', 70000,'M',2);
insert into funcionario_2024 values (2,'Joana','20-dec-22',50000,'F',1);
insert into funcionario_2024 values (3,'Ricardo',sysdate,null,'M',6);
commit;
select * from funcionario_2024;
cuidado com os valores de FK, s� recebe dados j� cadastrado na pk
insert into funcionario_2024 values (4,'Ricardo',sysdate,null,'M',8);

Aula 3 - 03/09/24

Operadores aritm�ticos + - * / ()
           relacionais > >= < <= = <> ou !=
           l�gicos and or not
           
DML - Atualiza��o de dados

select * from cargo;
select * from funcionario_2024;

sintaxe: update table_name set column_name = new_value
         where condition;
         
 Atualizar o sal�rio do cargo Est�gio para R$3.000,00
  update cargo set salario = 3000 where nm_cargo = 'Est�gio';
 commit;
 
 Aumentar o sal�rio de todos os cargos em 10%
 update cargo set salario = salario * 1.1;
 commit;
 
 select * from funcionario_2024;
 
 Trocar o nome do funcion�rio Marcel para Maciel
 update funcionario_2024 set nm_fun = 'Maciel' 
 where mat_fun = 1;
 ou
 update funcionario_2024 set nm_fun = 'Maciel' 
 where nm_fun = 'Marcel';
 
 Atualizar os valores da coluna sexo para masculino que est� com M 
 e feminino quem est� com F
 
 update funcionario_2024 set sexo = 'masculino'
 where sexo = 'M';
 
 desc cargo
 
 alter table funcionario_2024 modify sexo varchar(9);
 
 update funcionario_2024 set sexo = 'feminino' where sexo = 'F';
 
 commit;
         
Para os cargos com sal�rio maior que R$5.000,00 e menor que R$15.000,00
atualize o sal�rio para R$2.500,00.
update cargo set salario = 2500
where salario > 5000 and salario < 15000;
rollback;
commit;
select  * from funcionario_2024;

Incluir o sal�rio de R$10.000,00 para o funcion�rio Ricardo.
update funcionario_2024 set salario = 10000
where salario is null;
commit;

Apagando linhas

sintaxe: delete from table_name where condition;

apagar os dados da tabela cargo
delete from cargo; -- n�o funciona, motivo FK

Apagar os dados do funcionario Maciel
delete from funcionario_2024 where nm_fun = 'Maciel';
commit;

Exerc�cios.....








