create database if not exists Societa;
use Societa;

CREATE TABLE aziende (
	p_iva int PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	titolare VARCHAR(20) NOT NULL,
	tel VARCHAR(10) NOT NULL,
	mail VARCHAR(50),
	citta VARCHAR(10) NOT NULL,
	provincia VARCHAR(10) NOT NULL,
	via VARCHAR(30) NOT NULL,
	cap VARCHAR(5) NOT NULL,
	tipo VARCHAR(8) NOT NULL
);

CREATE TABLE dipendenti(
	matricola varchar (5) PRIMARY KEY,
	cogn varchar (10) NOT NULL,
	nome varchar (10) NOT NULL,
	tel varchar (10) NOT NULL,
	mail varchar(50) NULL,
	citta varchar (10) NOT NULL,
	provincia varchar (10) NOT NULL,
	via varchar (30) NOT NULL,
	cap varchar (5) NOT NULL,
	civico int NOT NULL,
	qual varchar (10) NOT NULL
);

CREATE TABLE progetti (
	cod int PRIMARY KEY,
	nome varchar (10) NOT NULL,
	descr varchar (100) NOT NULL,
	acronimo varchar (5) NOT NULL,
	costo DECIMAL NOT NULL,
	d_inizio date NOT NULL,
	d_cons date NOT NULL,
	p_iva int,
	matricola varchar (5),
	ruolo varchar (10) NOT NULL,
	FOREIGN KEY (p_iva) REFERENCES aziende(p_iva),
	FOREIGN KEY (matricola) REFERENCES dipendenti(matricola)
);

CREATE TABLE attivita (
	cod_at int PRIMARY KEY,
	nome varchar (10) NOT NULL,
	descr varchar (100) NOT NULL,
	tipo varchar (10) NOT NULL,
	d_ini date NOT NULL,
	d_fin date NOT NULL,
	info varchar (50) NOT NULL,
	report varchar (30) NOT NULL,
	cod int,
	FOREIGN KEY (cod) REFERENCES progetti(cod)
);

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (123456789, 'TechCorp', 'Mario Rossi', '371229980', 'info@techcorp.com', 'Milano', 'MI', 'Via Roma 10', '20100', 'Pubblica');

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo)  
VALUES (987654321, 'SSC NAPOLI', 'Aurelio De Laurentis', '3408235423', 'contact@sscnapoli.com', 'Napoli', 'NA', 'Castelvolturno', '81030', 'Privata');

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (543216789, 'Denti sani', 'Dott. Antonio Gennaro', '3528439543', NULL, 'Firenze', 'FI', 'Piazza Duomo 3', '50100', 'Privata');


INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D001', 'Rossi', 'Giulia', '3216549870', 'giulia.rossi@gmail.com', 'Milano', 'MI', 'Via Dante', '20100', 12, 'PM');

INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D002', 'Bianchi', 'Marco', '3239876541', 'marco.bianchi@outlook.com', 'Aversa', 'CE', 'Via Roma', '10100', 45, 'PM');

INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D003', 'Verdi', 'Laura', '3873214567', NULL, 'Firenze', 'FI', 'Via Garibaldi', '50100', 7, 'Analista');


INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (101, 'ZipSoft', 'Progetto per lo sviluppo di un software.', 'APL', 50000.00, '2024-01-15', '2024-12-31', 123456789, 'D001', 'Lead');

INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (102, 'New Stadio', 'Creazione nuovo stadio.', 'NS', 75000.00, '2024-03-01', '2024-11-15', 987654321, 'D002', 'PM');

INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (103, 'Ricerca', 'Progetto di ricerca cura per denti.', 'ART', 40000.00, '2024-02-20', '2024-10-30', 543216789, 'D003', 'Designer');


INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1001, 'Analisi', 'Raccolta e analisi dei requisiti.', 'Studio', '2024-01-20', '2024-02-15', 'Report dettagliato', 'report2', 101);

INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1002, 'Prototipo', 'Creazione di un prototipo iniziale.', 'Sviluppo', '2024-03-01', '2024-04-30', 'Prototipo funzionante', 'report1', 101);

INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1003, 'Ricerca', 'Studio su tecnologie ecocompatibili.', 'Ricerca', '2024-03-10', '2024-06-30', 'Report preliminare', 'report45', 102);


-- Inserimenti per la tabella aziende
INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (123123123, 'GreenTech', 'Lucia Bianchi', '3201122334', 'info@greentech.com', 'Roma', 'RM', 'Via del Corso', '00100', 'Privata');

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (456456456, 'BuildCo', 'Gianni Verdi', '3354455667', 'gianni.verdi@buildco.com', 'Torino', 'TO', 'Via Torino', '10100', 'Pubblica');

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (789789789, 'MedLab', 'Sara Rossi', '3316677889', 'contact@medlab.com', 'Napoli', 'NA', 'Via Toledo', '80100', 'Privata');

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (112233445, 'AquaFarm', 'Marco Neri', '3281234567', NULL, 'Genova', 'GE', 'Corso Italia', '16100', 'Privata');

