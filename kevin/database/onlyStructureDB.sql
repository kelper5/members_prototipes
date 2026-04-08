CREATE DATABASE Kelper;
USE Kelper;

CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
    logradouro VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado_sigla CHAR(2),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cnpj CHAR(14) UNIQUE, 
    fk_matriz INT, 
    fk_endereco INT,
    numero VARCHAR(10),
    complemento VARCHAR(10),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empresa_matriz FOREIGN KEY (fk_matriz) REFERENCES empresa(idEmpresa),
    CONSTRAINT fk_empresa_cep FOREIGN KEY (fk_endereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cpf CHAR(14) UNIQUE,
    senha_hash VARCHAR(255),
    fk_empresa INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updadtedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE viveiro (
    idViveiro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    fk_empresa INT,
    latitude DECIMAL(10, 8), 
    longitude DECIMAL(11, 8),
    status_atividade BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_viveiro_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    fk_viveiro INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sensor_viveiro FOREIGN KEY (fk_viveiro) REFERENCES viveiro(idViveiro)
);

CREATE TABLE sensor_data(
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(10, 2),
    luminosidade DECIMAL(10, 2),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_sensor INT,
    CONSTRAINT fk_leitura_sensor FOREIGN KEY (fk_sensor) REFERENCES sensor(idSensor)
);

insert into endereco
            velues( default, "05080154", "Rua Jardim Lindosa", "Umuarama", "Osasco", "SP", default, default),
( default, "04098132", "Av Alameda Das Maçãs", "Veloso", "Osasco", "SP", default, default),
( default, "04081050", "Rua Amarguês Pereira", "Padroeira", "Osasco", "SP", default, default),
( default, "04067041", "Rua Lin Ydna", "Vila Yara", "Osasco", "SP", default, default);

insert into empresa
            values(default, "Abidas", "176.583.652-17"

