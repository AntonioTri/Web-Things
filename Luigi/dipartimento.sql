-- Creazione del database
CREATE DATABASE IF NOT EXISTS azienda;
USE azienda;

-- Creazione della tabella Dipartimenti
CREATE TABLE Dipartimenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Creazione della tabella Impiegati
CREATE TABLE Impiegati (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    stipendio DECIMAL(10,2),
    dipartimento_id INT,
    FOREIGN KEY (dipartimento_id) REFERENCES Dipartimenti(id)
);

-- Inserimento dati nella tabella Dipartimenti
INSERT INTO Dipartimenti (nome) VALUES ('IT'), ('HR'), ('Vendite');

-- Inserimento dati nella tabella Impiegati
INSERT INTO Impiegati (nome, stipendio, dipartimento_id) VALUES
('Mario Rossi', 3000, 1),
('Luca Bianchi', 2500, 2),
('Anna Verdi', 2800, 1),
('Giulia Neri', 3200, 3),
('Paolo Gialli', 2900, 2);

-- Query innestata: conta il numero di impiegati per dipartimento
SELECT d.nome, COUNT(i.id) AS numero_impiegati 
FROM Dipartimenti d 
LEFT JOIN Impiegati i ON d.id = i.dipartimento_id 
GROUP BY d.nome;

-- Query innestata: somma degli stipendi per dipartimento
SELECT d.nome, SUM(i.stipendio) AS totale_stipendi 
FROM Dipartimenti d 
LEFT JOIN Impiegati i ON d.id = i.dipartimento_id 
GROUP BY d.nome;

-- Query innestata con condizione: trova il numero di impiegati con stipendio sopra la media
SELECT COUNT(*) AS impiegati_sopra_media 
FROM Impiegati 
WHERE stipendio > (SELECT AVG(stipendio) FROM Impiegati);

-- Query innestata con più condizioni: trova i dipartimenti con più di un impiegato
SELECT d.nome 
FROM Dipartimenti d 
WHERE (SELECT COUNT(*) FROM Impiegati i WHERE i.dipartimento_id = d.id) > 1;