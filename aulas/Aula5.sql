AULA 5 - 01/10/24

CRIANDO RELATÓRIOS - DQL

-- Sintaxe 1:
Select * from nome_tabela;
    -- Retorna todas as colunas e linhas de uma tabela 
    
-- Sintaxe 2:
Select nome_coluna1, nome_coluna2,... nome_colunaN,
from nome_tabela;
    -- retorna as colunas especificadas na instrução e todas as linhas da tabela

--Exemplos:
--1: Crie um relatório que mostre o conteúdo da tabela produto
select * from produto;

--2: Crie um relatório que exiba o nome do vendedor e seu salário
select nome_ven, salario_fixo from vendedor;

--3: Mostre da tabela cliente: nome do cliente, a cidade onde mora e seu cnpj.
select nome_clie, cidade, cnpj from cliente;

--4: Exiba os dados dos pedidos existentes na tabela pedido.
select * from pedido;

--5: Crie um relatório que mostre o nome dos produtos cadastrados.
select descricao from produto;



APELIDANDO COLUNAS
-- * uma palavra no apelido, não é obrigatório o uso de aspas dupla " "
-- * + de uma palavra no apelido, é obrigatório o uso de aspas dupla " "

--Exemplo:
select nome_clie from cliente; 
--SEM APELIDO

select nome_clie Nome from cliente; 
--COM APELIDO UMA PALAVRA

select nome_clie "Nome do Cliente" from cliente; 
--COM APELIDO +  DE UMA PALAVRA

select nome_clie "Nome do Cliente", uf "Estado" from cliente; 
--COM APELIDO + DE UMA PALAVRA E + DE UMA COLUNA



CLASSIFICANDO RELATÓRIOS
Comando: order by coluna_nome ou posição da coluna na tabela ou no select
Opções: asc crescnte -- JÁ VEM POR DEFAULT
        desc decrescente
        
--Exemplos:
-- 1: Classificando a coluna código do cliente em ordem decrescente - desc
select cod_clie
from cliente
order by cod_clie desc;

-- 2: Classificando a coluna código do cliente em ordem crescente - asc
select cod_clie
from cliente
order by cod_clie asc;

-- Curiosidades
SELECT * FROM cliente ORDER BY 2;
-- ordena os resultados pela segunda coluna da tabela

select nome_clie, cidade from cliente order by 2; 
-- ordena os resultados pela segunda coluna selecionada (cidade)

select nome_clie, cidade from cliente order by 2,1;
-- ordena primeiro pela cidade (segunda coluna) e depois pelo nome 
-- (primeira coluna) em caso de empate



FILTRANDO LINHAS
Comando: where coluna_nome operador valor

-- Exemplo --> Operadores aritiméticos:
/* Crie um relatório que mostre o preço atual dos produtos e seu novo preço com 
5% de acréscimo*? */
select descricao "Nome Produto", val_unit "Preço Atual",
val_unit * 1.05 "Preço com + 5%" from produto;

-- Exemplo --> Operadores Relacionais e Lógicos:
/* Quem são os clientes que moram no estado de São Paulo, mostre seu nome, 
o estado e classifique em ordem crescente de nome do cliente. */
select nome_clie, uf from cliente where uf = 'SP' or uf = 'sp' order by 1;

-------------------------------------------------

-- Exercícios:

-- 1 - Monte um relatório que mostre os produtos com preço supeior a R$1,00

select * from produto where val_unit > 1;

-- 2 - Crie um relatório que exiba os pedidos de número maior ou igual a 100.

select * from pedido where num_pedido >= 100;

/* 3 - Quem são os vendedores que não pertencem a comissão "c"? 
Mostre nome e comissão classificados pela comissão de forma decrescente*/

select nome_ven, comissao from vendedor where comissao != 'C' order by 2 desc;

/* 4 - Mostre os clientes de código maior que 200 e menor que 500, traga toda 
as colunas*/

select * from cliente where cod_clie > 200 and cod_clie < 500;

/* 5 - Quais vendedores, nome e salário ficariam com salário maior ou igual a
R$5.000,00 com um bônus de 10% no salário atual*/

select nome_ven, salario_fixo * 1.1 
from vendedor 
where salario_fixo * 1.10 > 5000 and salario_fixo < 5000;