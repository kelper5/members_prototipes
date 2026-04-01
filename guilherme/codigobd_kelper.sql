create database Kelper;
	


-- Tabela usuário para armazenar os valores de cada piscicultor(futuros clientes da Kelper).
create table usuario(
	idUsuario 			int primary key not null, 		-- Identificador único de cada usuário.
    nome				varchar(255),				
    email				varchar(255) unique,		
    senha				varchar(255),  				
    telefone			varchar(255),				
    endereco			varchar(255),					-- Muitos usos, dentre eles a entrega do sistema. 
    Propriedade		varchar(255),				
    createdAt			datetime default(curdate()),	-- data de criação do usuário.
    updatedAt			datetime 						-- data da ultima atulização dos dados presentes, afins de auditoria e etc.
);
drop table usuario;

alter table usuario add constraint fkviveiro foreign key (nomePropiedade) references viveiro(nome);

-- 1. Populando Usuários
insert into usuario (idUsuario, nome, email, senha, telefone, endereco, nomePropiedade, createdAt) values
(1, 'Fernando Souza', 'fernando@agrofish.com', 'hash_senha_123', '11988887777', 'Rodovia SP-101, KM 20', 'Fazenda Peixe Vivo', '2024-01-10 08:00:00'),
(2, 'Beatriz Mendes', 'bia.mendes@piscis.com', 'hash_senha_456', '19977776666', 'Estrada Rural, Lote 45', 'Sítio das Águas', '2024-02-15 10:30:00');

truncate table usuario;

-- Tabela viveiro para armazenar os viveiros pertencentes de cada usuário, cada viveiro possui um sistema com 4 ou mais sensores.
create table viveiro(	
	idViveiro 			int primary key not null,		-- Identificador único de cada viveiro.
    nome				varchar(255),					
    localizacao			varchar(255),					-- localização em latitude e longitude
    largura				int,							-- valor importante para o calculo de eutrofização e afins.
    comprimento			int,							-- valor importante para o calculo de eutrofização e afins.
    profundidade		int,							-- valor importante para o calculo de eutrofização e afins.
    status				boolean,						-- valor 0 ou 1 para identificar se o viveiro está ativo ou não.
    qtPeixe				int,
    pesoMedio			decimal(10,2),                  -- valor importante para o calculo de eutrofização e afins.
    createdAt			datetime default(curdate()),	-- data de criação do viveiro.
    updatedAt			datetime						-- data da ultima atulização dos dados presentes, afins de auditoria e etc.
);
alter table viveiro add column fkidono int not null;
alter table viveiro add constraint donovi foreign key (fkidono) references usuario(idUsuario);
 
drop table viveiro;

-- 2. Populando Viveiros
-- Note que os id's e medidas variam para simular diferentes cenários de eutrofização.
insert into viveiro (idViveiro, nome, localizacao, largura, comprimento, profundidade, status, qtPeixe, pesoMedio, createdAt) values
(101, 'Tanque Norte 1', '-23.5505, -46.6333', 20, 50, 2, 1, 5000, 0.85, '2024-01-11 09:00:00'),
(102, 'Tanque Berçário', '-23.5510, -46.6340', 10, 20, 1, 1, 2000, 0.15, '2024-01-11 09:15:00'),
(103, 'Lago de Engorda', '-22.9068, -43.1729', 100, 200, 4, 1, 15000, 1.50, '2024-02-16 11:00:00');

truncate table viveiro;

-- 3. Populando Sensores

-- Tabela sensor que irá armazenar os dados de cada sensor presente dentro do sistema(no minímo 4 sensores por sistema).



-- Simulando ??? sensores para o primeiro viveiro.
                   -- Sensor offline para teste 

create table sensor(
	idSensor			int primary key not null,		
    status				boolean,						
    createdAt			datetime default(curdate()),	
    updatedAt			datetime						
);



-- Simulando 4 sensores para o primeiro viveiro.
/*(insert into sensorTemp (idSensor, status, createdAt) values
1, 1, '2024-01-11 10:00:00'),
(2, 1, '2024-01-11 10:00:00'),
(3, 1, '2024-01-11 10:00:00'),
(4, 0, '2024-01-11 10:00:00');  */                         -- Sensor offline para teste 

-- Tabela leitura que armazena todas as leituras feitas pelos sensores.
create table leitura(
	idLeitura 			int primary key not null,		-- Identificador único de cada leitura.
    dado 		        float , 					-- Valor para armazenar todos os valores obtidos pelos sensores em lúmens.
    createdAt 			datetime default(curdate())						-- Data de quando a leitura foi feita
);

drop table leitura;

-- 4. Populando Leituras (Intensidade em Lúmens)
insert into leitura (idLeitura, intensidade, createdAt) values
(1, 1500.50, '2026-03-02 10:00:00'), -- Leitura Normal
(2, 400.20, '2026-03-02 11:00:00'),  -- Baixa luminosidade 
(3, 2800.00, '2026-03-02 12:00:00'), -- Alta incidência solar
(4, 150.00, '2026-03-02 13:00:00');  -- Queda crítica

truncate table leitura;

-- Tabela alerta que armazena os alertas obtidos de acordo com a média das leituras.
create table alerta(
	idAlerta 			int primary key not null,		-- Identificador único de cada alerta.
    intensidade			int,					-- Média de luminosidade recebida pelo viveiro.
    temperatura         int,
    nivelRisco			varchar(50), 					-- Armazenado em (Baixo, Médio e Grave).
    /*nivelRiscoTemp      varchar(50),*/
    analise				varchar(255),					-- Descrição sobre o alerta.
    createdAt			datetime,					    -- Data de quando o alerta foi feito
    
    constraint chk_nivelRisco check(nivelRisco in ("Baixo", "Médio", "Grave")),
    constraint chk_nivelRisco check(nivelRiscoTemp in ("Baixo", "Médio", "Grave"))
);

alter table alerta add constraint lumi foreign key (intensidade) references leitura(intensidade);
alter table alerta add constraint temp foreign key (temperatura) references leitura(temperatura);

drop table alerta;


-- 5. Populando Alertas
insert into alerta (idAlerta, intensidade, temperatura, nivelRisco, /*nivelRiscoTemp*/analise, createdAt) values
(1, 150.00, 28, 'Grave', 'Baixa luminosidade extrema detectada e temperatura elevada. Risco de bloom de algas ou alta turbidez.', '2026-03-02 13:05:00'),
(2, 400.20, 'Médio', 'Luminosidade abaixo da média ideal para a espécie Tilápia.', '2026-03-02 11:05:00'),
(3, 1500.00, 'Baixo', 'Níveis de luz estáveis dentro dos parâmetros operacionais.', '2026-03-02 10:05:00');

truncate table alerta;

-- | SELECTS | --
select * from usuario;

select * from viveiro;

select * from sensor;

select * from leitura;

select * from alerta;