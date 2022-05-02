1.
select r.*
from Romanzo r
where r.AnnoPubblicazione = 2009

2.
select r.Titolo
from Romanzo r
where r.AnnoPubblicazione > 1990

3.
select *
from Romanzo r
where r.AnnoPubblicazione > 1900

4.
select a.Nome, a.Cognome, r.Titolo
from Romanzo r, Autore a
where r.Autore = a.ID

5.
select autore.Cognome, autore.nome, Romanzo.Titolo
from Romanzo, Autore
where Romanzo.Autore = Autore.ID
order by Autore.Cognome

6.
select autore.nome, autore.cognome, romanzo.Titolo
from romanzo, autore
where romanzo.autore = autore.ID and autore.Nazionalità = "italiana"
order by autore.cognome

7.
select romanzo.Titolo
from romanzo, autore
where romanzo.autore = autore.id and (autore.DataNascita > 1809 and autore.DataNascita < 2000)
order by autore.cognome

8.
select romanzo.titolo, romanzo.AnnoPubblicazione
from romanzo, autore
where romanzo.autore = autore.id and autore.DataMorte is null

9.
select *
from romanzo, autore
where romanzo.autore = autore.id and (autore.DataMorte is null or autore.LuogoMorte != "Torino")

10.
select romanzo.titolo, romanzo.AnnoPubblicazione
from romanzo, autore
where romanzo.autore = autore.id and autore.LuogoNascita = "Roma"

11.
select *
from romanzo
where romanzo.titolo like "Tokyo%"

12.
select *
from romanzo
where romanzo.titolo like "%Sposi%"

13.
select *
from romanzo
where romanzo.titolo like "%i_"

14.
select *
from romanzo
where romanzo.titolo like "%blues"

15.
select *
from romanzo
where romanzo.titolo like "%Zeno%"

16.
select*
from romanzo
where romanzo.AnnoPubblicazione < 1900 and romanzo.titolo like "%Sposi%" 

17.
select * 
from romanzo, autore
where romanzo.autore = autore.id and autore.nome = "Alessandro" and autore.cognome = "Manzoni"

18.
select distinct *
from romanzo, autore
where romanzo.autore = autore.id and autore.cognome = "Don DeLillo"

19.
select *
from romanzo, Personaggio, PersonaggioRomanzo
where personaggio.nome = "Harry" and ((personaggio.id = PersonaggioRomanzo.personaggio) and (romanzo.id = PersonaggioRomanzo.romanzo))