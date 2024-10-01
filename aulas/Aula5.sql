AULA 5 - 01/10/24

CRIANDO RELAT�RIOS - DQL

-- Sintaxe 1:
Select * from nome_tabela;
    -- Retorna todas as colunas e linhas de uma tabela 
    
-- Sintaxe 2:
Select nome_coluna1, nome_coluna2,... nome_colunaN,
from nome_tabela;
    -- retorna as colunas especificadas na instru��o e todas as linhas da tabela

--Exemplos:
--1: Crie um relat�rio que mostre o conte�do da tabela produto
select * from produto;

--2: Crie um relat�rio que exiba o nome do vendedor e seu sal�rio
select nome_ven, salario_fixo from vendedor;

--3: Mostre da tabela cliente: nome do cliente, a cidade onde mora e seu cnpj.
select nome_clie, cidade, cnpj from cliente;

--4: Exiba os dados dos pedidos existentes na tabela pedido.
select * from pedido;

--5: Crie um relat�rio que mostre o nome dos produtos cadastrados.
select descricao from produto;



APELIDANDO COLUNAS
-- * uma palavra no apelido, n�o � obrigat�rio o uso de aspas dupla " "
-- * + de uma palavra no apelido, � obrigat�rio o uso de aspas dupla " "

--Exemplo:
select nome_clie from cliente; 
--SEM APELIDO

select nome_clie Nome from cliente; 
--COM APELIDO UMA PALAVRA

select nome_clie "Nome do Cliente" from cliente; 
--COM APELIDO +  DE UMA PALAVRA

select nome_clie "Nome do Cliente", uf "Estado" from cliente; 
--COM APELIDO + DE UMA PALAVRA E + DE UMA COLUNA



CLASSIFICANDO RELAT�RIOS
Comando: order by coluna_nome ou posi��o da coluna na tabela ou no select
Op��es: asc crescnte -- J� VEM POR DEFAULT
        desc decrescente
        
--Exemplos:
-- 1: Classificando a coluna c�digo do cliente em ordem decrescente - desc
select cod_clie
from cliente
order by cod_clie desc;

-- 2: Classificando a coluna c�digo do cliente em ordem crescente - asc
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

-- Exemplo --> Operadores aritim�ticos:
/* Crie um relat�rio que mostre o pre�o atual dos produtos e seu novo pre�o com 
5% de acr�scimo*? */
select descricao "Nome Produto", val_unit "Pre�o Atual",
val_unit * 1.05 "Pre�o com + 5%" from produto;

-- Exemplo --> Operadores Relacionais e L�gicos:
/* Quem s�o os clientes que moram no estado de S�o Paulo, mostre seu nome, 
o estado e classifique em ordem crescente de nome do cliente. */
select nome_clie, uf from cliente where uf = 'SP' or uf = 'sp' order by 1;

-------------------------------------------------

-- Exerc�cios:

-- 1 - Monte um relat�rio que mostre os produtos com pre�o supeior a R$1,00

select * from produto where val_unit > 1;

-- 2 - Crie um relat�rio que exiba os pedidos de n�mero maior ou igual a 100.

select * from pedido where num_pedido >= 100;

/* 3 - Quem s�o os vendedores que n�o pertencem a comiss�o "c"? 
Mostre nome e comiss�o classificados pela comiss�o de forma decrescente*/

select nome_ven, comissao from vendedor where comissao != 'C' order by 2 desc;

/* 4 - Mostre os clientes de c�digo maior que 200 e menor que 500, traga toda 
as colunas*/

select * from cliente where cod_clie > 200 and cod_clie < 500;

/* 5 - Quais vendedores, nome e sal�rio ficariam com sal�rio maior ou igual a
R$5.000,00 com um b�nus de 10% no sal�rio atual*/

select nome_ven, salario_fixo * 1.1 
from vendedor 
where salario_fixo * 1.10 > 5000 and salario_fixo < 5000;