----- Criação do banco de dados -----

CREATE DATABASE bdCargos
USE bdCargos

----- Criação das tabelas -----

CREATE TABLE tbl_cargos (
	idCargo INT PRIMARY KEY IDENTITY (1,1),
	nomeCargo VARCHAR(30) NOT NULL,
	salarioCargo MONEY NOT NULL
);

CREATE TABLE tbl_funcionarios (
	idFuncionario INT PRIMARY KEY IDENTITY (1,1),
	idCargo INT FOREIGN KEY REFERENCES tbl_cargos (idCargo),
	nomeFuncionario VARCHAR(30) NOT NULL,
	idadeFuncionario INT NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_cargos
VALUES ('Programador Jr.', 2500),
       ('Web. Designer Jr.', 2200),
	   ('Programador Pleno.', 3700),
	   ('Web. Designer Pleno', 3200),
	   ('DBA. Jr.', 2500),
	   ('Programador Senior', 7000),
	   ('DBA Pleno', 6000),
	   ('DBA Senior', 10000),
	   ('Web Designer Senior', 6600)

INSERT INTO tbl_funcionarios (idCargo, nomeFuncionario, idadeFuncionario)
VALUES (1, 'Jairo Felicio', 30),
       (2, 'Geromel Helian', 40),
	   (NULL, 'Herculano Terço', 22),
	   (4, 'Juliana Macedo', 38),
	   (5, 'Helian Santo', 44),
	   (NULL, 'Geronimo Pinto', 33),
	   (NULL, 'Maciel Joanes', 22),
	   (8, 'Maria das Graças', 18),
	   (3, 'Pedro Machado', 29),
	   (3, 'Rubia Xerxes', 36)

----- Realização de consultas -----

SELECT *
FROM tbl_cargos
LEFT JOIN tbl_funcionarios
ON tbl_funcionarios.idCargo = tbl_cargos.idCargo

SELECT idFuncionario, f.idCargo, nomeFuncionario, idadeFuncionario
FROM tbl_cargos
LEFT JOIN tbl_funcionarios f
ON f.idCargo = tbl_cargos.idCargo