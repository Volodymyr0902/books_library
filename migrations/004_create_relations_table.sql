USE books_lib;

CREATE TABLE books_authors (
    book_id VARCHAR(256) PRIMARY KEY,
    authors_ids JSON,
    FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE
);