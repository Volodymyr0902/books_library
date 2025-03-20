CREATE DATABASE IF NOT EXISTS books_lib;

USE books_lib;

CREATE TABLE IF NOT EXISTS authors (
    id VARCHAR(256) PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE IF NOT EXISTS books (
    id VARCHAR(256) PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    author_id VARCHAR(256),
    year INT,
    pages INT,
    isbn VARCHAR(13),
    description VARCHAR(256),
    views INT DEFAULT 0,
    clicks INT DEFAULT 0,
    timestamp DATETIME DEFAULT now(),
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE SET NULL
);