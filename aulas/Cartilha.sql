/*
1. CREATE TABLE: Cria uma nova tabela
    CREATE TABLE nome_tabela(
        nome_coluna1 tipo_dado,
        nome_coluna4 tipo_dado,
        nome_coluna3 tipo_dado,
        nome_coluna4 tipo_dado
        )
    
*Tipos de Dados e Restrições
        1- NUMBER(p, s): Numero com precisão(qtd de nº) e escala(casas decimais)
        2- VARCHAR2(n): String de comprimento n
        3- CHAR(n): Caractere de comprimento fixo n
        4- DATE: DD/MM/AAAA (DIA/MÊS/ANO)
        5- PRIMARY KEY: Identifica exclusivamente cada linha na tabela, não nula
        6- FOREIGN KEY: Cria uma relação com outra tabela
        7- NOT NULL: Garante que a coluna não aceita valores nulos.
        8- UNIQUE: Garante que todos os valores na coluna são únicos.
*/
        
CREATE TABLE alunos (
    ID_Aluno INT,
    Nome_Aluno VARCHAR2(100),
    Email VARCHAR2(100)
);

CREATE TABLE cursos(
    ID_Curso INT,
    Nome_Curso VARCHAR(100),
    Preco_Curso NUMBER(10,2)
);

CREATE TABLE matriculas(
    ID_Matricula INT,
    ID_Aluno INT,
    ID_Curso INT,
    Data_Cadastro DATE
);

/*
2. SELECT * FROM: Seleciona a tabela
    SELECT * FROM nome_tabela;
        -Seleciona uma tabela e mostra todas as colunas
    
    SELECT nome_coluna1, nome_coluna2 FROM nome_tabela;
        -Seleciona uma tabela e mostra as colunas que foram específicadas
*/

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;


/*
3. INSERT INTO: Insere dados dentro da tabela
    1-
    INSERT INTO nome_tabela VALUES(valor1, valor2, valor3, ... valorN)
        -Insere valores nas tabelas sem especificar quais colunas.
            (Então os valores devem sem colocados na ordem das colunas, se não 
            irá dar errado).
    
    2-
    INSERT INTO nome_tabela (nome_coluna1, nome_coluna2) VALUES(valor1, valor2)
        -Insere valores de acordo com as colunas fornecidas
        
    3-
    INSERT ALL
        INTO nome_tabela (nome_coluna1, nome_coluna2) VALUES (valor1, valor2)
        INTO nome_tabela (nome_coluna1, nome_coluna2) VALUES (valor2, valor3)
    SELECT * FROM dual;
        -Insere varios valores de uma só vez
*/

INSERT ALL
  INTO alunos(ID_Aluno, Nome_Aluno, Email)  VALUES (1, 'Ana', 'ana123@gmail.com')
  INTO alunos(ID_Aluno, Nome_Aluno, Email)  VALUES (2, 'Bruno', 'bruno_vargas@outlook.com')
  INTO alunos(ID_Aluno, Nome_Aluno, Email)  VALUES (3, 'Carla', 'carlinha1999@gmail.com')
  INTO alunos(ID_Aluno, Nome_Aluno, Email)  VALUES (4, 'Diego', 'diicastroneves@gmail.com')
select * from dual;
select * from alunos;

INSERT INTO cursos(ID_Curso, Nome_Curso, Preco_Curso) VALUES (1, 'Excel', 100);
INSERT INTO cursos(ID_Curso, Nome_Curso, Preco_Curso) VALUES (2, 'VBA', 200);
INSERT INTO cursos(ID_Curso, Nome_Curso, Preco_Curso) VALUES (3, 'Power BI', 150);
SELECT * FROM cursos;

INSERT INTO matriculas VALUES(1,1,1, TO_DATE('2021-03-11', 'YYYY-MM-DD') );
INSERT INTO matriculas VALUES(2,1,2, TO_DATE('2021-06-21', 'YYYY-MM-DD') );
INSERT INTO matriculas VALUES(3,2,3, TO_DATE('2021-01-08', 'YYYY-MM-DD') );
INSERT INTO matriculas VALUES(4,3,1, TO_DATE('2021-04-03', 'YYYY-MM-DD') );
INSERT INTO matriculas VALUES(5,4,1, TO_DATE('2024-05-10', 'YYYY-MM-DD') );
INSERT INTO matriculas VALUES(6,4,3, TO_DATE('2024-05-10', 'YYYY-MM-DD') );
SELECT * FROM matriculas;

/*
4. UPDATE: Atualizar tabelas

    1-
    UPDATE nome_tabela
    SET nome_coluna2 = valor
        -Atualiza todos os registros da coluna especificada para um novo valor
    
    2-
    UPDATE nome_tabela
    SET nome_coluna1 = valor1
    WHERE nome_coluna2 = valor2
        - Irá atualizar a coluna1 de valor1, onde a coluna2 tenha valor2
*/

UPDATE cursos
SET Preco_Curso = 300
WHERE Id_Curso = 1;
SELECT * FROM cursos;

/*
5. DELETE FROM: DELETA LINHA
    
    DELETE FROM nome_tabela
    WHERE nome_coluna =  valor;
        -Irá deletar a linha cujo o valor da nome_coluna for igual a valor 
    
*/

DELETE FROM matriculas
WHERE ID_Matricula = 6;
SELECT * FROM MATRICULAS;

/*
6. ALTER TABLE: Altera dados da tabela

    1- Adicionar uma Nova Coluna:
        ALTER TABLE nome_tabela
        ADD nome_coluna tipo_dado [restrições];
    
    2- Modificar Colunas:
        ALTER TABLE nome_tabela
        MODIFY nome_coluna novo_tipo [restrições];

    3- Remover Coluna:
        ALTER TABLE nome_tabela
        DROP COLUMN nome_coluna;

    4- Adicionar Restrições:
        ALTER TABLE nome_tabela
        ADD CONSTRAINT nome_restricao [restrições] (nome_coluna);

    5. Remover Restrições:
        ALTER TABLE nome_tabela
        DROP CONSTRAINT nome_restricao;
        
    6. Renomear uma Coluna:
        ALTER TABLE nome_tabela
        RENAME COLUMN nome_coluna_antigo TO nome_coluna_novo;

    7. Renomear uma Tabela:
        ALTER TABLE nome_tabela
        RENAME TABLE nome_tabela_antigo TO novo_nome_tabela;
        
    8. Adicionar uma Chave Estrangeira(FK/FOREIGN KEY):
        ALTER TABLE nome_tabela
        ADD CONSTRAINT nome_restricao FOREIGN KEY (nome_coluna) 
        REFERENCES outra_tabela(nome_coluna);

    9. Remover uma Chave Estrangeira (FOREIGN KEY):
        ALTER TABLE nome_tabela
        DROP CONSTRAINT nome_restricao;
    
    10. Alterar a Tabela para Adicionar ou Remover Restrições de NOT NULL ou NULL:
        ALTER TABLE nome_tabela
        MODIFY nome_coluna tipo_dado NOT NULL;

        ALTER TABLE nome_tabela
        MODIFY nome_coluna tipo_dado NULL;
        
    11. Mudar o Tipo de Dados com Restrições
        ALTER TABLE nome_tabela
        MODIFY nome_coluna novo_tipo [restrições];
*/


/*
7. DROP TABLE: Excluindo tabelas
    
    DROP TABLE nome_tabela;
    DROP TABLE nome_tabela CONSTRAINTS;
*/

Drop Table alunos;
Drop Table cursos_oferecidos;
Drop Table matriculas;