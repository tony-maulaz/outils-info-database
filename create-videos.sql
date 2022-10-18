
DROP SCHEMA IF EXISTS ex_video CASCADE;
CREATE SCHEMA ex_video;

set SCHEMA 'ex_video';

-- Create tables
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS play;
DROP TABLE IF EXISTS person_address;
DROP TABLE IF EXISTS videos;
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS addresses;


CREATE TABLE persons(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL
);

CREATE TABLE actors(
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    agent_id INTEGER
);

CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255) NOT NULL
);

CREATE TABLE addresses(
    id SERIAL PRIMARY KEY,
    npa int,
    city VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS videos (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category_id INTEGER NOT NULL,
    year INTEGER NOT NULL,
    director_id INTEGER NOT NULL,
    renter_id INTEGER,

    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (director_id) REFERENCES persons(id),
    FOREIGN KEY (renter_id) REFERENCES persons(id)
);

CREATE TABLE IF NOT EXISTS play (
    id SERIAL PRIMARY KEY,
    role VARCHAR(255) NOT NULL,
    actor_id INTEGER NOT NULL,
    video_id INTEGER NOT NULL,

    FOREIGN KEY (actor_id) REFERENCES actors(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);



CREATE TABLE IF NOT EXISTS person_address (
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    address_id INTEGER NOT NULL,

    FOREIGN KEY (person_id) REFERENCES persons(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);



CREATE TABLE IF NOT EXISTS reservations (
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    video_id INTEGER NOT NULL,
    when_res DATE NOT NULL,

    FOREIGN KEY (person_id) REFERENCES persons(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);

TRUNCATE TABLE reservations, play, person_address, videos, persons, actors, addresses, categories RESTART IDENTITY CASCADE;

-- Insert data
insert into categories (type) values ('Action');
insert into categories (type) values ('Comedy');
insert into categories (type) values ('Drama');
insert into categories (type) values ('Horror');
insert into categories (type) values ('Romance');
insert into categories (type) values ('Sci-Fi');
insert into categories (type) values ('Thriller');
insert into categories (type) values ('Western');

insert into persons (firstname, lastname) values ('Noland', 'Marfield'); -- 1
insert into persons (firstname, lastname) values ('Alene', 'Llop');
insert into persons (firstname, lastname) values ('Martie', 'Brocking');
insert into persons (firstname, lastname) values ('Juliet', 'Robbings');
insert into persons (firstname, lastname) values ('Anne-marie', 'Emptage');
insert into persons (firstname, lastname) values ('Jade', 'Matthiesen');
insert into persons (firstname, lastname) values ('Sheree', 'Pennigar');
insert into persons (firstname, lastname) values ('Kim', 'Brosel');
insert into persons (firstname, lastname) values ('Adan', 'Edwardes');
insert into persons (firstname, lastname) values ('Casandra', 'Butting');
insert into persons (firstname, lastname) values ('Roosevelt', 'Judson');
insert into persons (firstname, lastname) values ('Rogerio', 'Gentile');
insert into persons (firstname, lastname) values ('Reynold', 'Ciccetti');
insert into persons (firstname, lastname) values ('Beret', 'Saich');
insert into persons (firstname, lastname) values ('Angus', 'Saterthwait');
insert into persons (firstname, lastname) values ('Silvester', 'Dukesbury');
insert into persons (firstname, lastname) values ('Lilith', 'O'' Scallan');
insert into persons (firstname, lastname) values ('Aveline', 'Chatelain');
insert into persons (firstname, lastname) values ('Di', 'Handlin');
insert into persons (firstname, lastname) values ('Eric', 'Dalmon');

-- actors
insert into persons (firstname, lastname) values ('Tom', 'Cruise'); -- 21
insert into persons (firstname, lastname) values ('Brad', 'Pitt'); -- 22
insert into persons (firstname, lastname) values ('Angelina', 'Jolie'); -- 23
insert into persons (firstname, lastname) values ('Johnny', 'Depp'); -- 24
insert into persons (firstname, lastname) values ('Leonardo', 'DiCaprio'); -- 25
insert into persons (firstname, lastname) values ('Will', 'Smith'); -- 26
insert into persons (firstname, lastname) values ('Denzel', 'Washington'); -- 27
insert into persons (firstname, lastname) values ('Matt', 'Damon'); -- 28
insert into persons (firstname, lastname) values ('Tom', 'Hanks'); -- 29
insert into persons (firstname, lastname) values ('Robert', 'De Niro'); -- 30
insert into persons (firstname, lastname) values ('Eric', 'Dalmon'); -- 31
insert into persons (firstname, lastname) values ('Dany', 'Boon'); 
insert into persons (firstname, lastname) values ('Jean', 'Dujardin');
insert into persons (firstname, lastname) values ('Gérard', 'Depardieu');
insert into persons (firstname, lastname) values ('Valérie', 'Bonneton'); -- 35
insert into persons (firstname, lastname) values ('Bérangère', 'McNeese'); -- 36

insert into actors (person_id, agent_id) values (21, 1);
insert into actors (person_id, agent_id) values (22, 6);
insert into actors (person_id, agent_id) values (23, 2);
insert into actors (person_id, agent_id) values (24, 3);
insert into actors (person_id, agent_id) values (25, 4);
insert into actors (person_id, agent_id) values (26, 5);
insert into actors (person_id, agent_id) values (27, 6);
insert into actors (person_id, agent_id) values (28, 7);
insert into actors (person_id, agent_id) values (29, 8);
insert into actors (person_id, agent_id) values (30, 9);
insert into actors (person_id, agent_id) values (32, 8); -- 11
insert into actors (person_id, agent_id) values (35, 8); -- 12
insert into actors (person_id, agent_id) values (36, 8); -- 13

insert into videos (title, category_id, year, director_id, renter_id) values ('The Shawshank Redemption', 3, 1994, 1, 2); -- 1
insert into videos (title, category_id, year, director_id, renter_id) values ('The Godfather', 2, 1972, 2, 2);
insert into videos (title, category_id, year, director_id) values ('The Godfather: Part II', 3, 1974, 2);
insert into videos (title, category_id, year, director_id, renter_id) values ('The Dark Knight', 6, 2008, 3, 12);
insert into videos (title, category_id, year, director_id) values ('The pub', 4, 2000, 5);
insert into videos (title, category_id, year, director_id) values ('Titanic', 2, 2000, 5);
insert into videos (title, category_id, year, director_id, renter_id) values ('Rambo', 2, 2000, 5, 6);
insert into videos (title, category_id, year, director_id) values ('Blood', 1, 2001, 5);
insert into videos (title, category_id, year, director_id) values ('The Matrix', 6, 1999, 5);
insert into videos (title, category_id, year, director_id, renter_id) values ('The Matrix Reloaded', 6, 2003, 5, 4);
insert into videos (title, category_id, year, director_id) values ('Superman', 6, 2000, 15);
insert into videos (title, category_id, year, director_id) values ('Eyjafjallajökull', 2, 2013, 8); -- 12
insert into videos (title, category_id, year, director_id) values ('The Equalizer', 1, 2014, 9);
insert into videos (title, category_id, year, director_id) values ('La Couleur de l argent', 3, 1986, 7);
insert into videos (title, category_id, year, director_id) values ('Jack Reacher', 1, 2012, 7);

insert into addresses (npa, city) values (1000, 'Lausanne');
insert into addresses (npa, city) values (2000, 'Neuchatel');
insert into addresses (npa, city) values (3000, 'Bern');
insert into addresses (npa, city) values (4000, 'Basel');
insert into addresses (npa, city) values (5000, 'Aarau');

insert into person_address (person_id, address_id) values (1, 1);
insert into person_address (person_id, address_id) values (2, 2);
insert into person_address (person_id, address_id) values (3, 3);
insert into person_address (person_id, address_id) values (4, 4);
insert into person_address (person_id, address_id) values (1, 2);
insert into person_address (person_id, address_id) values (1, 3);
insert into person_address (person_id, address_id) values (2, 3);
insert into person_address (person_id, address_id) values (21, 3);
insert into person_address (person_id, address_id) values (21, 2);
insert into person_address (person_id, address_id) values (21, 1);
insert into person_address (person_id, address_id) values (22, 2);
insert into person_address (person_id, address_id) values (24, 3);
insert into person_address (person_id, address_id) values (25, 2);
insert into person_address (person_id, address_id) values (25, 5);
insert into person_address (person_id, address_id) values (24, 2);
insert into person_address (person_id, address_id) values (26, 3);
insert into person_address (person_id, address_id) values (23, 1);
insert into person_address (person_id, address_id) values (28, 4);
insert into person_address (person_id, address_id) values (29, 4);
insert into person_address (person_id, address_id) values (28, 1);

insert into play (role, actor_id, video_id) values ('Tutu', 1, 1);
insert into play (role, actor_id, video_id) values ('Toto', 2, 2);
insert into play (role, actor_id, video_id) values ('Bob', 3, 2);
insert into play (role, actor_id, video_id) values ('Alice', 4, 3);
insert into play (role, actor_id, video_id) values ('Doe', 5, 3);
insert into play (role, actor_id, video_id) values ('John', 2, 3);
insert into play (role, actor_id, video_id) values ('Alain', 11, 12);
insert into play (role, actor_id, video_id) values ('Cécile', 13, 12);
insert into play (role, actor_id, video_id) values ('Valérie', 12, 12);
insert into play (role, actor_id, video_id) values ('Vincent', 1, 14);
insert into play (role, actor_id, video_id) values ('Jack', 1, 15);
insert into play (role, actor_id, video_id) values ('Robert', 7, 13);

insert into reservations (person_id, video_id, when_res) values (1, 1, '2017-01-01');
insert into reservations (person_id, video_id, when_res) values (1, 2, '2017-02-01');
insert into reservations (person_id, video_id, when_res) values (1, 3, '2017-03-01');
insert into reservations (person_id, video_id, when_res) values (5, 1, '2018-04-01');
insert into reservations (person_id, video_id, when_res) values (5, 2, '2018-05-01');
insert into reservations (person_id, video_id, when_res) values (5, 12, '2018-05-01');
insert into reservations (person_id, video_id, when_res) values (15, 12, '2019-05-01');
insert into reservations (person_id, video_id, when_res) values (17, 12, '2020-05-01');