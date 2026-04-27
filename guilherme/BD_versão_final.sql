
CREATE DATABASE Kelper;
USE Kelper;




CREATE TABLE endereco (
    idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO endereco
				VALUES(1, '12345678', default, default),
					  (2, '87654321', default, default),
                      (3, '13245673', default, default),
                      (4, '25438715', default, default),
                      (5, '91034284', default, default);
                      
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

INSERT INTO empresa
				  VALUES(1, 'Maça', '12345678000121', NULL, 1, '1234567891', default, default, '123456'),
                        (2, 'Chyiomi', '21456789000212', 1, 2, '9876543219', default, default, '654321'),
                        (3, 'Pernanbucanos', '34237752000345', 2, 3, '7635482571', default, default, '567257'),
                        (4, 'Samsungue', '56754336000490', 3, 4, '9863246467', default, default, '547248'),
                        (5, 'Microhard', '87659564000578', 4, 5, '0926735678', default, default, '963783');
                        /*(1, 'maça', '12.345.678/0001-21', NULL, 1, '1234567891', default, default, '12356'),*/


CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    senha VARCHAR(120) NOT NULL,
    fk_empresa INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updadtedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);

INSERT INTO usuario
                   VALUES(1, 'João', 'joaoemail@email.com', '12345678912', 'senha#DoJoao', 4, default, default),
                         (2, 'Maria', 'mariaemail@email.com', '09876543221', 'senha#Mamaria', 5, default, default),
                         (3, 'Pedro', 'pedroemail@email.com', '23463584275', 'senha#DoPedro', 1, default, default),
                         (4, 'Marcos', 'marcosemail@email.com', '02973974536', 'senha#DoMarcos', 3, default, default),
                         (5, 'Gisele', 'giseleemail@email.com', '16726489834', 'senha#DaGisele', 2, default, default);
						
                        
Insert into usuario 
					values(6, 'Olavio', 'olavioemail@email.com', '73647383263', 'senha#DaOlavio', 4, default, default),
                         (7, 'Matheus', 'matheusemail@email.com', '09835648372', 'senha#DaMatheus', 5, default, default);
                         


CREATE TABLE viveiro (
    idViveiro INT PRIMARY KEY AUTO_INCREMENT,
    fk_empresa INT NOT NULL,
    qtdVolume int,
    latitude DECIMAL(10, 8), 
    longitude DECIMAL(11, 8),
    status_atividade BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(idEmpresa)
);
INSERT INTO viveiro
				   VALUES(1, 3, 250, 12.09876543, 92.78465324, true, default, default),
						 (2, 1, 180, 43.68743892, 98.84665325, true, default, default),
                         (3, 5, 500, 98.36747462, 27.63894622, false, default, default),
                         (4, 2, 350, 27.74647838, 13.92463947, true, default, default),
                         (5, 4, 400, 38.74655378, 19.83621899, true, default, default);
                 	

CREATE TABLE arduino (
    idArduino INT PRIMARY KEY AUTO_INCREMENT,
    fk_viveiro INT NOT NULL,
    status_arduino BOOLEAN DEFAULT TRUE,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_viveiro FOREIGN KEY (fk_viveiro) REFERENCES viveiro(idViveiro)
);

INSERT INTO arduino
                   VALUES(1, 4, true, default, default),
                         (2, 3, false, default, default),
                         (3, 5, true, default, default),
                         (4, 2, true, default, default),
                         (5, 1, true, default, default);

CREATE TABLE arduino_leitura(
    idLeitura INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(3, 1) NOT NULL,
    luminosidade INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_Arduino INT NOT NULL,
    CONSTRAINT fk_Arduino FOREIGN KEY (fk_Arduino) REFERENCES arduino(idArduino)
);

INSERT INTO arduino_leitura
                           VALUES(1, 00.0, 0, default, 2),
                                 (2, 30.1, 500, default, 4),
                                 (3, 18.7, 800, default, 1),
                                 (4, 15.3, 1300, default, 5),
                                 (5, 25.8, 1800, default, 3);
                                 
truncate table arduino_leitura;
select idLeitura, concat(temperatura, " C º") Temperatura,  luminosidade, createdAt,fk_Arduino From arduino_leitura;

       CREATE TABLE alerta(
	idAlerta 			INT PRIMARY KEY NOT NULL,		
	fk_arduino_leitura INT NOT NULL,
    createdAt			DATETIME DEFAULT CURRENT_TIMESTAMP,	
    nivelRisco VARCHAR(50),
	CONSTRAINT chk_nivelRisco CHECK(nivelRisco in ("Baixo", "Médio", "Grave")),
    CONSTRAINT fk_leitura_arduino FOREIGN KEY (fk_arduino_leitura) REFERENCES arduino_leitura(idLeitura)
 );

 INSERT INTO alerta
                   VALUES(1, 3, default, "Baixo"),
                         (2, 5, default, "Médio"),
                         (3, 2, default, "Grave"),
                         (4, 1, default, null),
                         (5, 4, default, "Baixo");
                         

SELECT * FROM endereco;
SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM viveiro;
SELECT * FROM arduino;
SELECT * FROM arduino_leitura;
SELECT * FROM alerta;

/*SELECT em.nome_empresa, u.nome_usuario, u.cpf, v.idViveiro, a.idArduino, al.luminosidade, al.temperatura, ta.nivelRisco
FROM empresa as em
JOIN usuario as u
on em.idEmpresa = u.fk_empresa
JOIN viveiro as v
on v.fk_empresa = em.idEmpresa
join arduino as a
on a.fk_viveiro = v.idViveiro
join arduino_leitura as al
on al.fk_arduino = a.idArduino
JOIN alerta as ta
on ta.fk_arduino_leitura = al.idLeitura;*/ 

SELECT em.nome_empresa, u.nome_usuario, v.idViveiro
FROM empresa as em
JOIN usuario as u
ON em.idEmpresa = u.fk_empresa
JOIN viveiro as v
ON em.idEmpresa = v.fk_empresa;


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







