CREATE DATABASE Kelper;
USE Kelper;

CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(50) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL, 
    fk_matriz INT, 
    fk_endereco INT NOT NULL,
    numero VARCHAR(10) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    codigo CHAR (6) NOT NULL UNIQUE,
    CONSTRAINT fk_matriz FOREIGN KEY (fk_matriz) REFERENCES empresa(idEmpresa),
    CONSTRAINT fk_endereco FOREIGN KEY (fk_endereco) REFERENCES endereco(idEndereco)
);



CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    senha VARCHAR(128) NOT NULL,
    fk_empresa INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updadtedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);


CREATE TABLE viveiro (
    idViveiro INT PRIMARY KEY AUTO_INCREMENT,
    fk_empresa INT NOT NULL,
    latitude DECIMAL(10, 8), 
    longitude DECIMAL(11, 8),
    status_atividade BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE arduino (
    idArduino INT PRIMARY KEY AUTO_INCREMENT,
    fk_viveiro INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_viveiro FOREIGN KEY (fk_viveiro) REFERENCES viveiro(idViveiro)
);

CREATE TABLE arduino_leitura(
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(10, 2) NOT NULL,
    luminosidade DECIMAL(10, 2) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_Arduino INT NOT NULL,
    CONSTRAINT fk_Arduino FOREIGN KEY (fk_Arduino) REFERENCES arduino(idArduino)
);

       CREATE TABLE alerta(
	idAlerta 			INT PRIMARY KEY NOT NULL,		
	fk_arduino_leitura INT,
    createdAt			DATETIME DEFAULT CURRENT_TIMESTAMP,	
    nivelRisco VARCHAR(50),
	CONSTRAINT chk_nivelRisco CHECK(nivelRisco in ("Baixo", "Médio", "Grave")),
    CONSTRAINT fk_leitura_arduino FOREIGN KEY (fk_arduino_leitura) REFERENCES arduino_leitura(idLeitura)
 );


SELECT * FROM endereço;
SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM viveiro;
SELECT * FROM arduino;
SELECT * FROM arduino_leitura;
SELECT * FROM alerta;

SELECT em.nome_empresa, u.nome_usuario, u.cpf, v.idViveiro, a.idArduino, al.luminosidade, al.temperatura, ta.nivelRisco
FROM usuario as u
JOIN empresa as em
on em.idEmpresa = u.fk_empresa
JOIN viveiro as v
on v.fk_empresa = em.idEmpresa
join arduino as a
on a.fk_viveiro = v.idViveiro
join arduino_leitura as al
on al.fk_arduino = a.idArduino
JOIN alerta as ta
on ta.fk_arduino_leitura = al.idLeitura; 

SELECT  u.*, em.nome_empresa
FROM empresa AS em
RIGHT JOIN usuario AS u 
ON em.idEmpresa = u.fk_empresa; 


SELECT a.idArduino, v.idViveiro
FROM viveiro as v
LEFT JOIN arduino as a
ON a.fk_viveiro = v.idViveiro;

SELECT al.idleitura, a.nivelRisco
FROM alerta AS a
RIGHT JOIN arduino_leitura AS al
ON a.fk_Arduino_leitura = al.idLeitura
UNION
SELECT al.idleitura, a.nivelRisco
FROM alerta AS a
LEFT JOIN arduino_leitura AS al
ON al.idLeitura = a.fk_Arduino_leitura;







