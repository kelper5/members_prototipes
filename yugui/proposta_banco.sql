DROP DATABASE IF EXISTS kelper;
CREATE DATABASE kelper;
USE kelper;
                      
CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(50) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(128) NOT NULL,
    codigo_ativacao VARCHAR (50) UNIQUE,
	fk_matriz INT, 
    CONSTRAINT fk_matriz FOREIGN KEY (fk_matriz) REFERENCES empresa(id)
    ON DELETE SET NULL
);

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(128) NOT NULL,
    fk_empresa INT NOT NULL,
    CONSTRAINT fk_usuario_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);
                         
CREATE TABLE viveiro (
    id INT PRIMARY KEY AUTO_INCREMENT,
	biomassa INT NOT NULL,
    fk_empresa INT NOT NULL,
    CONSTRAINT fk_viveiro_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);
                 	
CREATE TABLE captura (
    id INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DECIMAL(3, 1) NOT NULL,
    luminosidade DECIMAL(7, 1) NOT NULL,
	momento DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_arduino BOOLEAN DEFAULT TRUE,
	fk_viveiro INT NOT NULL,
    CONSTRAINT fk_medida_viveiro FOREIGN KEY (fk_viveiro) REFERENCES viveiro(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,		
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,	
	nivel_risco VARCHAR(10),
	fk_usuario INT NOT NULL,
	CONSTRAINT chk_nivel_risco CHECK(nivel_risco in ("Moderado", "Grave")),
    CONSTRAINT fk_aviso_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
 );