# USE books;

# SELECT * FROM tbuch;

-- SELECT * FROM tvautor ORDER BY buchnr;

-- Übung 8.5.2
-- SELECT tbuch.buchnr, preis,tvautor.autornr FROM tbuch
-- INNER JOIN tvautor ON tbuch.buchnr = tvautor.Buchnr
-- INNER JOIN tautor ON tvautor.autornr = tautor.autornr
-- WHERE tautor.Autor = 'Boell' AND tvautor.Lfdnr = 1;

-- Übung 8.7.1
SELECT tbuch.buchnr, SUM(praemie), AVG(praemie), COUNT(autornr)
FROM tbuch INNER JOIN tvautor 
ON tbuch.buchnr = tvautor.buchnr
GROUP BY tbuch.buchnr;

-- Übung 8.7.2
-- Schritt 1:
-- Buchnr, Titel, Anzahl isbns
select tbuch.buchnr, titel, count(isbn)
FROM tbuch INNER JOIN tisbn 
ON tbuch.buchnr = tisbn.buchnr
GROUP BY tbuch.buchnr;
-- Schritt 2: 
-- buchnr, titel, anzahl autoren, summe und durchschnitt praemien
SELECT tbuch.buchnr, titel, COUNT(autornr), SUM(praemie), AVG(praemie)
FROM tbuch INNER JOIN tvautor 
ON tbuch.buchnr = tvautor.buchnr
GROUP BY tbuch.buchnr;

-- Schritt 3: 
-- -> kombiniere beide Select Statements 
SELECT * FROM 
-- "nested table expression"
-- -> select im select
( SELECT tbuch.buchnr, titel, count(isbn)
FROM tbuch INNER JOIN tisbn 
ON tbuch.buchnr = tisbn.buchnr
GROUP BY tbuch.buchnr ) temp_table_a -- name der nested table expression
INNER JOIN 
-- "nested table expression"
(SELECT tbuch.buchnr, titel, COUNT(autornr), SUM(praemie), AVG(praemie)
FROM tbuch INNER JOIN tvautor 
ON tbuch.buchnr = tvautor.buchnr
GROUP BY tbuch.buchnr) temp_table_b
ON temp_table_a.buchnr = temp_table_b.buchnr;

-- Subqueries -> SELECT in der WHERE clause
-- Bsp 1 Bücher, die teurer als der Durchschnitt sind
SELECT titel, preis FROM tbuch
WHERE preis > 
-- subquery
(SELECT AVG(preis) FROM tbuch);
-- Alternative mit Inner Join und nested table expression
SELECT titel, preis FROM tbuch
INNER JOIN (SELECT AVG(preis) AS durchschnitt FROM tbuch) a
ON tbuch.preis > a.durchschnitt; 

-- Bsp 2 : Buchnr, Titel aller Bücher des Autors "Grass"
SELECT buchnr, titel
FROM tbuch
WHERE buchnr IN 
	(SELECT buchnr FROM tvautor
	WHERE autornr = 
		(SELECT autornr FROM tautor
		WHERE autor = 'Grass'));

-- Bsp 3: die titel aller Bücher mit mehr als einer ISBN Nummer
SELECT titel FROM tbuch
WHERE buchnr IN 
	(SELECT buchnr FROM tisbn
	 GROUP BY buchnr 
	 HAVING COUNT(isbn) > 1
	 );
	 
-- Bsp 4: Die Namen aller Autoren
-- die mehr als ein Buch veröffentlicht haben:
SELECT autor FROM tautor
WHERE autornr IN 
	(SELECT autornr FROM tvautor
	GROUP BY autornr
	HAVING COUNT(buchnr) > 1);

-- Bsp. 5 Die ISBN-Nummern aller Bücher des Autors "Grass"
SELECT tisbn.Isbn FROM tisbn
WHERE buchnr IN 
	(SELECT buchnr FROM tvautor 
	 WHERE autornr in
	 	(SELECT autornr FROM tautor
	 	WHERE autor = 'Grass'));
	
-- Bsp. 6 Name des Autors und Anzahl der Titel für den Autor "Grass"
SELECT autor,titel, COUNT(tvautor.Buchnr) FROM tautor
INNER JOIN tvautor 
ON tautor.autornr = tvautor.Autornr
INNER JOIN tbuch
ON tvautor.Buchnr = tbuch.buchnr
WHERE autor = "Grass"
GROUP BY tvautor.autornr, tbuch.titel;

-- die folgende Befehle kann nur der user 'root' ausführen:
-- erzeuge einen Benutzer dieser Datenbank mit namen und passwort
-- DROP USER edgar;
CREATE USER edgar IDENTIFIED BY 'edgar';

CREATE DATABASE edgars_database;

-- weise edgar Rechte auf der Datenbank edgars_database zu
GRANT SELECT ON edgars_database.* TO edgar;
GRANT CREATE ON edgars_database.* TO edgar;
GRANT INSERT ON edgars_database.* TO edgar;
GRANT UPDATE ON edgars_database.* TO edgar;
GRANT DELETE ON edgars_database.* TO edgar;
GRANT DROP ON edgars_database.* TO edgar;
GRANT CREATE VIEW ON edgars_database.* TO edgar;

-- Ende root section

USE edgars_database;
DROP TABLE konto;
CREATE TABLE konto (id INT PRIMARY KEY, saldo DECIMAL(10,2), kunde INT references Kunde(id));

SELECT * FROM konto;
INSERT INTO konto VALUES (100,5.55,200);
INSERT INTO konto VALUES (101,0.00,201);
INSERT INTO konto VALUES (102,9.99,201);
INSERT INTO konto VALUES (103,0.00,NULL);


DELETE FROM konto WHERE id = 100;

CREATE TABLE kunde(id INT PRIMARY KEY, NAME VARCHAR(20));
INSERT INTO kunde VALUES (200,'Dragos');
INSERT INTO kunde VALUES (201,'Ayoub');
INSERT INTO kunde VALUES (202,'Emmanuel');

SELECT * FROM kunde;

-- Inner Join über konto und kunde
SELECT * FROM konto INNER JOIN kunde ON konto.kunde = kunde.id;
-- wie oben, left outer Join 
SELECT * FROM konto LEFT OUTER JOIN kunde ON konto.kunde = kunde.id;
-- wie oben, right outer Join 
SELECT * FROM konto RIGHT OUTER JOIN kunde ON konto.kunde = kunde.id;
-- full outer join mit union:
SELECT * FROM konto LEFT OUTER JOIN kunde ON konto.kunde = kunde.id
UNION
SELECT * FROM konto RIGHT OUTER JOIN kunde ON konto.kunde = kunde.id;

-- erzeuge eine sog. view:
-- id und name aller kunden sowie die nummern aller ihrer Konten (ohne salden)
CREATE VIEW kunde_konten 
as
SELECT kunde.id AS kunden_nummer,kunde.name, konto.id AS konto_nummer 
FROM konto INNER JOIN Kunde 
ON Konto.kunde = kunde.id;

SELECT * FROM kunde_konten;

SET @@session.autocommit = 0;
SELECT * FROM konto;
UPDATE konto SET saldo = saldo + 100 WHERE id = 100;
-- schreibe alle Transaktionen bis jetzt fest:
COMMIT;

-- alle Transkationen bis zum letzten Commit rückgängig machen:
ROLLBACK;



