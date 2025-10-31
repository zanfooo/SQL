create database if not exists clinica;

use clinica;

create table pazienti (
id_paziente int primary key auto_increment,
cognome varchar(30) not null,
nome varchar(30) not null,
data_nascita date,
provincia char(2),
codice_Asl varchar(10)
);

create table visite (
id_visita int primary key auto_increment,
data_visita date,
peso decimal(5,2),
pressione_min int,
pressione_max int,
glicemia decimal(5,2),
id_paziente int,
foreign key(id_paziente) references pazienti (id_paziente)
);

