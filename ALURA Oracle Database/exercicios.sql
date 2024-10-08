create table tab_empresa(
    cod_empresa varchar2(5) primary key,
    nome_empresa varchar2(50)
);

create table tab_departamento(
    cod_departamento varchar2(5) primary key,
    nome_departamento varchar2(50),
    cidade_departamento varchar2(50),
    constraint cod_empresa 
)