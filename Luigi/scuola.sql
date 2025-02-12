-- Creazione del database
CREATE DATABASE IF NOT EXISTS scuola;
USE scuola;

-- Creazione della tabella Corsi
CREATE TABLE Corsi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Creazione della tabella Studenti
CREATE TABLE Studenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    eta INT,
    corso_id INT,
    FOREIGN KEY (corso_id) REFERENCES Corsi(id)
);

-- Inserimento dati nella tabella Corsi
INSERT INTO Corsi (nome) VALUES ('Matematica'), ('Informatica'), ('Fisica');

-- Inserimento dati nella tabella Studenti
INSERT INTO Studenti (nome, eta, corso_id) VALUES
('Marco Rossi', 20, 1),
('Luca Bianchi', 22, 2),
('Anna Verdi', 21, 1),
('Giulia Neri', 23, 3),
('Paolo Gialli', 24, 2);

-- Query innestata: conta il numero di studenti per corso
SELECT c.nome, COUNT(s.id) AS numero_studenti 
FROM Corsi c 
LEFT JOIN Studenti s ON c.id = s.corso_id 
GROUP BY c.nome;

-- Query innestata: età media degli studenti per corso
SELECT c.nome, AVG(s.eta) AS eta_media 
FROM Corsi c 
LEFT JOIN Studenti s ON c.id = s.corso_id 
GROUP BY c.nome;

-- Query innestata con condizione: trova il numero di studenti sopra l'età media
SELECT COUNT(*) AS studenti_sopra_media 
FROM Studenti 
WHERE eta > (SELECT AVG(eta) FROM Studenti);

-- Query innestata con più condizioni: trova i corsi con più di un iscritto
SELECT c.nome 
FROM Corsi c 
WHERE (SELECT COUNT(*) FROM Studenti s WHERE s.corso_id = c.id) > 1;