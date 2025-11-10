DROP TABLE IF EXISTS Tvautor;
DROP TABLE IF EXISTS Tisbn;
DROP TABLE IF EXISTS Tbuch;
DROP TABLE IF EXISTS Tverlag;
DROP TABLE IF EXISTS Tautor;
 
COMMIT;

  CREATE TABLE Tverlag
  (
   Verlagnr   INTEGER    NOT NULL
  ,Verlag     CHAR(20)   NOT NULL
  ,PRIMARY KEY (Verlagnr)
  )
  ;
  -- GRANT SELECT ON Tverlag TO PUBLIC
  -- ;

  CREATE TABLE Tbuch
  (
   Buchnr        INTEGER      NOT NULL
  ,Erschj        DECIMAL(4)
  ,Preis         DECIMAL(7,2)
  ,Verlagnr      INTEGER
  ,Titel         VARCHAR(127) NOT NULL
  ,PRIMARY KEY (Buchnr)
  )
  ;
  ALTER TABLE Tbuch ADD CONSTRAINT
                  FK_Tbuch_Tverlag
                  FOREIGN KEY (Verlagnr)
                  REFERENCES Tverlag(Verlagnr)
                  ;

   
  -- GRANT SELECT ON Tbuch TO PUBLIC
  --;

  CREATE TABLE Tisbn
  (
   Buchnr    INTEGER NOT NULL
  ,Isbn      CHAR(10)  NOT NULL
  ,Lfdnr     DECIMAL(1) NOT NULL
  ,PRIMARY KEY (Isbn)
  ,CONSTRAINT ALTKEY_Tisbn UNIQUE (Buchnr,Lfdnr)
  ,FOREIGN KEY (Buchnr) 
               REFERENCES Tbuch(Buchnr)
               ON DELETE CASCADE
  )
  ;
  -- GRANT SELECT ON Tisbn  TO PUBLIC
  --;

  CREATE TABLE Tautor
  (
   Autornr      INTEGER      NOT NULL
  ,Autor        VARCHAR(240) NOT NULL
  ,Geburtsdatum DATE
  ,PRIMARY KEY (Autornr)
  )
  ;
  -- GRANT SELECT ON Tautor TO PUBLIC
  --;

  CREATE TABLE Tvautor
  (
   Buchnr    INTEGER NOT NULL
  ,Autornr   INTEGER NOT NULL
  ,Lfdnr     DECIMAL(1) NOT NULL
  ,Praemie   DECIMAL(9,3)
  ,PRIMARY KEY (Autornr,Buchnr)
  ,CONSTRAINT ALTKEY_Tvautor UNIQUE (Buchnr,lfdnr)
  ,FOREIGN KEY (Buchnr)
               REFERENCES Tbuch (Buchnr)
               ON DELETE CASCADE
  ,FOREIGN KEY (Autornr)
               REFERENCES Tautor (Autornr)
               ON DELETE NO ACTION
  )
  ;
  -- GRANT SELECT ON Tvautor TO PUBLIC
  --;

ALTER TABLE Tbuch ADD CONSTRAINT Tbuchconpreis
CHECK ( 0.00 <  Preis)
;
ALTER TABLE Tbuch ADD CONSTRAINT Tbuchconerschj
CHECK ( 0. < Erschj)
;
ALTER TABLE Tisbn ADD CONSTRAINT Tisbnconlfdnr
CHECK ( 1. <= lfdnr
               AND
               lfdnr  <= 9. )
;
ALTER TABLE Tvautor ADD CONSTRAINT Tvautorconlfdnr
CHECK ( 0. <= lfdnr
               AND
               lfdnr  <= 9. )
;
ALTER TABLE Tvautor ADD CONSTRAINT Tvautorconpraemie
CHECK ( 0.00 <= praemie )
;

commit;

-- set NULL null;
delete from Tbuch;
delete from Tverlag;
delete from Tautor;

INSERT INTO Tverlag(verlagnr, verlag) VALUES
( 1111, 'Forkel');


INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
 ( 5, 1988, 3.50, 'Ansichten eines Clowns')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
( 6, 1988, 20.50, 'die Blechtrommel')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
( 7, 1989, 99.99, 'der Name der Rose')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
( 8, 1977, 00.50, 'der Butt')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
( 9, 1990, 55.00, 'DB2 fuer Sie')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
(11, 1990,  NULL, 'Elvis in Heidelberg')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
(12, 1989,  NULL, 'a guide to db2')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
(18, 1989, 99.99, 'Database Systems')
;
INSERT INTO Tbuch(buchnr,erschj, preis, titel) VALUES
(27, Null, 99.99,  'die Jdin von Toledo')
;


UPDATE Tbuch set verlagnr = 1111
where Tbuch.buchnr = 8
      or Tbuch.buchnr = 9;

INSERT INTO Tisbn(BUCHNR,isbn, lfdnr) VALUES
 (08, '3472864303', 01)
; 
INSERT INTO Tisbn(BUCHNR,isbn, lfdnr) VALUES
(12, '0201501139', 01)
;
INSERT INTO Tisbn(BUCHNR,isbn, lfdnr) VALUES
(08, '34728643yx', 02)
;

INSERT INTO Tautor(autornr,autor) VALUES
 (1, 'Boell')
 ;
INSERT INTO Tautor(autornr,autor) VALUES 
(2, 'Grass')
;
INSERT INTO Tautor(autornr,autor) VALUES
(3, 'Eco')
;
INSERT INTO Tautor(autornr,autor) VALUES
(6, 'Scheifele')
;
INSERT INTO Tautor(autornr,autor) VALUES
(10,'Emil Hack')
;
INSERT INTO Tautor(autornr,autor) VALUES
(11, 'Frieda Holz')
;
INSERT INTO Tautor(autornr,autor) VALUES
(20,  'C. J. Date')
;
INSERT INTO Tautor(autornr,autor) VALUES
(21, 'Colin J. White')
;


INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
 (05 , 01, 0)
 ;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(06 , 02, 0)
;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(07 , 03, 0)
;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(08 , 02, 0)
;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(09 , 10, 1)
;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(09 , 11, 2)
;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(12 , 20, 1)
;
INSERT INTO Tvautor(buchnr,autornr, lfdnr) VALUES
(12 , 21, 2)
;

update Tvautor set praemie = NULL;

update Tvautor set praemie = 20.00
where buchnr = 8 and autornr = 2;
update Tvautor set praemie = 10.00
where buchnr = 9 and autornr = 10;
update Tvautor set praemie = 498.00
where buchnr = 9 and autornr = 11;
update Tvautor set praemie = 30.00
where buchnr = 12 and autornr = 20;

INSERT INTO Tbuch (buchnr , titel)
values( 1 , 'C');
insert into Tbuch (buchnr , titel)
values( 2 , 'C');

insert into Tautor (autornr , autor)
values( 100 , 'BUSCH');
insert into Tautor (autornr , autor)
values( 200 , 'BUSCH');

insert into Tvautor (buchnr, autornr , lfdnr)
values( 1 , 100 , 1);
insert into Tvautor (buchnr, autornr , lfdnr)
values( 1 , 200,  2);
insert into Tvautor (buchnr, autornr , lfdnr)
values( 2 , 200 , 0);

select * from Tverlag;
select * from Tbuch order by buchnr;
select * from Tisbn order by buchnr, lfdnr;
select * from Tautor order by autornr;
select * from Tvautor order by buchnr, autornr, lfdnr;
commit;
exit
