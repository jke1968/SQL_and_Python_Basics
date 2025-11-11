SET autocommit = 0;
USE auftragdb;
-- ein Kunde erteilt 2 Aufträge in denen je zwei verschiedene Artikel
-- bestellt werden
INSERT INTO auftrag VALUES (4,NOW(),1);
INSERT INTO position VALUES(4,101,150.95);
INSERT INTO position VALUES(4,102,70.00);
INSERT INTO auftrag VALUES (5,NOW(),1);
INSERT INTO position VALUES(5,101,150.95);
INSERT INTO position VALUES(5,102,70.00);
-- der andere Kunde erteilt 3 Aufträge in denen je ein Artikel bestellt wird
INSERT INTO auftrag VALUES (6,NOW(),2);
INSERT INTO position VALUES(6,101,150.95);
INSERT INTO auftrag VALUES (7,NOW(),2);
INSERT INTO position VALUES(7,101,150.95);
INSERT INTO auftrag VALUES (8,NOW(),2);
INSERT INTO position VALUES(8,101,150.95);
-- Alle Preise werden um 2,5 % verbilligt
UPDATE artikel SET preis = preis * 0.975;
-- Der Kunde 'Maier' zieht von Hamburg nach Bremen um
UPDATE kunde SET adresse = 'Bremen' WHERE NAME = 'Maier';
-- Die Preise für die Artikel mit den Nummern 111 und 122 erhöhen sich um je 50 Cent
UPDATE artikel SET preis = preis + 0.5 WHERE nr = 111 OR nr = 122;
-- Der Artikel Nr. 112 wird aus den Sortiment genommen
COMMIT;
DELETE FROM artikel WHERE nr = 112;
-- die letzte Änderung (Artikel entfernen) wurde irrtümlich veranlasst, 
-- bitte wieder r�ckg�ngig machen
ROLLBACK;