USE books_lib;

CREATE TABLE books_authors (
    book_id VARCHAR(256),
    author_id VARCHAR(256),
    FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);