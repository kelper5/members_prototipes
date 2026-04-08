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
    numero VARCHAR(11),
    complemento VARCHAR(10),
    codigoAcesso CHAR(7) not null unique key,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_matriz INT,
	fk_endereco INT,
    CONSTRAINT fk_empresa_matriz FOREIGN KEY (fk_matriz) REFERENCES empresa(idEmpresa),
    CONSTRAINT fk_empresa_cep FOREIGN KEY (fk_endereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cpf CHAR(14) UNIQUE,
    senha_hash VARCHAR(255), 
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updadtedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	fk_empresa INT,
    fk_codigo  CHAR(7) not null unique key,
    CONSTRAINT fk_usuario_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa),
    CONSTRAINT fk_codigo_empresa FOREIGN KEY (fk_codigo) REFERENCES empresa(codigoAcesso)
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
            VALUES ( default, "05080154", "Rua Jardim Lindosa", "Umuarama", "Osasco", "SP", default, default),
( default, "04098132", "Av Alameda Das Maçãs", "Veloso", "Osasco", "SP", default, default),
( default, "04081050", "Rua Amarguês Pereira", "Padroeira", "Osasco", "SP", default, default),
( default, "04067041", "Rua Lin Ydna", "Vila Yara", "Osasco", "SP", default, default);

insert into empresa
            VALUES (default, "Abidas", "176.583.652-17", "11987520475", "Al", "1234567", default, default,null, 1), 
                   (default, "SpTI", "376.569.254-19", "11945634755", "Flo", "7654321", default, default, 1, 2),
                   (default, "Nada", "376.569.254-20", "11945634756", "Flop", "7654322", default, default, 2, 3),
                   (default, "Eneles", "868.797.458-20", "11973475028", "C", "7656345", default, default, 3, 4);
                   
insert into usuario
            VALUES ( default, "gui", "oigmail.com", "546.833.309-20", "123435", default, default, 1, "1234567" ),
                   ( default, "pedro", "boagmail.com", "748.737.644-31", "12345", default, default, 2, "7654321"),
                   ( default, "lin", "legalgmail.com", "360.898.597-48", "630489", default, default, 3,"7654322"),
                   ( default, "frezza", "eissogmail.com", "456.038.406-80", "474087", default, default, 4,  "7656345");
		
insert into viveiro
            VALUES( default, "PO", 1, "-23.4567", "134.9876", true, default, default),  
                  ( default, "gi", 2, "-98.9368", "163.4764", true, default, default),  
                  ( default, "tO", 3, "-23.4569", "132.9834", true, default, default),  
                  ( default, "WO", 4, "-23.4560", "134.9878", true, default, default);  