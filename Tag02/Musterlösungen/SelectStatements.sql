select name,nr 
from kunde
where adresse = 'Stuttgart';

select nr, bezeichnung
from artikel
where preis between 10 and 20

select auftrag.nr, kunde.name, position.anzahl, artikel.preis
from auftrag,kunde,position,artikel
where auftrag.kundennr = kunde.nr and
position.auftragnr = auftrag.nr and
position.artikelnr = artikel.nr
order by auftrag.nr;

select kunde.adresse,sum(position.anzahl) as ArtikelInsgesamt
from kunde left join auftrag on kunde.nr = auftrag.kundennr
left join position on position.auftragnr = auftrag.nr
group by kunde.adresse;

select position.auftragnr, auftrag.datum, auftrag.kundennr, sum(position.anzahl*artikel.preis)
from position inner join artikel on position.artikelnr = artikel.nr
inner join auftrag on position.auftragnr = auftrag.nr
where auftrag.datum > '2010-03-08'
group by position.auftragnr, auftrag.datum, auftrag.kundennr;

select kunde.name, kunde.adresse
from kunde inner join auftrag on kunde.nr = auftrag.kundennr
inner join position on auftrag.nr = position.auftragnr
inner join artikel on position.artikelnr = artikel.nr
where lower(artikel.bezeichnung) like '%netz%';

select artikel.nr, artikel.bezeichnung
from artikel
where artikel.nr not in
(select artikelnr from position);

-- bestimme Bezeichnung und Preis zur maximalen Bestellsumme
select ar.bezeichnung, ar.preis
from artikel ar, 
(
	-- bestimme die Artikelnummer zur maximalem Bestellsumme
	select p2.artikelnr as artnr, sum(p2.anzahl)
	from position p2
	group by p2.artikelnr
	having sum(p2.anzahl) =
	( 	
		-- bestimme die maximale Bestellsumme
		select max(suanz)
		from (
			-- bestimme die Summen der Artikelbestellungen
			select p1.artikelnr, sum(p1.anzahl) as suanz
			from position p1
			group by p1.artikelnr
		     )
	)
) maxzeile
where ar.nr = maxzeile.artnr
;

