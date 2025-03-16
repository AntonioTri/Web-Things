CREATE DATABASE IF NOT EXISTS Ripetizione ;
use DATABASE  Ripetizione;
 
 CREATE TABLE PRODOTTI(
    ID_prodotti int PRIMARY KEY ,
    nome varchar(20),
    descrizione VARCHAR (20),
    prezzo FLOAT (7,3),
    categoria varchar(20),
    disponibilita BOOLEAN 
 );

  CREATE TABLE clienti(
    ID_clienti int PRIMARY KEY ,
    nome varchar(20),
    cognome VARCHAR (20),
    email varchar(40),
    telefono  varchar(20),
    indirizzo VARCHAR(20)
 );

 CREATE TABLE ordini(
    ID_ordini int PRIMARY KEY ,
    id_clienti int NOT NULL,
    data_ordine varchar(20),
    stato VARCHAR (20),
    totale  FLOAT (7,3),
    CONSTRAINT uo FOREIGN KEY  (id_clienti) REFERENCES clienti(ID_clienti)
 );

 CREATE TABLE dettagli(
    ID_dettagli int PRIMARY KEY ,
    id_ordini int NOT NULL,
    id_prodotto int NOT NULL,
    quantita int (20),
    prezzo_unitario FLOAT (7,3),
    CONSTRAINT ou FOREIGN KEY (id_ordini) REFERENCES ordini(ID_ordini),
    CONSTRAINT io FOREIGN KEY (id_prodotto) REFERENCES PRODOTTI(ID_prodotti)
 );


INSERT INTO PRODOTTI (ID_prodotti,nome,descrizione,prezzo,categoria,disponibilita) VALUES (1,'pasta','dececco',2.00,'cibo','true');
INSERT INTO clienti(id_clienti, nome, cognome, email, telefono, indirizzo) VALUES (2,'Mario','Rossi','mario@gmail.com','371367777','via Tevere 5');
INSERT INTO ordini (id_ordini, id_clienti, data_ordine, stato, totale) VALUES (3,2,'12/05/2024','spedito',100.000);
INSERT INTO dettagli(id_dettagli, id_ordini, id_prodotto, quantita, prezzo_unitario) VALUES (4,3,1,1,2.00);


select X.nome ,X.totale ,X.cognome,Z.nome 
            from (
                select nome,cognome,totale,id_ordini
                from clienti 
                join (  select * 
                        from ordini 
                        where ordini.totale >= 3
                        ) AS Y on clienti.id_clienti=Y.id_clienti

) as X  join (

        select *
        from PRODOTTI 
        join dettagli 
        on PRODOTTi.id_prodotti= dettagli.id_prodotto

) as Z on X.id_ordini=Z.id_ordini;



SELECT Y.tot,X.tipo,C.nome,C.cognome FROM 
((SELECT SUM(totale) AS tot, id_prenotazione FROM Pagamento Group BY id_prenotazione)AS Y
JOIN 
(Select Q.tipo,P.id_prenotazione,P.id_cliente
From (Puo_avere 
   Join Prenotazione 
         on Puo_avere.id_prenotazione = Prenotazione.id_prenotazione) AS P  
         JOIN (SELECT * 
               From Aggiungi 
               where tipo='WiFi') AS Q 
         ON P.nro_camera=Q.nro_camera) AS X
      ON Y.id_prenotazione=X.id_prenotazione) AS W

JOIN Cliente AS C 
ON W.id_cliente=C.id_cliente;


   