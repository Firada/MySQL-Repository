/*1. Persone maggiorenni con nome e Regione di nascita*/

select p.Nome, c.Regione
from Persona p join Città c on p.CittàNascita = c.nome
where p.Età >= 18 


/*2. Coppie genitori figlio nate nella stessa città*/
select p1.Nome, p2.Nome
from Persona p1 join Genia g on p1.Nome = g.Figlio
    join Persona p2 on p2.Nome = g.Genitore
where p1.CittàNascita = p2.CittàNascita