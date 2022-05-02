/*1. Persone maggiorenni con nome e Regione di nascita*/

select p.Nome, c.Regione
from Persona p join Città c on p.CittàNascita = c.nome
where p.Età > 18 