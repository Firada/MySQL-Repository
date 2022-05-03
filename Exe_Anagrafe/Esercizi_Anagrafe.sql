/*1. Persone maggiorenni con nome e Regione di nascita*/

select p.Nome, c.Regione
from Persona p join Città c on p.CittàNascita = c.nome
where p.Età >= 18 


/*2. Coppie genitori figlio nate nella stessa città*/
select g.Figlio, g.Genitore
from Persona p1 join Genia g on p1.Nome = g.Figlio
    join Persona p2 on p2.Nome = g.Genitore
where p1.CittàNascita = p2.CittàNascita

/*alternativa Join implicito Exe_n2°
/* select g.Figlio, g.Genitore
from Persona p, Persona p1, Genia g
where p.CittàNascita = p1.CittàNascita and ((p.Nome = g.Figlio) and (p1.Nome = g.Genitore)) */

/*3. Città in cui è nato almeno un genitore oltre i 50 anni*/

select distinct p.CittàNascita
from Persona p join Genia g on p.Nome = g.genitore 
where p.Età > 50 

/*4. Chi sono i nonni*/

select distinct f.Genitore as Nonni
from Genia f join Genia g on g.Genitore = f.Figlio


/*5 numero di maschi nati nel Lazio*/

select count(*) as NumeroMaschiLazio
from Persona p join Città c on p.CittàNascita = c.Nome
where p.Sesso='M' and c.Regione = 'Lazio'