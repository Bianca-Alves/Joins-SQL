----- Criação do banco de dados -----

CREATE DATABASE bdVeiculos
USE bdVeiculos

----- Criação das tabelas -----

CREATE TABLE tbl_veiculo (
	Placa CHAR(08) PRIMARY KEY NOT NULL,
	Fabricante VARCHAR(10) NOT NULL,
	Marca VARCHAR(10) NOT NULL,
	Ano INT NOT NULL,
	Cor VARCHAR(10) NOT NULL
);

CREATE TABLE tbl_cliente (
	codCliente INT PRIMARY KEY NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Idade INT NOT NULL,
	Telefone INT NOT NULL,
	carroPlaca CHAR(08) FOREIGN KEY REFERENCES tbl_veiculo (Placa) NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_veiculo
VALUES ('IOS-0078', 'Renault', 'Sandero',  2009, 'Vermelho'),
       ('ITO-1314', 'Volkswagen', 'Fox',  2010, 'Azul'),
	   ('IJM-1453', 'Hyundai', 'I30',  2014, 'Pérola'),
	   ('IVA-2018', 'Chevrolet', 'Onix',  2015, 'Branco'),
	   ('MAI-1852', 'Citroen', 'C3',  2013, 'Preto')

INSERT INTO tbl_cliente
VALUES (1, 'Paulo Freitas', 23, 518425986, 'IOS-0078'),
       (2, 'Pâmela Silva', 35, 519669875, 'ITO-1314'),
	   (4, 'Rogério Lins', 30, 559863324, 'IJM-1453')

----- Realização de consultas -----

SELECT Nome, Idade, Fabricante, Ano, Marca
FROM tbl_cliente
FULL JOIN tbl_veiculo
ON tbl_cliente.carroPlaca = tbl_veiculo.Placa
WHERE codCliente IS NOT NULL