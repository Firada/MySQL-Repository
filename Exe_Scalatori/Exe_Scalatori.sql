
/*1. Calcolare l'insieme (non il multi-insieme) delle coppie (A,B) tali che A è uno scalatore e B è un continente in cui A ha effettuato una scalata. */

select distinct s.scalatore as A, n.continente as B
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

select sc.nazioneNascita, count(*)
from Scalatore sc join Scalata s on sc.cf = s.Scalatore
where sc.nazioneNascita = s.nazione
group by sc.nazioneNascita


/*6 Calcolare codice fiscale, nazione di nascita, continente di nascita di ogni scalatore nato in un continente diverso dall’America, e, solo se egli ha effettuato almeno una scalata, 
affiancare queste informazioni alle nazioni in cui ha effettuato scalate. */

select distinct sc.cf, sc.nazioneNascita, n1.continente as ContNascita, s.nazione
from Scalatore sc left join Scalata s on sc.cf = s.scalatore
     left join Nazione n on n.nome = s.nazione
    join Nazione n1 on n1.nome = sc.nazioneNascita
where n1.continente != 'America' 

/*7 Per ogni nazione e per ogni anno, calcolare il numero di scalate effettuate in quella nazione e in quell’anno, ma solo se 
tale numero è maggiore di 1. Nel risultato le nazioni dello stesso continente devono essere mostrati in tuple contigue, e
le tuple relative allo stesso continente devono essere ordinate per anno. */

select  s.anno, s.nazione, count(*) as ConteggioScalate
from Nazione n join Scalata s on n.nome = s.nazione
group by s.anno, s.nazione having count(*) > 1
order by s.anno, n.continente


/*8. Per ogni nazione N, calcolare il numero medio di scalate effettuate all’anno in N da scalatori nati in
nazioni diverse da N. */


select s.nazione, count(*)/count( distinct s.anno) as Media
from Scalatore sc join Scalata s on sc.cf = s.scalatore
where sc.nazioneNascita != s.nazione
group by s.nazione