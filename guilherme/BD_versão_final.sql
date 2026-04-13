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
    nome VARCHAR(50) NOT NULL,
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
    nome VARCHAR(50) NOT NULL,
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

       create table alerta(
	idAlerta 			int primary key not null,		
	fk_arduino_leitura int,
    createdAt			datetime default current_timestamp,	
    nivelRisco varchar(50),
	constraint chk_nivelRisco check(nivelRisco in ("Baixo", "Médio", "Grave")),
    constraint fk_leitura_arduino FOREIGN KEY (fk_arduino_leitura) REFERENCES arduino_leitura(idLeitura)
 );






