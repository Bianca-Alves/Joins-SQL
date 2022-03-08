----- Criação do banco de dados -----

CREATE DATABASE bdConcessionaria
USE bdConcessionaria

----- Criação das tabelas -----

CREATE TABLE tbl_carros (
	Placa CHAR(08) PRIMARY KEY NOT NULL,
	Marca VARCHAR(50) NOT NULL,
	Modelo VARCHAR(50) NOT NULL,
	Cor VARCHAR(50) NOT NULL,
	Ano CHAR(04) NOT NULL
);

CREATE TABLE tbl_cliente (
	Nome VARCHAR(100) PRIMARY KEY NOT NULL,
	Logradouro VARCHAR(100) NOT NULL,
	Nº INT CHECK(Nº>0) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	Telefone CHAR(09) NOT NULL,
	Carro CHAR(08) FOREIGN KEY REFERENCES tbl_carros (Placa) NOT NULL
);

CREATE TABLE tbl_funcionarios (
	Nome VARCHAR(100) PRIMARY KEY NOT NULL,
	Cargo CHAR(14) NOT NULL,
	Nascimento DATE NOT NULL,
	TaxaPresenca FLOAT NOT NULL,
	SalarioBase MONEY NOT NULL,
	Avaliacao FLOAT NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_carros
VALUES ('AFT-9087', 'VW', 'Gol', 'Preto', '2007'),
	   ('DXO-9876', 'Ford', 'Ka', 'Azul', '2000'),
	   ('EGT-4631', 'Renault', 'Clio', 'Verde', '2004'),
	   ('LKM-7380', 'Fiat', 'Palio', 'Prata', '1997'),
	   ('BCD-7521', 'Ford', 'Fiesta', 'Preto', '1999')

INSERT INTO tbl_cliente
VALUES ('João Alves', 'R. Pereira Barreto', 1258, 'Jd. Oliveiras', '2154-9658', 'DXO-9876'),
       ('Ana Maria', 'R. 7 de Setembro', 259, 'Centro', '9658-8541', 'LKM-7380'),
	   ('Clara Oliveira', 'Av. Nações Unidas', 10254, 'Pinheiros', '2458-9658', 'EGT-4631'),
	   ('José Simões', 'R. XV de Novembro', 36, 'Água Branca', '7895-2459', 'BCD-7521'),
	   ('Paula Rocha', 'R. Anhaia', 548, 'Barra Funda', '6958-2548', 'AFT-9087')

----- Realização de consultas -----

UPDATE tbl_carros
SET Ano = '2009'
WHERE Placa = 'AFT-9087'

UPDATE tbl_cliente
SET Telefone = '9658-8541'
WHERE Nome = 'Ana Maria'

SELECT Nome, Logradouro, Telefone, Marca, Modelo, Cor, Ano 
FROM tbl_cliente
FULL JOIN tbl_carros
ON tbl_cliente.Carro = tbl_carros.Placa

SELECT Nome, Modelo, Placa
FROM tbl_cliente
FULL JOIN tbl_carros
ON tbl_cliente.Carro = tbl_carros.Placa
WHERE Ano>2000