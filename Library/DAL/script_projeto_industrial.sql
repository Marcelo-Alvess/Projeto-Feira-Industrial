
USE VotacaoProjetos
go

DROP TABLE Avalaicao_Projeto
go

DROP TABLE Projeto_Criterio_Avaliacao
go

DROP TABLE Criterio_Avaliacao
go

DROP TABLE Projeto
go

DROP TABLE Usuario
go

USE VotacaoProjetos
go



CREATE TABLE Usuario
(
	cpf_usu				varchar(11)						not null primary key,
	nm_usu				varchar(50)						not null
);
go

CREATE TABLE Projeto
(
	id_proj				int				identity(1,1)	not null primary key,
	nm_proj				varchar(150),
	ds_proj				varchar(150),
	sala_proj			varchar(150),
	tur_proj			varchar(150),
	bl_ativo			bit default (1)
);
go


CREATE TABLE Criterio_Avaliacao
(
	id_criterio_av		int				identity(1,1)	not null primary key,
	ds_criterio_av		varchar(20),
	pes_criterio_av		int
);
go

CREATE TABLE Projeto_Criterio_Avaliacao
(
	id_criterio_av		int		not null constraint crit_av_fk		foreign key (id_criterio_av)	references Criterio_Avaliacao (id_criterio_av), 
	id_proj				int		not null constraint proj_av_fk		foreign key (id_proj)			references Projeto (id_proj)
);
go 

CREATE TABLE Avalaicao_Projeto
(
	id_criterio_av		int								not null,
	id_proj				int								not null,
	cpf_usu				varchar(11)						not null,
	not_ava				int								not null,
	dat_ava				datetime,
	obs_ava				varchar(40),

	constraint av_proj_pk	primary key (id_criterio_av, id_proj, cpf_usu)
);
go

--INSERT INTO Usuario
--VALUES
--('49851482889', 'Lucas Carlos de Souza'),
--('50329908847', 'Davi Damasio');
--go

INSERT INTO Criterio_Avaliacao (ds_criterio_av)
VALUES
('Organiza��o'),
('Comunica��o'),
('Conhecimento T�cnico');
go

INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1AI - INTERNET DAS COISAS - LAB INFO 04','Guilherme Carvalho Vieira Santos', 'Lab Info 04','Etim Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1AL - A��O DE RECRUTAMENTO - SALA 15','F�bio Gama e Rosieli Valejo Assueiro', 'Sala 15','Etim de Log�stica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1AL - QUEM QUER SER CONTRATADO? - SALA 15','F�bio Henrique', 'Sala 15','Etim de Log�stica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1AM - FONTES DE ENERGIA SUSTENT�VEIS. - SALA 25','', 'Sala 25','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1AM - TRANSFORMA��ES ESTRUTURAIS DOS A�OS - SALA 25','Tiago Gomes', 'Sala 25','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1BI - DESMISTIFICADO O BITCOIN - SALA 05','Mois�s', 'Sala 05','Etim Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1BM - RECICLAGEM - HALL EST�GIO','M�rcia', 'Hall Est�gio','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1D - CARMOSINA - LINHA DO TEMPO DA ADMINISTRA��O - SALA 03','Deise Faria, Nivaldo Troiano, Jo�o
Alves e demais professores que se envolver�o no processo', 'Sala 03','Administra��o / RH')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1LT - APRESENTA��O DE PAINEL DE FUNCIONAMENTO DE CIRC - LAB. AUTOMA��O','Tiago da Cruz Gomes', 'Lab. Automa��o','Etim Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1M - DIVULGA��O DO VESTIBULINHO - HALL ENTRADA','MARCO AURELIO / LUIZ BEZERRA', 'Hall Entrada','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1MA - DIVULGA��O DA FEIRA DO INDUSTRIAL - HALL ENTRADA','Eliene Ronqui', 'Hall Entrada','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1N - LOG�STICA DO AVI�O - SALA 16','Marco', 'Sala 16','Log�stica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1P - DIREITOS TRABALHISTAS E IMPOSTOS FISCAIS - SALA 17','Imp�rio Lombardi e Maria In�s', 'Sala 17','Contabilidade')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1P - PROFISSIONAL DA CONTABILIDADE - SALA 17','Profa. Maria In�s e Prof. Imp�rio
Lombardi', 'Sala 17','Contabilidade')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1Q - COMPONENTES DE DESENVOLVIMENTO DE SISTEMAS - LAB. INFO 07','', 'Lab. Info 07','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1S - ENERGIA E�LICA - SALA 13','Alexandre', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1S - GERADOR DE CAMPO VOTAICO - SALA 13','Rodrigo', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1S - MINI BOBINA DE TESLA - SALA 13','Rodrigo', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1S - MINI USINA HIDR�LETRICA - SALA 13','Rodrigo', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1S - MOTOR COM CILINDRO ELETROMAGNETICO - CORREDOR','Rodrigo Crisostomo', 'Corredor','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1S - PERGUNTA E RESPOSTA COM ILUMINA��O NA RESPOSTA - CORREDOR','Rodrigo', 'Corredor','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1VENCE - FABRICA DE COSM�TICOS - SALA 19','F�bio Gama , Carlos', 'Sala 19','Etim de Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AE - FLAUTA ELETR�NICA - SALA 04','Helton dos', 'Sala 04','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AI - OFICINA ARDUINO - SALA 12','Marco Ant�nio', 'Sala 12','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AI - SEGURAN�A E PRIVACIDADE NA INTERNET - SALA 12','Mois�s', 'Sala 12','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AI - TRUCO ADVENTURES - SALA 12','Marco Antonio Gomes', 'Sala 12','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AL - LOG�STICA DO CINEMA - SALA 09','Rosieli Valejo Assueiro', 'Sala 09','Etim de Log�stica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AM - AUTOMA��O - PNEUM�TICA - OFICINA','Tiago Cruz Gomes', 'Oficina','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2AM -  - OFICINA','', 'Oficina','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2BE - AUTOMA��O RESIDENCIAL SIMPLIFICADA - SALA 04','', 'Sala 04','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2BE - AUTOMA��O RESIDENCIAL SIMPLIFICADA - SALA 04','', 'Sala 04','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2BE - LAN�ADOR DE DARDOS - SALA 04','Professor Helton', 'Sala 04','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2BM - O QUE VOC�S EST�O FAZENDO CONOSCO ? - AUDIT�RIO 02','Carmem Bassi e Carlos Antonio Baffi', 'Audit�rio 02','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2F - LIGABUE - INCLUS�O SOCIAL NO MERCADO DE TRABALHO - SALA 08','Nanci Alencar ,', 'Sala 08','Adm / Log / DS')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2H - LINHA DE PRODU��O. - SALA 20','Itamar', 'Sala 20','')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2LT - APRESENTA��O DE CIRCUITOS ELETROPNEUM�TICOS - LAB. AUTOMA��O','Jos� Carlos Pratis', 'Lab. Automa��o','')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2M - FRANQUIA, UMA OPORTUNIDADE PARA O SUCESSO - SALA 22','Deise', 'Sala 22','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2MA - PATENTE - SALA 14','Viviane Rodrigues', 'Sala 14','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2N - PROCESSO DE INTROLOG�STICA NA PRODU��O DE ALIMENTOS. - SALA 11','Cl�udio Eduardo', 'Sala 11','Log�stica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2P - EMPRESA HOR�CIO J�NIOR - SALA 18','Glauco M. Hamanaka e Rubens
Ferraresi', 'Sala 18','Contabilidade')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2Q - TI ALIADA  NA EDUCA��O - LAB. INFO 02','Quit�ria Danno', 'Lab. Info 02','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - AQUECEDOR INDUTIVO - CORREDOR','Prefessora Ermelinda', 'Corredor','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - AUTOMA��O PREDIAL - SALA 13','Rodrigo', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - GERADOR TERMOLETRICO - SALA 04','Gerson', 'Sala 04','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - GUERRA DE ROBO - QUIOSQUE','', 'Quiosque','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - INTRUMENTOS DE MEDI��ES - SALA 13','Gerson', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - PESCARIA MAGN�TICA - SALA 13','Professora Ermelinda.', 'Sala 13','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2S - SISTEMA DE PRETE��O POR AQUECIMENTO - SALA 04','', 'Sala 04','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2T - DESENHO AUXILIADO POR COMPUTADOR. - LAB. INFO 06','Wesley David e Afonso Nelson.', 'Lab. Info 06','Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2U - BRA�O ROB�TICO. - OFICINA','Jos� Augusto Trovato.', 'Oficina','Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2U - SISTEMAS DE TRANSMISS�O  MEC�NICA. - OFICINA','Oswaldo Veglione.', 'Oficina','Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('2V - LE FUNDUE DE L`AMOUR - SALA 06','Rosiele Assuero', 'Sala 06','Etim de Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AE - COMPOSTEIRA AUTOMATIZADA - CORREDOR','Helton Almeida dos Santos e
Emerson da Silva', 'Corredor','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AE - GELADEIRA INTELIGENTE - CORREDOR','Helton e Emerson', 'Corredor','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AE - SCANNER DE MELANOMA - CORREDOR','Helton Almeida e Emerson', 'Corredor','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AE - SISTEMA DE CULTIVO AUTOMATIZADO - CORREDOR','Helton Almeida e Emerson Santana', 'Corredor','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AE - TENS - CORREDOR','Professor Msc Helton Almeida dos
Santos e Professor Emerson Santana', 'Corredor','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI - APOLO LEITURA DE MONOGRAFIAS - LAB. INFO 8 + HALL BIBLIOTECA','Adriano Kleber Milanez e Marco
Antonio Gomes', 'Lab. Info 8 + Hall Biblioteca','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI - FRN - FORMATA��O R�PIDA NAS NORMAS (ABNT) - LAB. INFO 8 + HALL BIBLIOTECA','Adriano Milanez, Marco Antonio', 'Lab. Info 8 + Hall Biblioteca','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI - HAS SMART PARKING - LAB. INFO 8 + HALL BIBLIOTECA','Marco Antonio Gomes e Adriano
Milanez', 'Lab. Info 8 + Hall Biblioteca','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI - JOBTEC - LABOLAT�RIO 8 / BIBLIOTECA','Adriano e Marco', 'Labolat�rio 8 / Biblioteca','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI - JUKEJOB - CORREDOR','Marco Ant�nio, Adriano Milanez', 'Corredor','Etim Eletr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI - PROJETO ATHENAS - LAB. INFO 8 + HALL BIBLIOTECA','Marco Antonio,Adriano Milenez', 'Lab. Info 8 + Hall Biblioteca','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AI -  - LAB. INFO 8 + HALL BIBLIOTECA','Marco Antonio Gomes e Adriano
Milanez', 'Lab. Info 8 + Hall Biblioteca','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AL - SALA TEM�TICA,  INSIPIRADA NA GOOGLE. - SALA 21','Fabio Henrique e Vanessa', 'Sala 21','Etim de Log�stica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3AM - TRICICLO ANF�BIO. - OFICINA','Oswaldo Veglione; Tiago Gomes.', 'Oficina','Etim Mec�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - BICEEX - LAB. INFO 8','Adriano Kl�ber Milanez e Edson de
Oliveira', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - FORCE FIELD - LAB. INFO 8','Edson Oliveira e Adriano Millanez', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - MURAL VIRTUAL - LAB. INFO 8','Edson e Adriano', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - POP SALE - LAB. INFO 8','Edson Oliverira e Adriano Millanez', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - POPSALE TCC - LAB. INFO 8','Adriano Milanez e Edson Oliveira', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - PROHOME - LAB. INFO 8','Adriano Milanez e Edson de Oliveira', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - TROK - LAB. INFO 8','Adriano Milanez, Edson de Oliveira', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3BI - WORKTALKIE - LAB. INFO 8','Edson de Oliveira e Adriano Milanez', 'Lab. Info 8','Etim de Inform�tica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3H - LABIRINTO DA EMPRESA VIRTUAL - SALA 10','F�bio Cicone', 'Sala 10','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3LT - APRESENTA��O M�QUINAS E EQUIPAMENTOS CONTROL - ','Osvaldo Vigliore Jr', '','Mecatr�nica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3M - REVOLU��ES INDUSTRIAIS - SALA 01','Robson Elias Bueno', 'Sala 01','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3MA - IND�STRIA 4.0 - SALA 02','Robson Elias Bueno', 'Sala 02','Administra��o')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3P - ASSESSORIA AO MEI - LAB. INFO 01','JEFFERSON e ROBERTO', 'Lab. Info 01','Contabilidade')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3Q - BIBLIOTECA DIGITAL - LAB. INFO 03','Valter Costa Junior', 'Lab. Info 03','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3Q - CLEAN WORLD - LAB. INFO 03','Valter Costa', 'Lab. Info 03','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3Q - FAST MOVING - LAB. INFO 03','Quit�ria', 'Lab. Info 03','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3Q - TCC - PLATPET - A PLATAFORMA  DO SEU PET - LAB. INFO 03','Valter Costa Junior', 'Lab. Info 03','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3Q - TODAS POR UMA - LAB. INFO 03','Valter', 'Lab. Info 03','Desenvolvimento de
Sistemas')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3QR - APRESENTA��O TCC - REDES - LAB. INFO 05','Guilherme Carvalho', 'Lab. Info 05','Redes de Computadores')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('3S - ESTUFA HIDROPONICA AUTOMATIZADA - CORREDOR','Guilherme da Silva Santos, Bianca
Daiane Guedes Cardoso', 'Corredor','Eletrot�cnica')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES(' - AQUECEDOR POR INDICA��O - ','', '','')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES(' - MINI EMPRESA - P�TIO','', 'P�tio','Projeto')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES(' - RESTAURA��O ECOL�GICA - ','', '','')
INSERT INTO Projeto (nm_proj, ds_proj, sala_proj, tur_proj)
VALUES('1BI - LINUX - APRESENTA��O E CARACTER�STICAS - LAB. INFO 05','Victor', 'Lab. Info 05','Redes de Computadores')
go

SELECT * FROM Projeto
WHERE bl_ativo = 1
ORDER BY nm_proj