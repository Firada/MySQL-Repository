
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

/*4 Per ogni nazione, calcolare il numero di scalate effettuate da scalatori nati in quella nazione. */

select n.nome, count(*)
from Scalatore sc join Scalata s on sc.cf = s.scalatore
    join Nazione n on n.nome = s.nazione
where sc.nazioneNascita = s.nazione
group by n.nome


/*6 Calcolare codice fiscale, nazione di nascita, continente di nascita di ogni scalatore nato in un continente diverso dall’America, e, solo se egli ha effettuato almeno una scalata, 
affiancare queste informazioni alle nazioni in cui ha effettuato scalate. */

select sc.cf, sc.nazioneNascita, n1.continente as ContNascita
from Scalatore sc join Scalata s on sc.cf = s.scalatore
     left join Nazione n on n.nome = s.nazione
    join Nazione n1 on n1.nome = sc.nazioneNascita
where n1.continente != 'America' 