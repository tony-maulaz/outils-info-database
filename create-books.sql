-- Create tables
DROP SCHEMA IF EXISTS book CASCADE;
CREATE SCHEMA book;

CREATE TABLE book.address(
    id SERIAL PRIMARY KEY,
    npa int,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE book.person(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    address_id INTEGER,

    FOREIGN KEY (address_id) REFERENCES book.address(id)
);

CREATE TABLE IF NOT EXISTS book.book (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    owner_id INTEGER NOT NULL,
    year INTEGER NOT NULL,

    FOREIGN KEY (owner_id) REFERENCES book.person(id)
);

CREATE TABLE book.read_by(
    id SERIAL PRIMARY KEY,
    book_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    when_read DATE NOT NULL,

    FOREIGN KEY (book_id) REFERENCES book.book(id),
    FOREIGN KEY (person_id) REFERENCES book.person(id)
);

-- Insert data
insert into book.address (npa, city) values (1000, 'Lausanne'); -- id 1
insert into book.address (npa, city) values (1400, 'Yverdon');
insert into book.address (npa, city) values (1450, 'Cheseaux');
insert into book.address (npa, city) values (2000, 'Neuchâtel');
insert into book.address (npa, city) values (3000, 'Berne');
insert into book.address (npa, city) values (4000, 'Bâle');
insert into book.address (npa, city) values (5000, 'Fribourg');

insert into book.person (name, lastname, address_id) values ('John', 'Doe', 2); -- id 1
insert into book.person (name, lastname, address_id) values ('Jane', 'Doe', 2);
insert into book.person (name, lastname, address_id) values ('Paul', 'Martin', 1);
insert into book.person (name, lastname, address_id) values ('Marc', 'Smith', 3);
insert into book.person (name, lastname, address_id) values ('Pierre', 'Dupont', 4);

insert into book.book (title, owner_id, year) values ('Le Petit Prince', 1, 1943); -- id 1
insert into book.book (title, owner_id, year) values ('Le Seigneur des Anneaux', 2, 1954);
insert into book.book (title, owner_id, year) values ('Harry Potter', 3, 1997);
insert into book.book (title, owner_id, year) values ('Le Hobbit', 4, 1937);
insert into book.book (title, owner_id, year) values ('Le Monde de Narnia', 5, 1950);

insert into book.read_by (book_id, person_id, when_read) values (1, 1, '2020-06-01'); -- id 1
insert into book.read_by (book_id, person_id, when_read) values (1, 2, '1954-07-14');
insert into book.read_by (book_id, person_id, when_read) values (1, 4, '1939-08-15');
insert into book.read_by (book_id, person_id, when_read) values (2, 3, '2012-06-06');
insert into book.read_by (book_id, person_id, when_read) values (5, 4, '2019-12-25');
