
/*1. Calcolare l'insieme (non il multi-insieme) delle coppie (A,B) tali che A è uno scalatore e B è un continente in cui A ha effettuato una scalata. */

select s.scalatore as A, n.continente as B
from Scalata s join Nazione n on s.nazione = n.nome
order by s.scalatore