CREATE DATABASE IF NOT EXISTS library;

USE library;

CREATE TABLE
    IF NOT EXISTS BookTypes (
        typeID INT PRIMARY KEY,
        types ENUM (
            'Kindle Book',
            'EPUB ebook',
            'Paperback',
            'Hardcover'
        ) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Publishers (
        publisherID INT PRIMARY KEY,
        publisherName VARCHAR(250) UNIQUE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Genres (
        genreID INT PRIMARY KEY,
        fictionCheck ENUM ('Fiction', 'Non Fiction'),
        genre VARCHAR(500)
    );

CREATE TABLE
    IF NOT EXISTS Books (
        bookID INT PRIMARY KEY,
        bookName VARCHAR(250) NOT NULL UNIQUE,
        yearPublished INT NOT NULL,
        seriesName VARCHAR(250),
        description TEXT,
        genreID INT NOT NULL,
        publisherID INT NOT NULL,
        typeID INT NOT NULL,
        FOREIGN KEY (genreID) REFERENCES Genres (genreID),
        FOREIGN KEY (publisherID) REFERENCES Publishers (publisherID),
        FOREIGN KEY (typeID) REFERENCES BookTypes (typeID)
    );

CREATE TABLE
    IF NOT EXISTS Authors (
        authorID INT PRIMARY KEY,
        authorFirstName VARCHAR(100) NOT NULL,
        authorLastName VARCHAR(100) NOT NULL,
        countryBornIn VARCHAR(100) NOT NULL,
        yearBornOn INT NOT NULL,
        aliveOrDead ENUM ('Alive', 'Dead') NOT NULL
    );

CREATE TABLE
    AuthorsBooks (
        authorID INT NOT NULL,
        bookID INT NOT NULL,
        FOREIGN KEY (authorID) REFERENCES Authors (authorID),
        FOREIGN KEY (bookID) REFERENCES Books (bookID)
    );

INSERT INTO
    Publishers (publisherID, publisherName)
VALUES
    (1, 'Harper Collins'),
    (2, 'Merriam-Webster'),
    (3, 'Penguin Random House');

INSERT INTO
    Genres (genreID, fictionCheck, genre)
VALUES
    (1, 'Non Fiction', 'Philosophy'),
    (
        2,
        'Non Fiction',
        'Self-Improvement & Inspiration'
    ),
    (3, 'Non Fiction', 'Biographies & Memoirs'),
    (4, 'Non Fiction', 'History'),
    (5, 'Fiction', 'Fantasy'),
    (6, 'Fiction', 'Adventures');

INSERT INTO
    BookTypes (typeID, types)
VALUES
    (1, 'Kindle Book'),
    (2, 'EPUB ebook'),
    (3, 'Paperback'),
    (4, 'Hardcover');

INSERT INTO
    Books (
        bookID,
        bookName,
        yearPublished,
        description,
        genreID,
        publisherID,
        typeID
    )
VALUES
    (
        1,
        'We Can Do Hard Things',
        2025,
        "#1 NATIONAL BESTSELLER • The award-winning podcasters Glennon Doyle, Abby Wambach, and Amanda Doyle created We Can Do Hard Things—the guidebook for being alive—to help fellow travelers find their way through life. When you travel through a new country, you need a guidebook. When you travel through love, heartbreak, joy, parenting, friendship, uncertainty, aging, grief, new beginnings—life—you need a guidebook, too.",
        1,
        3,
        1
    );

INSERT INTO
    Authors (
        authorID,
        authorFirstName,
        authorLastName,
        countryBornIn,
        yearBornOn,
        aliveOrDead
    )
VALUES
    (1, ' Glennon', 'Doyle', 'USA', 1976, 'Alive');
