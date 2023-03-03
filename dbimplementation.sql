DROP TABLE IF EXISTS Movies
DROP TABLE IF EXISTS Actors
DROP TABLE IF EXISTS Directors
DROP TABLE IF EXISTS Rating
DROP TABLE IF EXISTS User
DROP TABLE IF EXISTS Role

CREATE TABLE Movies (
    id INT,
    release DATE,
    genre VARCHAR(50),
    runtime VARCHAR(50),
    title VARCHAR(100),
    language VARCHAR(50),
	Primary Key (id)
)

CREATE TABLE Actors (
    id INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY (id)
)

CREATE TABLE Directors (
    id INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY (id)
)

CREATE TABLE appUser (
    id INT,
    username VARCHAR(50),
    isAdmin BOOLEAN,
    PRIMARY KEY (id)
)

CREATE TABLE Rating (
    score INT,
    rating_id INT,
    user_id INT,
    movie_id INT,
    time timestamp,
    PRIMARY KEY (rating_id, user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES appUser(id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id)
)

CREATE TABLE Role (
    movie_id INT,
    actor_id INT,
    role VARCHAR(50),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id)
)