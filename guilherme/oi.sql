create user user_insert;

create database Kelper;
use Kelper;

create table sensor(
	idSensor			int primary key not null,		
    status				boolean,						
    createdAt			datetime default(curdate()),	
    updatedAt			datetime						
);

create table leitura(
	idLeitura 			int primary key not null,		-- Identificador único de cada leitura.
    leitura_sensor		float,       					-- Valor para armazenar todos os valores obtidos pelos sensores em lúmens.
    createdAt 			datetime default(curdate())						-- Data de quando a leitura foi feita
);



GRANT INSERT ON Kelper.leitura TO user_insert;
update user set password = urubu100 where user_insert;
