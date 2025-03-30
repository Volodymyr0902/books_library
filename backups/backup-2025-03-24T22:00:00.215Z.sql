/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `authors` (
  `id` varchar(256) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books` (
  `id` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `author_id` varchar(256) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `views` int DEFAULT '0',
  `clicks` int DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE
  SET
  NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `book_id` varchar(256) NOT NULL,
  `authors_ids` json DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '03c490c1-3c74-46eb-8765-29e3dc7dca32',
    'Len Bass, Ingo Weber, Liming Zhu'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '0585d677-cb6b-40bd-bb23-188b27f13026',
    'Mario Casciaro, Luciano Mammino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '083047e5-167b-4d2f-9e33-e87c0340937b',
    'Ryan Henson Creighton'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '09678c61-119c-49f2-96d6-3c3757187d0e',
    'Andrew K. Peterson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '0dc5baf7-7842-44d3-8575-7c1cd710f96e',
    'Kent Beck'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '0e7cf66a-c6d4-4417-be3a-c467f955cccc',
    'David Flanagan, Yukihiro Matsumoto'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '0fb166e7-b4f1-44dd-a680-81498241fc4a',
    'Michael Wittig, Andreas Wittig'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '1a7b8b78-a44e-44bc-a4b8-d3261f7c9d8f',
    'Peter Marwedel'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '1d4d6c7c-c18d-467c-8ad1-b8c4088a8800',
    'Kathy Sierra, Bert Bates'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '2a260ae4-7eee-44df-9987-eb0bbb0af6ce',
    'Raphael Hertzog, Jim O\'Gorman, Mati Aharoni'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '2e58de24-bdc3-44a4-987b-196b244f97dd',
    'Patrick Viafore'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '2f4f4193-ab59-44ba-9510-e1f8be14801b',
    'Sam Newman'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '3466f15a-22b0-4e3e-a8b1-1c773fbc947c',
    'Ross J. Anderson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '46e4eccb-7c4d-45c3-a171-285b0f5da003',
    'Leonard Richardson, Mike Amundsen, Sam Ruby'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '488abdf5-da49-48b9-b0ef-34e6119ab76b',
    'Keith J. Grant'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '4d5e7896-7278-4215-b543-0a6ed1047691',
    'Allen B. Downey, Chris Mayfield'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '5be540c7-c4d5-448d-b1ed-0f853772548e',
    'Richard E. Silverman'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '5c2b3d39-7dfa-4504-8512-a6ccc786ede5',
    'Anthony Molinaro'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '63e0ee44-2bf0-4c83-a83d-db898a7dea27',
    'Frank S. Chodorow'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '689143e1-deb0-4a3c-bbe1-cb384f0e9043',
    'Vincent Massol, Ted Husted'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '6898d321-08ba-470b-858b-a2e4c218f82a',
    'Alessandro Biessek'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '6e7d6c5f-eb3f-49a4-ac8e-e486f9471d94',
    'Matt Stauffer'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '7316379a-14c5-418b-bbe2-168a2d901390',
    'Bjarne Stroustrup'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '792095a6-af90-4971-b44b-323a62a384a7',
    'Dawn Griffiths, David Griffiths'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '7f39edea-ebad-46e1-915e-65030e0a80eb',
    'Kenneth Reek'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '86b08f3f-4c68-4caa-ac3a-061a5020ad30',
    'Rishal Hurbans'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '89ed7097-da18-4039-8f38-aa8e9149ce2a',
    'Neha Narkhede, Gwen Shapira, Todd Palino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '976086d9-dcda-4d37-890f-965a79848bc9',
    'Antonio Cisternino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '9b43ba76-3049-4b4c-98f9-4b746afa0f15',
    'Kelsey Hightower, Brendan Burns, Joe Beda'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'a24d1f2c-1e17-40da-a66f-52cc50c7a2cd',
    'Paul Barry'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'a608f8bb-9029-4b6b-928b-721148c557a3',
    'Robert Benefield'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'ae07ce39-f7cb-4442-a302-5275f6faeb98',
    'David S. Platt'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'ae8f31e5-31ea-4992-a079-185bf23f482b',
    'Andrew Ng'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b5bd4eea-924b-4f46-96ee-7cc8f813ccc0',
    'David J. Anderson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'bcffb974-c872-44c6-b3b7-ddc0d8a19fd3',
    'Cay S. Horstmann'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c0e44660-7da6-41a6-bfcc-2467cb6b2ead',
    'Tim Mather, Subra Kumaraswamy, Shahed Latif'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c345fc0c-c72b-4dc0-a8b1-8a6bc3abb5d7',
    'Eric Freeman, Elisabeth Robson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c4a6486e-02e5-4bd4-a10b-e6971f6b1af5',
    'Robert Sedgewick, Kevin Wayne'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c8c808ad-a672-49f5-adc4-44fcdac1a238',
    'Guillaume Gomez, Antoni Boucher'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c9b920fd-ee6e-4284-a9aa-62fda6d0ed54',
    'Michael J. Hernandez'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'cfecb104-9d25-4e03-854f-c8eb81bb97f7',
    'Alex Banks, Eve Porcello'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd318fb55-4d59-479f-8d92-d51bc14f5f0f',
    'William E. Shotts Jr.'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd3c696ce-79c2-484f-88d0-25bf32279df6',
    'Callum Macrae'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd4308071-c293-454a-9b0f-594e201a4260',
    'Daniel Higginbotham'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'dbe04091-2621-4b41-aca2-ebc451cc2f02',
    'Robert C. Martin'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'dd91d9b9-ffd2-4ad0-8607-38ba6f5499bb',
    'Venkat Subramaniam'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'df021995-f2d4-432c-8615-a0d0f4aebff1',
    'Stoyan Stefanov'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e68ac2f7-2b75-4af0-8693-cfc7a7b3a40d',
    'Ian Millington'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e76dbe52-1843-4569-a8a6-e57401db0633',
    'Stephen C. Dewhurst'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'f9254326-8eff-4358-9dee-75c3eb5830f7',
    'Jay McGavren'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'fc6a5520-c04a-4f0c-b405-035d48208436',
    'Nancy B. Stern, Robert A. Stern'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'fea1e779-e6dd-47ab-aebf-d2af975443a7',
    'Daniel Roy Greenfeld, Audrey Roy Greenfeld'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books
# ------------------------------------------------------------

INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'algos',
    'Algorithms',
    'c4a6486e-02e5-4bd4-a10b-e6971f6b1af5',
    2011,
    444,
    '12-34-567',
    'A comprehensive introduction to algorithms and data structures, covering fundamental concepts with practical applications.',
    6,
    12,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'aspnet',
    'ASP.NET in Action',
    'ae07ce39-f7cb-4442-a302-5275f6faeb98',
    2007,
    444,
    '12-34-567',
    'A practical guide to building dynamic web applications with ASP.NET, focusing on real-world scenarios and best practices.',
    3,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'asyncrust',
    'Async Rust',
    '09678c61-119c-49f2-96d6-3c3757187d0e',
    2020,
    444,
    '12-34-567',
    'A guide to writing asynchronous applications in Rust, focusing on concurrency and parallelism.',
    1,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'aws',
    'Amazon Web Services in Action',
    '0fb166e7-b4f1-44dd-a680-81498241fc4a',
    2018,
    444,
    '12-34-567',
    'A comprehensive guide to using Amazon Web Services (AWS) for cloud-based infrastructure and application development.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cats',
    'The Cat\'s Guide to Programming',
    '63e0ee44-2bf0-4c83-a83d-db898a7dea27',
    2009,
    444,
    '12-34-567',
    'A fun, introductory guide to programming for beginners, using cats as a metaphor to explain complex concepts.',
    3,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cleanagile',
    'Clean Agile: Back to Basics',
    'dbe04091-2621-4b41-aca2-ebc451cc2f02',
    2019,
    444,
    '12-34-567',
    'A deep dive into Agile principles and practices, focusing on the importance of discipline and simplicity.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cleanCode',
    'Clean Code: A Handbook of Agile Software Craftsmanship',
    'dbe04091-2621-4b41-aca2-ebc451cc2f02',
    2008,
    444,
    '12-34-567',
    'A guide to writing clean, maintainable, and scalable code, emphasizing best practices in software development.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cleanCoder',
    'The Clean Coder: A Code of Conduct for Professional Programmers',
    'dbe04091-2621-4b41-aca2-ebc451cc2f02',
    2011,
    444,
    '12-34-567',
    'A guide to the professional attitudes and behaviors that software developers need to cultivate to succeed in their careers.',
    2,
    3,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'clojure',
    'Clojure for the Brave and True',
    'd4308071-c293-454a-9b0f-594e201a4260',
    2015,
    444,
    '12-34-567',
    'An engaging and humorous introduction to the Clojure programming language, aimed at both beginners and experienced developers.',
    1,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cloudsecurity',
    'Cloud Security and Privacy',
    'c0e44660-7da6-41a6-bfcc-2467cb6b2ead',
    2009,
    444,
    '12-34-567',
    'A comprehensive guide to understanding the security and privacy concerns in cloud computing, and how to address them.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cobol',
    'COBOL for the 21st Century',
    'fc6a5520-c04a-4f0c-b405-035d48208436',
    2003,
    444,
    '12-34-567',
    'An introduction to COBOL, focusing on its relevance and use in modern enterprise applications.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cpointers',
    'C Pointers and Memory Management',
    '7f39edea-ebad-46e1-915e-65030e0a80eb',
    2000,
    444,
    '12-34-567',
    'A guide to understanding pointers in C programming and how to manage memory effectively in software applications.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cpp',
    'C++ Programming Language',
    '7316379a-14c5-418b-bbe2-168a2d901390',
    2013,
    444,
    '12-34-567',
    'The definitive reference on C++, written by the creator of the language, covering all aspects of C++ programming.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cppsoftdesign',
    'C++ Software Design',
    'e76dbe52-1843-4569-a8a6-e57401db0633',
    1999,
    444,
    '12-34-567',
    'A guide to designing software systems using C++, focusing on advanced techniques and principles of object-oriented design.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'cssindepth',
    'CSS in Depth',
    '488abdf5-da49-48b9-b0ef-34e6119ab76b',
    2019,
    444,
    '12-34-567',
    'A comprehensive guide to mastering CSS, covering advanced techniques and best practices for modern web design.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'dbdesign',
    'Database Design for Mere Mortals',
    'c9b920fd-ee6e-4284-a9aa-62fda6d0ed54',
    2013,
    444,
    '12-34-567',
    'An introduction to database design, focusing on the fundamentals of relational databases and how to structure data effectively.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'devopsOR',
    'DevOps: A Software Architect\'s Perspective',
    '03c490c1-3c74-46eb-8765-29e3dc7dca32',
    2015,
    444,
    '12-34-567',
    'An exploration of the DevOps movement and its impact on software architecture, offering practical advice and case studies.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'djangoinaction',
    'Django in Action',
    'fea1e779-e6dd-47ab-aebf-d2af975443a7',
    2018,
    444,
    '12-34-567',
    'A practical guide to building dynamic web applications with Django, covering its core features and advanced techniques.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'embedded',
    'Embedded Systems Design',
    '1a7b8b78-a44e-44bc-a4b8-d3261f7c9d8f',
    2011,
    444,
    '12-34-567',
    'A comprehensive guide to the design of embedded systems, focusing on both hardware and software aspects.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'fluentc',
    'Fluent C#',
    '976086d9-dcda-4d37-890f-965a79848bc9',
    2013,
    444,
    '12-34-567',
    'A guide to mastering C# programming, focusing on functional programming, LINQ, and other advanced C# features.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'flutterdart',
    'Flutter for Beginners',
    '6898d321-08ba-470b-858b-a2e4c218f82a',
    2020,
    444,
    '12-34-567',
    'A beginner-friendly guide to building mobile applications with the Flutter framework, covering both Dart programming and UI design.',
    1,
    2,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'fpjava',
    'Functional Programming in Java',
    'dd91d9b9-ffd2-4ad0-8607-38ba6f5499bb',
    2018,
    444,
    '12-34-567',
    'An introduction to functional programming principles, applying them to the Java programming language to improve code quality.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'gamesunity',
    'Unity 3D Game Development by Example',
    '083047e5-167b-4d2f-9e33-e87c0340937b',
    2014,
    444,
    '12-34-567',
    'A hands-on guide to building games with Unity 3D, using examples to demonstrate various game development techniques.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'gitpocket',
    'Git Pocket Guide',
    '5be540c7-c4d5-448d-b1ed-0f853772548e',
    2013,
    444,
    '12-34-567',
    'A compact guide to Git, covering essential commands and workflows for effective version control.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'goHF',
    'Head First Go',
    'f9254326-8eff-4358-9dee-75c3eb5830f7',
    2019,
    444,
    '12-34-567',
    'A learner-friendly introduction to the Go programming language, using engaging visuals and examples.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'grokAI',
    'Grokking Artificial Intelligence Algorithms',
    '86b08f3f-4c68-4caa-ac3a-061a5020ad30',
    2020,
    444,
    '12-34-567',
    'An accessible guide to understanding and implementing AI algorithms, with practical examples.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'javaHF',
    'Head First Java',
    '1d4d6c7c-c18d-467c-8ad1-b8c4088a8800',
    2005,
    444,
    '12-34-567',
    'An interactive and engaging introduction to Java programming, part of the Head First series.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'javakotlin',
    'Head First Kotlin',
    '792095a6-af90-4971-b44b-323a62a384a7',
    2019,
    444,
    '12-34-567',
    'A beginner-friendly guide to Kotlin programming, using the Head First series\' visual approach.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'jsHF',
    'Head First JavaScript Programming',
    'c345fc0c-c72b-4dc0-a8b1-8a6bc3abb5d7',
    2014,
    444,
    '12-34-567',
    'A learner-friendly guide to JavaScript, using the Head First series\' unique teaching methodology.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'k8s',
    'Kubernetes: Up and Running',
    '9b43ba76-3049-4b4c-98f9-4b746afa0f15',
    2017,
    444,
    '12-34-567',
    'A comprehensive guide to Kubernetes, explaining how to deploy, manage, and scale containerized applications.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'kafkaconnect',
    'Kafka: The Definitive Guide',
    '89ed7097-da18-4039-8f38-aa8e9149ce2a',
    2017,
    444,
    '12-34-567',
    'An in-depth look at Apache Kafka, covering its architecture, use cases, and best practices.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'kalilinux',
    'Kali Linux Revealed',
    '2a260ae4-7eee-44df-9987-eb0bbb0af6ce',
    2017,
    444,
    '12-34-567',
    'A comprehensive guide to Kali Linux, focusing on penetration testing and security assessments.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'kanban',
    'Kanban: Successful Evolutionary Change for Your Technology Business',
    'b5bd4eea-924b-4f46-96ee-7cc8f813ccc0',
    2010,
    444,
    '12-34-567',
    'An introduction to Kanban, providing strategies for improving processes and efficiency in technology businesses.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'laravel',
    'Laravel: Up & Running',
    '6e7d6c5f-eb3f-49a4-ac8e-e486f9471d94',
    2016,
    444,
    '12-34-567',
    'A practical guide to the Laravel PHP framework, covering its features and how to build applications with it.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'leandevops',
    'Lean DevOps: A Practical Guide to On-Demand Service Delivery',
    'a608f8bb-9029-4b6b-928b-721148c557a3',
    2020,
    444,
    '12-34-567',
    'A guide to integrating Lean principles with DevOps practices for efficient service delivery.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'machlearnr',
    'Machine Learning Yearning',
    'ae8f31e5-31ea-4992-a079-185bf23f482b',
    2018,
    444,
    '12-34-567',
    'A guide to structuring machine learning projects, offering insights into the practical aspects of building AI systems.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'microservices',
    'Building Microservices: Designing Fine-Grained Systems',
    '2f4f4193-ab59-44ba-9510-e1f8be14801b',
    2015,
    444,
    '12-34-567',
    'An exploration of microservices architecture, discussing its benefits, challenges, and best practices.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'nodeexpress',
    'Node.js Design Patterns',
    '0585d677-cb6b-40bd-bb23-188b27f13026',
    2014,
    444,
    '12-34-567',
    'A deep dive into design patterns and best practices for building scalable Node.js applications.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'phisicsgamedev',
    'Game Physics Engine Development',
    'e68ac2f7-2b75-4af0-8693-cfc7a7b3a40d',
    2007,
    444,
    '12-34-567',
    'A guide to developing physics engines for games, covering the mathematical and computational principles involved.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'pythonHF',
    'Head First Python',
    'a24d1f2c-1e17-40da-a66f-52cc50c7a2cd',
    2010,
    444,
    '12-34-567',
    'An engaging introduction to Python programming, using the Head First series\' visual and interactive approach.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'react',
    'Learning React: Functional Web Development with React and Redux',
    'cfecb104-9d25-4e03-854f-c8eb81bb97f7',
    2017,
    444,
    '12-34-567',
    'An introduction to building web applications with React and Redux, focusing on functional programming concepts.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'reactindepth',
    'React: Up & Running',
    'df021995-f2d4-432c-8615-a0d0f4aebff1',
    2016,
    444,
    '12-34-567',
    'A practical guide to getting started with React, covering its core concepts and application development.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'restful',
    'RESTful Web APIs',
    '46e4eccb-7c4d-45c3-a171-285b0f5da003',
    2013,
    444,
    '12-34-567',
    'A comprehensive guide to designing RESTful web APIs, covering principles, patterns, and best practices.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'robustpython',
    'Robust Python',
    '2e58de24-bdc3-44a4-987b-196b244f97dd',
    2021,
    444,
    '12-34-567',
    'A guide to writing reliable and maintainable Python code, focusing on best practices and design patterns.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'ruby',
    'The Ruby Programming Language',
    '0e7cf66a-c6d4-4417-be3a-c467f955cccc',
    2008,
    444,
    '12-34-567',
    'An authoritative guide to Ruby, written by the language\'s creator, Yukihiro Matsumoto.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'rust',
    'Rust Programming by Example',
    'c8c808ad-a672-49f5-adc4-44fcdac1a238',
    2018,
    444,
    '12-34-567',
    'A practical guide to learning Rust by building real-world projects and applications.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'scala',
    'Scala for the Impatient',
    'bcffb974-c872-44c6-b3b7-ddc0d8a19fd3',
    2012,
    444,
    '12-34-567',
    'A quick-start guide to Scala for developers familiar with Java, covering its key features and syntax.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'shell',
    'The Linux Command Line: A Complete Introduction',
    'd318fb55-4d59-479f-8d92-d51bc14f5f0f',
    2012,
    444,
    '12-34-567',
    'A thorough introduction to the Linux command line, covering shell scripting and command-line utilities.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'smalltalk',
    'Smalltalk Best Practice Patterns',
    '0dc5baf7-7842-44d3-8575-7c1cd710f96e',
    1996,
    444,
    '12-34-567',
    'A collection of best practices and patterns for Smalltalk programming, emphasizing simplicity and effectiveness.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'softSecur',
    'Security Engineering: A Guide to Building Dependable Distributed Systems',
    '3466f15a-22b0-4e3e-a8b1-1c773fbc947c',
    2020,
    444,
    '12-34-567',
    'An in-depth guide to security engineering, focusing on building dependable and secure distributed systems.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'sqlcook',
    'SQL Cookbook: Query Solutions and Techniques for Database Developers',
    '5c2b3d39-7dfa-4504-8512-a6ccc786ede5',
    2005,
    444,
    '12-34-567',
    'A collection of practical solutions to common SQL challenges, providing techniques for efficient database querying.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'thinkjava',
    'Think Java: How to Think Like a Computer Scientist',
    '4d5e7896-7278-4215-b543-0a6ed1047691',
    2012,
    444,
    '12-34-567',
    'An introduction to programming with Java, emphasizing problem-solving and computational thinking.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'unittesting',
    'JUnit in Action',
    '689143e1-deb0-4a3c-bbe1-cb384f0e9043',
    2003,
    444,
    '12-34-567',
    'A guide to writing and running unit tests with JUnit, covering best practices and strategies for test-driven development.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );
INSERT INTO
  `books` (
    `id`,
    `title`,
    `author_id`,
    `year`,
    `pages`,
    `isbn`,
    `description`,
    `views`,
    `clicks`,
    `deleted_at`,
    `timestamp`
  )
VALUES
  (
    'vue',
    'Vue.js Up and Running',
    'd3c696ce-79c2-484f-88d0-25bf32279df6',
    2018,
    444,
    '12-34-567',
    'An introduction to building web applications with Vue.js, covering its core features and best practices.',
    0,
    0,
    NULL,
    '2025-03-21 21:35:37'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'algos',
    '[\"c4a6486e-02e5-4bd4-a10b-e6971f6b1af5\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'aspnet',
    '[\"ae07ce39-f7cb-4442-a302-5275f6faeb98\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'asyncrust',
    '[\"09678c61-119c-49f2-96d6-3c3757187d0e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'aws',
    '[\"0fb166e7-b4f1-44dd-a680-81498241fc4a\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cats',
    '[\"63e0ee44-2bf0-4c83-a83d-db898a7dea27\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cleanagile',
    '[\"dbe04091-2621-4b41-aca2-ebc451cc2f02\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cleanCode',
    '[\"dbe04091-2621-4b41-aca2-ebc451cc2f02\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cleanCoder',
    '[\"dbe04091-2621-4b41-aca2-ebc451cc2f02\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'clojure',
    '[\"d4308071-c293-454a-9b0f-594e201a4260\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cloudsecurity',
    '[\"c0e44660-7da6-41a6-bfcc-2467cb6b2ead\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cobol',
    '[\"fc6a5520-c04a-4f0c-b405-035d48208436\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cpointers',
    '[\"7f39edea-ebad-46e1-915e-65030e0a80eb\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cpp',
    '[\"7316379a-14c5-418b-bbe2-168a2d901390\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cppsoftdesign',
    '[\"e76dbe52-1843-4569-a8a6-e57401db0633\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cssindepth',
    '[\"488abdf5-da49-48b9-b0ef-34e6119ab76b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'dbdesign',
    '[\"c9b920fd-ee6e-4284-a9aa-62fda6d0ed54\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'devopsOR',
    '[\"03c490c1-3c74-46eb-8765-29e3dc7dca32\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'djangoinaction',
    '[\"fea1e779-e6dd-47ab-aebf-d2af975443a7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'embedded',
    '[\"1a7b8b78-a44e-44bc-a4b8-d3261f7c9d8f\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'fluentc',
    '[\"976086d9-dcda-4d37-890f-965a79848bc9\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'flutterdart',
    '[\"6898d321-08ba-470b-858b-a2e4c218f82a\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'fpjava',
    '[\"dd91d9b9-ffd2-4ad0-8607-38ba6f5499bb\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'gamesunity',
    '[\"083047e5-167b-4d2f-9e33-e87c0340937b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'gitpocket',
    '[\"5be540c7-c4d5-448d-b1ed-0f853772548e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'goHF',
    '[\"f9254326-8eff-4358-9dee-75c3eb5830f7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'grokAI',
    '[\"86b08f3f-4c68-4caa-ac3a-061a5020ad30\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'javaHF',
    '[\"1d4d6c7c-c18d-467c-8ad1-b8c4088a8800\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'javakotlin',
    '[\"792095a6-af90-4971-b44b-323a62a384a7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'jsHF',
    '[\"c345fc0c-c72b-4dc0-a8b1-8a6bc3abb5d7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'k8s',
    '[\"9b43ba76-3049-4b4c-98f9-4b746afa0f15\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'kafkaconnect',
    '[\"89ed7097-da18-4039-8f38-aa8e9149ce2a\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'kalilinux',
    '[\"2a260ae4-7eee-44df-9987-eb0bbb0af6ce\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'kanban',
    '[\"b5bd4eea-924b-4f46-96ee-7cc8f813ccc0\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'laravel',
    '[\"6e7d6c5f-eb3f-49a4-ac8e-e486f9471d94\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'leandevops',
    '[\"a608f8bb-9029-4b6b-928b-721148c557a3\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'machlearnr',
    '[\"ae8f31e5-31ea-4992-a079-185bf23f482b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'microservices',
    '[\"2f4f4193-ab59-44ba-9510-e1f8be14801b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'nodeexpress',
    '[\"0585d677-cb6b-40bd-bb23-188b27f13026\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'phisicsgamedev',
    '[\"e68ac2f7-2b75-4af0-8693-cfc7a7b3a40d\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'pythonHF',
    '[\"a24d1f2c-1e17-40da-a66f-52cc50c7a2cd\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'react',
    '[\"cfecb104-9d25-4e03-854f-c8eb81bb97f7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'reactindepth',
    '[\"df021995-f2d4-432c-8615-a0d0f4aebff1\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'restful',
    '[\"46e4eccb-7c4d-45c3-a171-285b0f5da003\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'robustpython',
    '[\"2e58de24-bdc3-44a4-987b-196b244f97dd\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'ruby',
    '[\"0e7cf66a-c6d4-4417-be3a-c467f955cccc\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'rust',
    '[\"c8c808ad-a672-49f5-adc4-44fcdac1a238\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'scala',
    '[\"bcffb974-c872-44c6-b3b7-ddc0d8a19fd3\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'shell',
    '[\"d318fb55-4d59-479f-8d92-d51bc14f5f0f\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'smalltalk',
    '[\"0dc5baf7-7842-44d3-8575-7c1cd710f96e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'softSecur',
    '[\"3466f15a-22b0-4e3e-a8b1-1c773fbc947c\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'sqlcook',
    '[\"5c2b3d39-7dfa-4504-8512-a6ccc786ede5\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'thinkjava',
    '[\"4d5e7896-7278-4215-b543-0a6ed1047691\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'unittesting',
    '[\"689143e1-deb0-4a3c-bbe1-cb384f0e9043\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'vue',
    '[\"d3c696ce-79c2-484f-88d0-25bf32279df6\"]'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
