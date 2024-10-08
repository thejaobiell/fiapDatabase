-- EXERCÍCIOS DE DDL
--A
CREATE TABLE DEPT(
    DEPTNO NUMBER(2)CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP(
    EMPNO NUMBER(5)CONSTRAINT PK_EMP PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO2 NUMBER(2),
    CONSTRAINT fk_DEPTNO FOREIGN KEY (DEPTNO2) REFERENCES DEPT(DEPTNO)
);

--B e C
SELECT * FROM EMP;
SELECT * FROM DEPT;

--D. Renomeie a tabela EMP para EMPS.
ALTER TABLE EMP
RENAME TO EMPS;
SELECT * FROM EMPS;

--E. Renomeie a tabela DEPT para DEPTS.
ALTER TABLE DEPT
RENAME TO DEPTS;
SELECT * FROM DEPTS;

--F. Renomeie a restrição PK_EMP da tabela EMPS para PK_EMPS
ALTER TABLE EMPS
RENAME CONSTRAINT PK_EMP TO PK_EMPS;

--G. Renomeie a restrição FK_DEPTNO da tabela EMPS para FK_DEPTSNO
ALTER TABLE EMPS
RENAME CONSTRAINT FK_DEPTNO TO FK_DEPTSNO;

--H. Renomeie a restrição PK_DEPT da tabela DETPS para PK_DEPTS.
ALTER TABLE DEPTS
RENAME CONSTRAINT PK_DEPT TO PK_DEPTS;

--I. Renomeie a coluna SAL da tabela EMPS para SALARY.
ALTER TABLE EMPS
RENAME COLUMN SAL TO SALARY;
SELECT * FROM EMPS;

--J. Remova a coluna LOC da tabela DEPTS
ALTER TABLE DEPTS
DROP COLUMN LOC;
SELECT * FROM DEPTS;

--K. Adicione a coluna BIRTH_DATE na tela EMPS
ALTER TABLE EMPS
ADD BIRTH_DATE DATE;
SELECT * FROM EMPS;

/*I. Altere o tamanho da coluna SALARY da tabela EMPS para 
8 de precisão e 3 de escala. */
ALTER TABLE EMPS
MODIFY SALARY NUMBER(8,3);
DESC EMPS;

/*M. Implemente a restrição necessária para que as colunas ENAME e SALARY 
da tabela EMPS sejam obrigatórias*/
ALTER TABLE EMPS
MODIFY ENAME VARCHAR2(10) NOT NULL;

ALTER TABLE EMPS
MODIFY SALARY NUMBER(8,3) NOT NULL;
DESC EMPS;

/*N. Implemente a restrição necessária para que as colunas DNAME da tabela DEPTS
seja obrigatória e passe a aceitar até 20 caracteres*/
ALTER TABLE DEPTS
MODIFY DNAME VARCHAR2(20) NOT NULL;
DESC DEPTS;

DROP TABLE EMPS;
DROP TABLE DEPTS;


------------------------------

--EXERCICIO DE DML
--1
CREATE TABLE my_employee(
    id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
    last_name VARCHAR(25),
    first_name VARCHAR(25),
    userid VARCHAR(8),
    salary NUMBER(9,2)
);

--2 
desc my_employee;

/*3. Crie uma instrução INSERT para adicionar a primeira linha de dados à tabela 
MY_EMPLOYEE usando estes dados de amostra. 
Não liste as colunas na cláusula INSERT. Não informe todas as linhas ainda.*/
INSERT INTO my_employee VALUES (1, 'Patel', 'Ralph', 'rpatel', 895);

/*4. Preencha a tabela MY_EMPLOYEE com a segunda linha de dados de amostra da 
lista anterior. Desta vez, liste as colunas explicitamente na cláusula INSERT.*/
INSERT INTO my_employee(id, last_name, first_name, userid, salary) 
VALUES (2, 'Dances', 'Betty', 'bdancs', 860);

--5. Confirme a adição à tabela. Faça uma consulta que realize a projeção dos dado
SELECT * FROM my_employee;

/*6. Preencha a tabela MY_EMPLOYEE com a terceira linha de dados de amostra 
da lista anterior.
  7. Preencha a tabela MY_EMPLOYEE com a quarta linha de dados de amostra 
da lista anterior.*/

INSERT ALL
    INTO my_employee(id, last_name, first_name, userid, salary) 
    VALUES (3, 'Biri', 'Ben', 'bbiri', 1100)
    INTO my_employee(id, last_name, first_name, userid, salary) 
    VALUES (4, 'Newman', 'Chad', 'cnewman', 750)
select * from dual;

--8. Confirme as adições à tabela. Faça uma consulta que realize a projeção dos dados
SELECT * FROM my_employee;

--9. ANULADA

--10. Altere o sobrenome do funcionário 3 para Drexler
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 3;

SELECT * FROM my_employee WHERE id = 3;

/*11. Altere o salário de todos os funcionários com salário inferior 
a US$ 900 para US$ 1.000*/
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

SELECT * FROM my_employee WHERE salary < 900 ;
SELECT * FROM my_employee WHERE salary = 1000 ;

/*12. Verifique as alterações na tabela. Faça uma consulta que realize 
a projeção dos dado*/
SELECT * FROM my_employee;

--13. Delete Betty Dancs da tabela MY_EMPLOYEE.
DELETE FROM my_employee
WHERE first_name = 'Betty';

/*14. Confirme as alterações na tabela. Faça uma consulta que realize 
a projeção dos dado*/
SELECT * FROM my_employee;


DROP TABLE MY_EMPLOYEE;