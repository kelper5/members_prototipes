CREATE DATABASE Kelper;
USE Kelper;

CREATE TABLE endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
                      
CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(50) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL, 
    fkMatriz INT, 
    fkEndereco INT NOT NULL,
    numero VARCHAR(10) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    codigo CHAR (16) NOT NULL UNIQUE,
    CONSTRAINT fk_matriz FOREIGN KEY (fkMatriz) REFERENCES empresa(id),
    CONSTRAINT fk_endereco FOREIGN KEY (fkEndereco) REFERENCES endereco(id)
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    senha VARCHAR(120) NOT NULL,
    fkEmpresa INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_empresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(id)
);

CREATE TABLE viveiro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fkEmpresa INT NOT NULL,
    biomassa INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(id)
);

CREATE TABLE sensor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fkViveiro INT NOT NULL,
    statusSensor BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_viveiro FOREIGN KEY (fkViveiro) REFERENCES viveiro(id)
);

CREATE TABLE sensor_leitura(
    id INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(3, 1) NOT NULL,
    luminosidade INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT NOT NULL,
    CONSTRAINT fk_Arduino FOREIGN KEY (fkSensor) REFERENCES sensor(id)
);
-- COLOCAR DEPOIS
CREATE TABLE alerta(
	id		INT PRIMARY KEY NOT NULL,		
	fk_arduino_leitura INT NOT NULL,
    createdAt			DATETIME DEFAULT CURRENT_TIMESTAMP,	
    nivelRisco CHAR(5),
	CONSTRAINT chk_nivelRisco CHECK(nivelRisco in ("Médio", "Grave")),
    CONSTRAINT fk_leitura_arduino FOREIGN KEY (fk_arduino_leitura) REFERENCES arduino_leitura(idLeitura)
 );