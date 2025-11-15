create database if not exists nicolo_zanforlin_1d_clinica;

use nicolo_zanforlin_1d_clinica;

create table pazienti (
id_paziente int primary key auto_increment,
cognome varchar(30) not null,
nome varchar(30) not null,
data_nascita date,
provincia varchar(50),
codice_Asl varchar(10)
);

create table visite (
id_visita int primary key auto_increment,
data_visita date,
peso decimal(5,2),
altezza int,
pressione_min int,
pressione_max int,
glicemia decimal(5,2),
id_paziente int,
foreign key(id_paziente) references pazienti (id_paziente)
);


insert into pazienti(cognome, nome, data_nascita, provincia, codice_Asl) values 
('Bianchi', 'Luca', '1985-04-10', 'Milano', 'ASL-MI01'),
('Rossi', 'Marco', '1990-07-23', 'Napoli', NULL),
('Verdi', 'Anna', '1978-12-01', 'Roma', 'ASL-RM05'),
('Neri', 'Giulia', '2000-02-14', 'Milano', 'ASL-MI03'),
('Esposito', 'Francesco', '1983-09-19', 'Napoli', 'ASL-NA07'),
('Conti', 'Marta', '1995-05-30', 'Roma', NULL),
('Ferrari', 'Francesco', '1983-09-19', 'Imola', 'ASL-IM07');


insert into visite(data_visita, peso, altezza, pressione_min, pressione_max, glicemia, id_paziente) values 
('2024-03-15', 70, 175, 80, 120, 95, 1),
('2024-06-10', 75, 175, 85, 125, 100, 2),
('2020-05-22', 92, 180, 95, 145, 112, 3),
('2020-11-03', 88, 178, 90, 135, 108, 4),
('2020-08-12', 89, 178, 85, 140, 115, 5),
('2025-01-09', 59, 160, 100, 150, 99, 1),
('2025-02-02', 65, 165, 85, 118, 100, 2),
('2025-09-05', 62, 165, 70, 110, 98, 4),
('2025-03-15', 58, 170, 95, 145, 85, 6),
('2021-02-03','60','180','90','125','75',null);

insert into visite(data_visita, peso, altezza, pressione_min, pressione_max, glicemia, id_paziente) values 
('2025-09-05', 62, 165, 70, 110, 98, null),
('2025-03-15', 58, 170, 95, 145, 85, null);


select * from pazienti p join visite v on p.id_paziente = v.id_paziente;

select * from visite v join pazienti p on p.id_paziente = v.id_paziente;

select p.cognome, p.nome, v.data_visita from visite v join pazienti p on p.id_paziente = v.id_paziente;

drop table pazienti;

select p.cognome, p.nome, v.pressione_min , v.pressione_max  from pazienti p join visite v on p.id_paziente = v.id_paziente;

select p.cognome, p.nome, v.pressione_min , v.pressione_max  from pazienti p join visite v on p.id_paziente = v.id_paziente where v.pressione_min>80;

select p.cognome, p.nome, v.pressione_min , v.pressione_max, avg(v.pressione_min)  from pazienti p join visite v on p.id_paziente = v.id_paziente where cognome like('Bianchi') ;

select nome, cognome
from pazienti p
inner join visite v on p.id_paziente = v.id_paziente;

select nome, cognome
from pazienti p
right join visite v on p.id_paziente = v.id_paziente;

select nome, cognome
from pazienti p
left join visite v on p.id_paziente = v.id_paziente;

select nome, cognome
from pazienti p
left join visite v on p.id_paziente = v.id_paziente
union
select nome, cognome
from pazienti p
right join visite v on p.id_paziente = v.id_paziente;

select distinct p.provincia,
count(p.id_paziente) as numero_pazienti,
count(v.data_visita) as numero_visite,
avg(pressione_max) as pressione_massima_media 
from pazienti p join visite v on p.id_paziente = v.id_paziente 
group by p.provincia 
having count(p.id_paziente) >= 3 
order by avg(pressione_max) DESC;

SELECT COUNT(v.id_visita) AS visite_senza_paziente
FROM visite v
left JOIN pazienti p ON v.id_paziente = p.id_paziente
WHERE p.id_paziente IS NULL;

select p.nome, p.cognome,
avg(v.pressione_max) as pressione_massima,
avg(v.pressione_min) as pressione_minima
from pazienti p inner join visite v on p.id_paziente = v.id_paziente 
group by p.id_paziente, p.nome, p.cognome 
having avg(pressione_max) > 130;




