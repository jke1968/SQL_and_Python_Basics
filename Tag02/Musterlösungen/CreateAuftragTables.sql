use auftragdb;

drop table if exists POSITION;
drop table if exists  AUFTRAG;
drop table if exists  kunde; 
drop table if exists  ARTIKEL;

create table KUNDE
(
    NR                                 DECIMAL(5),
    PRIMARY KEY (NR),
    NAME                               VARCHAR(10),
    ADRESSE                            VARCHAR(35)
); 
create table AUFTRAG
(
    NR                                DECIMAL(5),
    PRIMARY KEY (NR),
    DATUM                             DATE,
    KUNDENNR                          DECIMAL(5),
    FOREIGN KEY (KUNDENNR)                          
    REFERENCES KUNDE (NR) ON DELETE CASCADE
);
create table ARTIKEL
(
    NR                            DECIMAL(5),
    PRIMARY KEY (NR),
    BEZEICHNUNG                   VARCHAR(32),
    PREIS                         DECIMAL(5,2)
);
create table POSITION
(
    AUFTRAGNR                        DECIMAL(5),
    ARTIKELNR                        DECIMAL(5),
    PRIMARY KEY (AUFTRAGNR,ARTIKELNR),
    ANZAHL                           DECIMAL(5),
    FOREIGN KEY (AUFTRAGNR)                          
    REFERENCES AUFTRAG (NR) ON DELETE CASCADE,
    FOREIGN KEY (ARTIKELNR)                          
    REFERENCES ARTIKEL (NR) ON DELETE CASCADE
);
-- --------------------------
insert into KUNDE values (1,'Müller','Seepromenade 12 70567 Stuttgart');
insert into KUNDE values (2,'Maier','Frankenallee 120 65099 Frankfurt');
insert into KUNDE values (3,'Schmidt','Hauptstr 87 80765 München');
insert into ARTIKEL values (101,'Festplatte',150.95);
insert into ARTIKEL values (102,'Netzteil',70.00);
insert into AUFTRAG values (1,'12-03-08',1);
insert into AUFTRAG values (2,'12-03-08',2);
insert into AUFTRAG values (3,'12-03-08',3);
insert into POSITION values (1,101,2);
insert into POSITION values (1,102,10);
insert into POSITION values (3,101,10);
insert into POSITION values (3,102,20);






