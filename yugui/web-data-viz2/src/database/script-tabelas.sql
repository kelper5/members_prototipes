DROP DATABASE IF EXISTS kelper;
CREATE DATABASE kelper;
USE kelper;

CREATE TABLE endereco (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL UNIQUE
);
                      
CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(50) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE, 
    codigo_ativacao VARCHAR (50) NOT NULL UNIQUE,
    fk_matriz INT NULL,
    fk_endereco INT NOT NULL,
    complemento_imovel VARCHAR(10) NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_endereco) REFERENCES endereco(id),
    FOREIGN KEY (fk_matriz) REFERENCES empresa(id)
    ON DELETE SET NULL
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(128) NOT NULL,
    fk_empresa INT NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE viveiro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    biomassa_media DECIMAL(6, 2) NOT NULL,
    fk_empresa INT NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE arduino (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_viveiro INT NOT NULL,
    status_arduino BOOLEAN DEFAULT TRUE NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    atualizado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_viveiro) REFERENCES viveiro(id)
);

CREATE TABLE captura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(3, 1) NOT NULL,
    luminosidade DECIMAL(7, 1) NOT NULL,
    fk_arduino INT NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (fk_arduino) REFERENCES arduino(id)
);

CREATE VIEW vw_empresas AS
SELECT id, razao_social, cnpj, codigo_ativacao, fk_matriz 
FROM empresa;

INSERT INTO empresa(razao_social, cnpj, codigo_ativacao, fk_matriz)
VALUES("Kelper", "34233454545", "dh6543fdgbck8DS1", null);