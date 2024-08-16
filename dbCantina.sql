-- apagando banco de dados
drop database dbcantina;

-- criando banco de dados
create database dbcantina;

-- acessando banco de dados
use dbcantina;

-- criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(codFunc));

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(18) not null unique,
primary key(codForn));




create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(codCli));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc));
 


create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);



create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd));


-- visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

--inserindo dados na tabela

insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Hugo Souza','hugoneneca@gmail.com','01091910123','Masculino',300000.00,'1999/01/31','98765-4321');
insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Talles Magno','tallesmagno@gmail.com','01091910111','Masculino',330000.00,'2001/01/31','98765-4322');
insert into tbFornecedores(nome,email,cnpj)values('Sport Club Corinthians Paulista','corinthians@gmail.com','12.456.7890/561111');
insert into tbFornecedores(nome,email,cnpj)values('PSI Tecnologia','psitecnologia@gmail.com','12.456.7890/561121');	
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Goleiro',12,123.54,'2025/12/12','2024/08/08','19:19:19', 1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Ponta Esquerda',12,123.54,'2025/12/12','2023/04/12','23:16:12', 2);
insert into tbClientes(nome,email,telCelular)values('Augusto Melo','augustopinoquio@gmail.com','920912122');
insert into tbUsuarios(nome,senha,codFunc)values('Hugo Souza','cortinas12',1);
insert into tbUsuarios(nome,senha,codFunc)values('Talles Magno','cortinas43',2);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/07','19:12:14',2,1,1,1);

select * from tbFuncionarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;



--Alterando os registros das tabelas



update tbProdutos set descricao = 'Zagueiro', valor = 3.50 where codProd = 1;

--visualizando depois da alteração

select * from tbProdutos;