-- Create tables
DROP SCHEMA IF EXISTS ex_dog CASCADE;
CREATE SCHEMA ex_dog;

CREATE TABLE ex_dog.personne(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_chien INTEGER
);

CREATE TABLE ex_dog.chien(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);


-- Insert data
insert into ex_dog.chien (nom) values ('Rufus');
insert into ex_dog.chien (nom) values ('Lucky');

insert into ex_dog.personne (nom) values ('Jean');
insert into ex_dog.personne (nom, id_chien) values ('Alice', 1);
insert into ex_dog.personne (nom, id_chien) values ('Bob', 2);
insert into ex_dog.personne (nom) values ('Marc');
