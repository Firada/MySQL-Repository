
/*1. Calcolare l'insieme (non il multi-insieme) delle coppie (A,B) tali che A è uno scalatore e B è un continente in cui A ha effettuato una scalata. */

select s.scalatore as A, n.continente as B
from Scalata s join Nazione n on s.nazione = n.nome
order by s.scalatore

/*2. Per ogni scalatore nato prima del 1980, calcolare tutti i continenti in cui ha effettuato una scalata, ordinando il risultato per codice fiscale e, a parità di
codice fiscale, per il nome del continente. */

select n.continente, sc.cf
from Scalatore sc join Scalata s on sc.cf = s.scalatore
    join Nazione n on n.nome = s.nazione
where sc.annoNascita < 1980
order by sc.CF, n.continente


/*3 Calcolare le nazioni (mostrando, per ciascuna, anche il continente) nelle quali è stata effettuata almeno una scalata
da uno scalatore minorenne. */

select n.nome, n.continente
from Scalatore sc join Scalata s on sc.cf = s.scalatore
    join Nazione n on n.nome = s.nazione
where (s.anno - sc.annoNascita) < 18