INSERT INTO aziende (p_iva, nome, titolare, tel, mail, citta, provincia, via, cap, tipo) 
VALUES (556677889, 'SmartHome', 'Elena Blu', '3223344556', 'info@smarthome.com', 'Verona', 'VR', 'Via Mazzini', '37100', 'Pubblica');

-- Inserimenti per la tabella dipendenti
INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D004', 'Neri', 'Giovanni', '3109876543', 'giovanni.neri@company.com', 'Roma', 'RM', 'Via Appia', '00100', 45, 'Developer');

INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D005', 'Blu', 'Francesca', '3128765432', NULL, 'Firenze', 'FI', 'Via della Scala', '50100', 12, 'Designer');

INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D006', 'Rossi', 'Alessandro', '3197654321', 'alessandro.rossi@outlook.com', 'Milano', 'MI', 'Corso Venezia', '20100', 20, 'PM');

INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D007', 'Gialli', 'Anna', '3112345678', NULL, 'Torino', 'TO', 'Via Po', '10100', 30, 'Analista');

INSERT INTO dipendenti (matricola, cogn, nome, tel, mail, citta, provincia, via, cap, civico, qual) 
VALUES ('D008', 'Verdi', 'Luigi', '3187654321', 'luigi.verdi@gmail.com', 'Bologna', 'BO', 'Via Indipendenza', '40100', 15, 'Tester');

-- Inserimenti per la tabella progetti
INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (104, 'Clean Water', 'Progetto per purificazione acque.', 'CW', 60000.00, '2024-05-01', '2024-11-01', 123123123, 'D004', 'Analista');

INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (105, 'SmartCity', 'Sviluppo tecnologie per città intelligenti.', 'SC', 80000.00, '2024-04-01', '2024-12-31', 456456456, 'D005', 'Designer');

INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (106, 'HealthApp', 'App per monitoraggio salute.', 'HA', 90000.00, '2024-02-15', '2024-10-15', 789789789, 'D006', 'PM');

INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (107, 'EcoFarm', 'Progetto per fattorie ecologiche.', 'EF', 70000.00, '2024-03-01', '2024-09-30', 112233445, 'D007', 'Tester');

INSERT INTO progetti (cod, nome, descr, acronimo, costo, d_inizio, d_cons, p_iva, matricola, ruolo) 
VALUES (108, 'GreenTech Advance', 'Ampliamento infrastrutture verdi.', 'GTA', 120000.00, '2024-06-01', '2024-12-31', 556677889, 'D008', 'Lead');

-- Inserimenti per la tabella attivita
INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1004, 'Sperimentazione', 'Test di soluzioni innovative.', 'Test', '2024-05-10', '2024-07-20', 'Report di test', 'report10', 104);

INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1005, 'Implementazione', 'Sviluppo delle tecnologie previste.', 'Sviluppo', '2024-06-15', '2024-10-15', 'Prototipo avanzato', 'report11', 105);

INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1006, 'Validazione', 'Validazione dei risultati del progetto.', 'Validazione', '2024-08-01', '2024-10-01', 'Report di validazione', 'report12', 106);

INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1007, 'Raccolta Dati', 'Raccolta dati e analisi statistiche.', 'Analisi', '2024-05-01', '2024-06-30', 'Report di analisi', 'report13', 107);

INSERT INTO attivita (cod_at, nome, descr, tipo, d_ini, d_fin, info, report, cod) 
VALUES (1008, 'Presentazione', 'Condivisione dei risultati ottenuti.', 'Presentazione', '2024-11-01', '2024-11-30', 'Report finale', 'report14', 108);




SELECT titolare FROM Aziende ;
SELECT tel FROM Aziende ;
SELECT * FROM Aziende where p_iva='123456789';
SELECT tel FROM Aziende where p_iva='123456789';
SELECT * FROM Aziende JOIN Progetti WHERE Aziende.p_iva=Progetti.p_iva;
SELECT f.nome, f.cogn, f.matricola, f.cod   FROM (Progetti  Join  Dipendenti) AS f Where Progetti.matricola=Dipendenti.matricola ;
SELECT SUM (COSTO) AS  somma, p_iva FROM Progetti GROUP BY p_iva  ;
SELECT AVG (COSTO) AS media FROM Progetti;
SELECT MAX (COSTO) AS MASSIMO FROM Progetti;
SELECT MIN (COSTO) AS Minimo FROM Progetti GROUP BY p_iva;