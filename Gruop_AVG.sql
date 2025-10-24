create table studenti (
	id int auto_increment primary key,
	nome varchar(50),
	cognome varchar(50),
	eta int
);

insert into studenti (nome,cognome,eta)
values
('Luca', 'Rossi', 18),
('Anna', 'Bianchi', 20),
('Andrea', 'White', 18),
('Andrea', 'Blancos', 22),
('Marco', 'Verdi', 19);

UPDATE studenti SET eta = 21 WHERE nome = 'Anna';

select count(*) as totaleclienti from mock_data;

select count(*) from studenti;

select count(distinct nome) from studenti;

select sum(eta) as sommaEta from studenti;

select sum(eta) as sommaEtaAndrea from studenti where nome like 'Andrea';

select sum(distinct eta) as sommaEta from studenti,

select avg(eta) from studenti as mediaEtaClasse where nome like 'Andrea';

select min(eta) as etaminima from studenti;

select max(eta) as etamassima from studenti;

create table votiStudenti (
	id int auto_increment primary key,
	nome varchar(50),
	cognome varchar(50),
	materia varchar(50),
	voto int
);

insert into votiStudenti (nome,cognome,materia,voto)
values
('Luca', 'Rossi', 'informatica', 8),
('Gaia', 'Bianchi', 'matematica', 5),
('Giuglio', 'White', 'matematica', 6),
('Andrea', 'Blancos', 'matematica', 5),
('Gulielmo', 'Renesto', 'informatica', 7),
('Anna', 'Fusaro', 'storia', 9),
('Andrea', 'Limoni', 'sistemi', 4),
('Luca', 'Rossi', 'informatica', 8),
('Gaia', 'Bianchi', 'matematica', 5),
('Giuglio', 'White', 'matematica', 6),
('Andrea', 'Blancos', 'matematica', 5),
('Gulielmo', 'Renesto', 'informatica', 7),
('Anna', 'Fusaro', 'storia', 9),
('Andrea', 'Limoni', 'sistemi', 4),
('Luca', 'Rossi', 'informatica', 8),
('Gaia', 'Bianchi', 'matematica', 5),
('Giuglio', 'White', 'italiano', 7),
('Andrea', 'Blancos', 'italiano', 8),
('Gulielmo', 'Renesto', 'informatica', 7),
('Anna', 'Fusaro', 'storia', 9),
('Andrea', 'Limoni', 'sistemi', 4),
('Luca', 'Rossi', 'sistemi', 5),
('Gaia', 'Bianchi', 'matematica', 5),
('Giuglio', 'White', 'matematica', 6),
('Andrea', 'Blancos', 'religione', 10),
('Gulielmo', 'Renesto', 'matematica', 8),
('Anna', 'Fusaro', 'religione', 3),
('Andrea', 'Limoni', 'geografia', 3),
('Gain', 'Eagers', 'inglese', 9);

select avg(voto) as mediaClasse from votistudenti;

select avg(voto) as mediaFusaro from votistudenti 
where cognome like 'Fusaro' and nome like 'Anna';

select cognome, nome, avg(voto) as mediaVoti
from votistudenti
group by cognome, nome;

select cognome, nome, materia, avg(voto) as mediaVoti
from votistudenti
group by cognome, nome, materia;
