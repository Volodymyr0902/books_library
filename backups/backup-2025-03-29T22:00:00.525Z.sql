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
  `book_id` varchar(256) DEFAULT NULL,
  `author_id` varchar(256) DEFAULT NULL,
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '010fe0fd-e3a0-4f87-9315-70ad5533d997',
    'David Flanagan, Yukihiro Matsumoto'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '039af170-8494-4dc3-a176-621bc41ff387',
    'Alex Banks, Eve Porcello'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '09bf7c74-7cf2-4a31-9dd7-b6111f31c339',
    'Andrew K. Peterson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '11d8a372-0580-4415-8db5-4ac60dfa2041',
    'Ryan Henson Creighton'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '12397cbb-6597-4ce6-a63e-190a54a5d62b',
    'Kenneth Reek'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '1335294d-c07a-452b-a0bb-09f425f5e09c',
    'Rishal Hurbans'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '1343606f-cb92-4423-a80c-c34b0f23e950',
    'David S. Platt'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '14a534c0-04d6-4286-be6c-b6cda3d6977d',
    'wdefgree'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '229156e8-d81a-49e5-8963-dca89d7d1808',
    'Allen B. Downey, Chris Mayfield'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '252370d0-c725-4d42-9fd4-ceddffd6fa64',
    'Paul Barry'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '2a49293a-2a9e-4f90-a604-17522af8d5c1',
    'Kelsey Hightower, Brendan Burns, Joe Beda'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '301c3bd0-4f38-4dd0-832c-a53123df640f',
    'Jay McGavren'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '337ad0bd-b2b1-4088-aa41-aebbadf86e11',
    'Guillaume Gomez, Antoni Boucher'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '3e339c3b-b2ff-4461-a2de-96a80edc61a4',
    'Alessandro Biessek'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '46c07c7e-062a-465c-972a-b5e9a4eef460',
    'jrhgjrgrgh'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '47e7941e-9fec-4377-a15a-007a7a4fc3cc',
    'Leonard Richardson, Mike Amundsen, Sam Ruby'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '47f0c5cc-3a9e-4335-b7c5-53d1395b5857',
    'Robert Benefield'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '4d46b69a-82c6-4b55-9c46-e54ae4fab736',
    'Daniel Higginbotham'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '5201f642-ea3f-4433-8e7f-d6a9faafb329',
    'Patrick Viafore'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '566efa72-be00-4332-95f9-91b67097ada4',
    'Eric Freeman, Elisabeth Robson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '5ed0a9b4-f8b4-4f1b-985f-bb8667a3504e',
    'Robert C. Martin'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '5f94ca0f-a970-4bd2-b031-90351d009f32',
    'Stephen C. Dewhurst'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '603ba27f-0501-4980-9263-4ca69639cb65',
    'Raphael Hertzog, Jim O\'Gorman, Mati Aharoni'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('63066ba0-73bd-4b38-948e-6ec2e490bb0a', 'dwwfvee');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '648bae0a-9978-496c-b08b-7109a45665a8',
    'Kathy Sierra, Bert Bates'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '6639a69d-5c57-4db8-824b-905b847bfe1b',
    'Mario Casciaro, Luciano Mammino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '6703fa39-78b2-43a0-9b20-8923e8d82d12',
    'Robert Sedgewick, Kevin Wayne'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '6a329fd6-53b2-41ba-b758-e908394ad9fe',
    'Cay S. Horstmann'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '732f3edb-3b31-45c4-8709-33f27ba0d044',
    'William E. Shotts Jr.'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '7337b77b-4132-44d9-b2fc-c6b2059ca1f5',
    'Ian Millington'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '78283b2b-7722-484d-99f8-d15b8714bbc5',
    'Ross J. Anderson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '7ecdf539-c263-40d9-a609-c59f6686a3b5',
    'Daniel Roy Greenfeld, Audrey Roy Greenfeld'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '89804583-883c-4ea5-a0d1-a8f343275e0f',
    'Richard E. Silverman'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '8cb85954-ebb1-4b71-86c6-8d1f7017a0e9',
    'Neha Narkhede, Gwen Shapira, Todd Palino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '94c41840-60c7-44c7-a05a-01c76ac2de3b',
    'Keith J. Grant'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '99159d5f-18bf-4d3d-b269-d3148d14fcb5',
    'Venkat Subramaniam'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '9931957b-f3b7-4987-b4c2-520e1fc1e00d',
    'Michael Wittig, Andreas Wittig'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'aa3ec189-7e95-4887-b59d-a2694cf3718b',
    'Callum Macrae'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'ac07ea87-5fde-468a-a55f-0f34a18b78ab',
    'Nancy B. Stern, Robert A. Stern'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b4a5abd5-1b6f-49d6-8cb3-bd73af7bc0d1',
    'njhcjhcj'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b52ae4bf-341b-44b7-9c60-f37e64977761',
    'Peter Marwedel'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b7c035f6-67fa-483e-8fac-f5dbdaed9dc3',
    'Sam Newman'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b99910fe-3b0e-4223-a906-cee2113369d4',
    'Dawn Griffiths, David Griffiths'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c13eb8a9-9c42-4422-8963-e8d6269e65f6',
    'Michael J. Hernandez'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c310652c-1db7-4db5-9a72-09584a2187d7',
    'Antonio Cisternino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c35946bb-0167-4715-bffa-6febe9093589',
    'Stoyan Stefanov'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'cc1d8db2-b7a6-45c4-a023-7ad5a8e24e2a',
    'Matt Stauffer'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd01bda53-1a60-4cf2-9d75-4704e314e564',
    'Bjarne Stroustrup'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd29c06af-e44c-40cd-81ae-e9a94c62fd3f',
    'Kent Beck'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'db483d5d-48e4-4454-b3b0-b1c17672aeed',
    'rgrgergerg'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'de1916b3-9c3e-41d9-82c9-d6a07a86a5e2',
    'Vincent Massol, Ted Husted'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'df93d686-8f36-40d0-8fe2-16a968ab9f7f',
    'Frank S. Chodorow'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e5d5b624-e38d-4e52-919b-8e7c194a4642',
    'Anthony Molinaro'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e9cc3d4a-c25f-444f-afe0-fd54c1d7a418',
    'David J. Anderson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'ec3494d9-ea3d-4ba2-b2bb-6051cf0c19d3',
    'Len Bass, Ingo Weber, Liming Zhu'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('eeerrr', 'Maria Dou');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'f24bca9d-ccc8-42a6-a31a-16706d1a0b90',
    'Tim Mather, Subra Kumaraswamy, Shahed Latif'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'f91d42fe-b654-4249-b568-7fea2764ec61',
    'Andrew Ng'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('qqqwww', 'John Dou');

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
    '2c0ea2c8-89cb-4cbc-8d9e-fe66c6c84705',
    'grrgergrgrge',
    'db483d5d-48e4-4454-b3b0-b1c17672aeed',
    343443,
    444,
    '12-34-567',
    'rgrgergrggr',
    1,
    4,
    NULL,
    '2025-03-28 18:35:46'
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
    'aaasss',
    'The Book',
    NULL,
    2025,
    555,
    '1-23-456',
    'jdsrhbrhkbhrkrdhrhgkjjkhrgjhkrgshjkrgsh',
    3,
    18,
    NULL,
    '2025-03-27 22:20:43'
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
    'algos',
    'Algorithms',
    '6703fa39-78b2-43a0-9b20-8923e8d82d12',
    2011,
    444,
    '12-34-567',
    'A comprehensive introduction to algorithms and data structures, covering fundamental concepts with practical applications.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '1343606f-cb92-4423-a80c-c34b0f23e950',
    2007,
    444,
    '12-34-567',
    'A practical guide to building dynamic web applications with ASP.NET, focusing on real-world scenarios and best practices.',
    1,
    5,
    NULL,
    '2025-03-27 22:06:33'
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
    '09bf7c74-7cf2-4a31-9dd7-b6111f31c339',
    2020,
    444,
    '12-34-567',
    'A guide to writing asynchronous applications in Rust, focusing on concurrency and parallelism.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '9931957b-f3b7-4987-b4c2-520e1fc1e00d',
    2018,
    444,
    '12-34-567',
    'A comprehensive guide to using Amazon Web Services (AWS) for cloud-based infrastructure and application development.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'df93d686-8f36-40d0-8fe2-16a968ab9f7f',
    2009,
    444,
    '12-34-567',
    'A fun, introductory guide to programming for beginners, using cats as a metaphor to explain complex concepts.',
    2,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '5ed0a9b4-f8b4-4f1b-985f-bb8667a3504e',
    2019,
    444,
    '12-34-567',
    'A deep dive into Agile principles and practices, focusing on the importance of discipline and simplicity.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '5ed0a9b4-f8b4-4f1b-985f-bb8667a3504e',
    2008,
    444,
    '12-34-567',
    'A guide to writing clean, maintainable, and scalable code, emphasizing best practices in software development.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '5ed0a9b4-f8b4-4f1b-985f-bb8667a3504e',
    2011,
    444,
    '12-34-567',
    'A guide to the professional attitudes and behaviors that software developers need to cultivate to succeed in their careers.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '4d46b69a-82c6-4b55-9c46-e54ae4fab736',
    2015,
    444,
    '12-34-567',
    'An engaging and humorous introduction to the Clojure programming language, aimed at both beginners and experienced developers.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'f24bca9d-ccc8-42a6-a31a-16706d1a0b90',
    2009,
    444,
    '12-34-567',
    'A comprehensive guide to understanding the security and privacy concerns in cloud computing, and how to address them.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'ac07ea87-5fde-468a-a55f-0f34a18b78ab',
    2003,
    444,
    '12-34-567',
    'An introduction to COBOL, focusing on its relevance and use in modern enterprise applications.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '12397cbb-6597-4ce6-a63e-190a54a5d62b',
    2000,
    444,
    '12-34-567',
    'A guide to understanding pointers in C programming and how to manage memory effectively in software applications.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'd01bda53-1a60-4cf2-9d75-4704e314e564',
    2013,
    444,
    '12-34-567',
    'The definitive reference on C++, written by the creator of the language, covering all aspects of C++ programming.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '5f94ca0f-a970-4bd2-b031-90351d009f32',
    1999,
    444,
    '12-34-567',
    'A guide to designing software systems using C++, focusing on advanced techniques and principles of object-oriented design.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '94c41840-60c7-44c7-a05a-01c76ac2de3b',
    2019,
    444,
    '12-34-567',
    'A comprehensive guide to mastering CSS, covering advanced techniques and best practices for modern web design.',
    1,
    3,
    NULL,
    '2025-03-27 22:06:33'
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
    'c13eb8a9-9c42-4422-8963-e8d6269e65f6',
    2013,
    444,
    '12-34-567',
    'An introduction to database design, focusing on the fundamentals of relational databases and how to structure data effectively.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'ec3494d9-ea3d-4ba2-b2bb-6051cf0c19d3',
    2015,
    444,
    '12-34-567',
    'An exploration of the DevOps movement and its impact on software architecture, offering practical advice and case studies.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '7ecdf539-c263-40d9-a609-c59f6686a3b5',
    2018,
    444,
    '12-34-567',
    'A practical guide to building dynamic web applications with Django, covering its core features and advanced techniques.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'b52ae4bf-341b-44b7-9c60-f37e64977761',
    2011,
    444,
    '12-34-567',
    'A comprehensive guide to the design of embedded systems, focusing on both hardware and software aspects.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'c310652c-1db7-4db5-9a72-09584a2187d7',
    2013,
    444,
    '12-34-567',
    'A guide to mastering C# programming, focusing on functional programming, LINQ, and other advanced C# features.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '3e339c3b-b2ff-4461-a2de-96a80edc61a4',
    2020,
    444,
    '12-34-567',
    'A beginner-friendly guide to building mobile applications with the Flutter framework, covering both Dart programming and UI design.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '99159d5f-18bf-4d3d-b269-d3148d14fcb5',
    2018,
    444,
    '12-34-567',
    'An introduction to functional programming principles, applying them to the Java programming language to improve code quality.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '11d8a372-0580-4415-8db5-4ac60dfa2041',
    2014,
    444,
    '12-34-567',
    'A hands-on guide to building games with Unity 3D, using examples to demonstrate various game development techniques.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '89804583-883c-4ea5-a0d1-a8f343275e0f',
    2013,
    444,
    '12-34-567',
    'A compact guide to Git, covering essential commands and workflows for effective version control.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '301c3bd0-4f38-4dd0-832c-a53123df640f',
    2019,
    444,
    '12-34-567',
    'A learner-friendly introduction to the Go programming language, using engaging visuals and examples.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '1335294d-c07a-452b-a0bb-09f425f5e09c',
    2020,
    444,
    '12-34-567',
    'An accessible guide to understanding and implementing AI algorithms, with practical examples.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '648bae0a-9978-496c-b08b-7109a45665a8',
    2005,
    444,
    '12-34-567',
    'An interactive and engaging introduction to Java programming, part of the Head First series.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'b99910fe-3b0e-4223-a906-cee2113369d4',
    2019,
    444,
    '12-34-567',
    'A beginner-friendly guide to Kotlin programming, using the Head First series\' visual approach.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '566efa72-be00-4332-95f9-91b67097ada4',
    2014,
    444,
    '12-34-567',
    'A learner-friendly guide to JavaScript, using the Head First series\' unique teaching methodology.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '2a49293a-2a9e-4f90-a604-17522af8d5c1',
    2017,
    444,
    '12-34-567',
    'A comprehensive guide to Kubernetes, explaining how to deploy, manage, and scale containerized applications.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '8cb85954-ebb1-4b71-86c6-8d1f7017a0e9',
    2017,
    444,
    '12-34-567',
    'An in-depth look at Apache Kafka, covering its architecture, use cases, and best practices.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '603ba27f-0501-4980-9263-4ca69639cb65',
    2017,
    444,
    '12-34-567',
    'A comprehensive guide to Kali Linux, focusing on penetration testing and security assessments.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'e9cc3d4a-c25f-444f-afe0-fd54c1d7a418',
    2010,
    444,
    '12-34-567',
    'An introduction to Kanban, providing strategies for improving processes and efficiency in technology businesses.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'cc1d8db2-b7a6-45c4-a023-7ad5a8e24e2a',
    2016,
    444,
    '12-34-567',
    'A practical guide to the Laravel PHP framework, covering its features and how to build applications with it.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '47f0c5cc-3a9e-4335-b7c5-53d1395b5857',
    2020,
    444,
    '12-34-567',
    'A guide to integrating Lean principles with DevOps practices for efficient service delivery.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'f91d42fe-b654-4249-b568-7fea2764ec61',
    2018,
    444,
    '12-34-567',
    'A guide to structuring machine learning projects, offering insights into the practical aspects of building AI systems.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'b7c035f6-67fa-483e-8fac-f5dbdaed9dc3',
    2015,
    444,
    '12-34-567',
    'An exploration of microservices architecture, discussing its benefits, challenges, and best practices.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '6639a69d-5c57-4db8-824b-905b847bfe1b',
    2014,
    444,
    '12-34-567',
    'A deep dive into design patterns and best practices for building scalable Node.js applications.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '7337b77b-4132-44d9-b2fc-c6b2059ca1f5',
    2007,
    444,
    '12-34-567',
    'A guide to developing physics engines for games, covering the mathematical and computational principles involved.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '252370d0-c725-4d42-9fd4-ceddffd6fa64',
    2010,
    444,
    '12-34-567',
    'An engaging introduction to Python programming, using the Head First series\' visual and interactive approach.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '039af170-8494-4dc3-a176-621bc41ff387',
    2017,
    444,
    '12-34-567',
    'An introduction to building web applications with React and Redux, focusing on functional programming concepts.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'c35946bb-0167-4715-bffa-6febe9093589',
    2016,
    444,
    '12-34-567',
    'A practical guide to getting started with React, covering its core concepts and application development.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '47e7941e-9fec-4377-a15a-007a7a4fc3cc',
    2013,
    444,
    '12-34-567',
    'A comprehensive guide to designing RESTful web APIs, covering principles, patterns, and best practices.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '5201f642-ea3f-4433-8e7f-d6a9faafb329',
    2021,
    444,
    '12-34-567',
    'A guide to writing reliable and maintainable Python code, focusing on best practices and design patterns.',
    1,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '010fe0fd-e3a0-4f87-9315-70ad5533d997',
    2008,
    444,
    '12-34-567',
    'An authoritative guide to Ruby, written by the language\'s creator, Yukihiro Matsumoto.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '337ad0bd-b2b1-4088-aa41-aebbadf86e11',
    2018,
    444,
    '12-34-567',
    'A practical guide to learning Rust by building real-world projects and applications.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '6a329fd6-53b2-41ba-b758-e908394ad9fe',
    2012,
    444,
    '12-34-567',
    'A quick-start guide to Scala for developers familiar with Java, covering its key features and syntax.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '732f3edb-3b31-45c4-8709-33f27ba0d044',
    2012,
    444,
    '12-34-567',
    'A thorough introduction to the Linux command line, covering shell scripting and command-line utilities.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'd29c06af-e44c-40cd-81ae-e9a94c62fd3f',
    1996,
    444,
    '12-34-567',
    'A collection of best practices and patterns for Smalltalk programming, emphasizing simplicity and effectiveness.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '78283b2b-7722-484d-99f8-d15b8714bbc5',
    2020,
    444,
    '12-34-567',
    'An in-depth guide to security engineering, focusing on building dependable and secure distributed systems.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'e5d5b624-e38d-4e52-919b-8e7c194a4642',
    2005,
    444,
    '12-34-567',
    'A collection of practical solutions to common SQL challenges, providing techniques for efficient database querying.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    '229156e8-d81a-49e5-8963-dca89d7d1808',
    2012,
    444,
    '12-34-567',
    'An introduction to programming with Java, emphasizing problem-solving and computational thinking.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'de1916b3-9c3e-41d9-82c9-d6a07a86a5e2',
    2003,
    444,
    '12-34-567',
    'A guide to writing and running unit tests with JUnit, covering best practices and strategies for test-driven development.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
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
    'aa3ec189-7e95-4887-b59d-a2694cf3718b',
    2018,
    444,
    '12-34-567',
    'An introduction to building web applications with Vue.js, covering its core features and best practices.',
    0,
    0,
    NULL,
    '2025-03-27 22:06:33'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  ('aaasss', 'qqqwww');
INSERT INTO
  `books_authors` (`book_id`, `author_id`)
VALUES
  ('aaasss', 'eeerrr');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
