--Aula 3 - 03 09/24

Operadores aritm�ticos + - * / ()
           relacionais > >= < <= = <> ou !=
           l�gicos and or not

DML - ATUALIZA��O DE DADOS

select * from cargo;
select * from funcionario_2024;

SINTAXE: UPDATE nomeTabela set nomeColuna = new_value where condi��o;

-- Atualizar o sal�rio do cargo Est�gio para R$ 3.000,00
update cargo set salario = 3000 where nm_cargo = 'Est�gio';
commit;

-- Aumentar o sal�rio de todos os cargos em 10%
update cargo set salario = salario * 1.1;
commit;

-- Trocar o nome de um dos Funcion�rios para Marciel
update funcionario_2024 set NM_FUN = 'Marciel' where MAT_FUN = '1';
commit;

-- Atualizar os valores de coluna sexo para masculino que est� com M e feminino 
-- que est� com F
ALTER TABLE funcionario_2024 MODIFY sexo VARCHAR2(9);
UPDATE funcionario_2024 SET sexo = CASE 
              WHEN sexo = 'M' THEN 'Masculino'
              WHEN sexo = 'F' THEN 'Feminino'
END;
commit;

-- Para os cargos com sal�rio maior que R$5.000,00 e menor que R$15.000,00
-- atualize o sal�rio para R$2.500,00
update cargo set salario = 2500 where salario > 5000 and salario < 15000;
rollback;
select * from cargo;
commit;

------------------------------------------------

Apagando linhas
SINTAXE: DELETE FROM nomeTabela WHERE condi��o;
delete from cargo; -- n�o funciona, motivo FK

-- Apagar os dados do funcionario Marciel
delete from funcionario_2024 WHERE nm_fun = 'Marciel';
select * from funcionario_2024;
commit;