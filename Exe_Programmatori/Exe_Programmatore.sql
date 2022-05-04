

/*1. Calcolare il codice dei programmatori che sono stati autori  di almeno un programma scritto in Java dopo il 2000 */

select a.codice
/*Non è necessario il Programmatore, sarebbe sufficiente un Join tra Autore e programma, siccome Autore ha "codice" */
from Autore a join Programmatore p on a.codice = p.codice
    join Programma pr on pr.id = a.id
where pr.anno > 2000 and pr.linguaggio ='Java'


/*2. Calcolare il nome e la categoria dei programmatori che sono stati autori di almeno un programma scritto in un linguaggio diverso da Python, ordinando il
risultato rispetto al nome dei programmatori. */

select p.nome, p.categoria
from Programmatore p join Autore a on p.codice = a.codice
    join Programma pr on pr.id = a.id
where pr.linguaggio != "Python"
order by p.nome


/*3. Per ogni programmatore di categoria 10, calcolare il suo codice e l'anno in cui ha scritto il primo programma in un linguaggio diverso da Java. */

select p.codice, min(pr.anno), pr.linguaggio
from Programmatore p join Autore a on p.codice = a.codice
    join Programma pr on pr.id = a.id 
where p.categoria = 10 and pr.linguaggio != "Java"
group by p.codice


/*4. Calcolare le coppie dei codici di programmatori che sono stati coautori di almeno un programma scritto in Python. */

select distinct a.codice as Autore, a2.codice as CoAutore
from Autore a join Autore a2 on a.id = a2.id
    join Programma pr on pr.id = a.id
where pr.linguaggio = "Python" and (a.codice != a2.codice) and (a.codice < a2.codice)


/*5. Calcolare il codice ed il nome dei programmatori che hanno scritto solo programmi Java. */

select p.nome, p.codice
from Programmatore p join Autore a on p.codice = a.codice
    join Programma pr on pr.id = a.id
where pr.linguaggio = 'Java' 
group by pr.linguaggio


/*6. Per ogni programmatore e per ogni anno calcolare il numero di programmi scritti da quel programmatore in quell’anno, mostrando codice del programmatore,
anno e numero di programmi scritti. */

select  a.codice, pr.anno, count(*)
from Autore a join Programma pr on a.id = pr.id
group by a.codice, pr.anno


 /*7 Per ogni linguaggio calcolare quanti sono in media gli autori dei programmi scritti in quel linguaggio. */

 select pr.linguaggio, count(a.codice)/count (distinct pr.id) as media
 from Autore a right join Programma pr on a.id = pr.id
 group by pr.linguaggio