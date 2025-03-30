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
    '05403bf0-ed51-4320-bc62-47895fb8affe',
    'Frank S. Chodorow'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '0a894c99-78b6-43d9-8ccb-45337582dabe',
    'Stoyan Stefanov'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('0c63db7d-a38f-46f0-9bff-1e4c12cec950', 'csmkdkm');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '0d1556ad-bdb4-45ba-ab14-9cc8775c1a29',
    'Ian Millington'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '19d6c95f-1266-46d0-9e6f-fe324d873a03',
    'Guillaume Gomez, Antoni Boucher'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '1f4dffc1-bd45-43b9-ba40-76c29b4621fe',
    'fjhfefej'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '21d9a408-ecea-4b65-88c0-4f89e7158a8c',
    'Stephen C. Dewhurst'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '2316e958-f714-4ef7-be5f-4dfcc947ae49',
    'Daniel Roy Greenfeld, Audrey Roy Greenfeld'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '26af51be-5bd7-4299-b2c2-33eef1ee955f',
    'Andrew K. Peterson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '2be95fee-08bf-481d-a0b8-319a38819eb9',
    'Michael J. Hernandez'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('3c338662-17e9-4226-b195-2444c5fa07bf', 'bjbbbh');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '3d0dac3e-5699-45d9-9979-ffa7174cfb06',
    'Peter Marwedel'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '3f0db9f8-69b7-4317-b330-847735f73a27',
    'Michael Wittig, Andreas Wittig'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '475da840-68ad-44ab-90d7-fb9abdcc8321',
    'Kathy Sierra, Bert Bates'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '499e2dae-bd3e-429d-a60d-9a702bfc5ec7',
    'njnjfdjfe'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '4fd0508b-8f3f-4fc7-b949-7d81e9a8d7fc',
    'Neha Narkhede, Gwen Shapira, Todd Palino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '51e3447b-0227-467b-9a8e-8a9e8ecf39b9',
    'Mario Casciaro, Luciano Mammino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('55d6d6b9-c64f-4c44-b66d-863629e1d3ff', 'dvjndnj');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '651ac371-14cd-4480-ba56-65c77538fa40',
    'Tim Mather, Subra Kumaraswamy, Shahed Latif'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '6c80b6e7-bc02-49b5-b12e-8cb23409cca7',
    'Alex Banks, Eve Porcello'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '724a14a5-2538-46d0-a1f4-ad6acb190a69',
    'Paul Barry'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('797be6d7-1f3d-4cdc-a25a-1d1cf0e091ad', 'jnfnj');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '7bd1eddd-a186-4ca5-98bd-d782344c8008',
    'Robert Benefield'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '81ba90b5-2e2d-4df1-8c04-575ef26cca67',
    'Kent Beck'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '847dc8fd-b609-4209-b84a-b4b1168d743c',
    'Venkat Subramaniam'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '85c7fca9-0e84-416a-ac1b-738591e61caa',
    'Robert C. Martin'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '86883728-6cf3-477f-b441-8c25cd5d3ba6',
    'Vincent Massol, Ted Husted'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '88a671ce-c28a-4762-b022-59522d223c05',
    'Ross J. Anderson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '8ed228bb-d28e-41cb-932d-31b3bc600529',
    'David J. Anderson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '914dfe29-9752-4205-a341-b543c08b54ed',
    'Bjarne Stroustrup'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '973e3ca7-d497-41dc-bc87-d7b38e1199c4',
    'Eric Freeman, Elisabeth Robson'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '982a4d66-993c-4dc1-8576-26f154b6a730',
    'Alessandro Biessek'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    '992beec6-89d4-46f4-85b0-51dbbefd333e',
    'David Flanagan, Yukihiro Matsumoto'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'a17e5ccd-feae-495c-a55a-3c89bd12f95b',
    'David S. Platt'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'a33491c1-3681-4a78-829f-c2f9ff9ec63f',
    'Kenneth Reek'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'a843723c-b55d-429a-a456-931a6dcbc680',
    'William E. Shotts Jr.'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'ade870fc-c491-452a-8de3-055ef5133cb7',
    'Dawn Griffiths, David Griffiths'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b20016ad-bd8b-41e9-9d4b-325073bf240e',
    'Rishal Hurbans'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'b8408737-c415-4cc3-aeb9-5d1f8d8faa21',
    'Nancy B. Stern, Robert A. Stern'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'bb55770f-119b-4270-b51f-ab36e9956daf',
    'Len Bass, Ingo Weber, Liming Zhu'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'bbf84c01-5194-49b0-aae1-e13022ad4c52',
    'Richard E. Silverman'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'bd2a90f3-df30-4476-b534-c476a3d4ccde',
    'Robert Sedgewick, Kevin Wayne'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c360f23f-5380-4431-91f7-d5b09d122a9d',
    'Jay McGavren'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'c602aec7-4554-4782-b40c-ea0e66aae3c1',
    'Kelsey Hightower, Brendan Burns, Joe Beda'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'caf8dc2d-aac1-4008-9eb8-154131fc95f2',
    'Raphael Hertzog, Jim O\'Gorman, Mati Aharoni'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'cda21b96-1242-420a-b301-0782fd7f1e6a',
    'Keith J. Grant'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd11c2d47-72a3-4f11-b616-4e6a50b560f9',
    'Daniel Higginbotham'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('d4be48ce-1574-43f9-8a8c-0d482ce1c084', 'jfjfe');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd55be147-34aa-40db-9d35-5a9f78b04711',
    'Callum Macrae'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'd6084786-e88c-43f3-8730-5e567fea68bc',
    'Ryan Henson Creighton'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e06bc92c-005f-4118-9349-e3669d48575b',
    'Andrew Ng'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e07e7344-cd83-462e-8944-64711f7ffd6e',
    'Matt Stauffer'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e44d1634-08f7-4be8-97e9-4c57fc320454',
    'Leonard Richardson, Mike Amundsen, Sam Ruby'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'e9fed4e2-0273-424f-a7e6-20a27bacd0a5',
    'Anthony Molinaro'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'f0c843db-8601-4a8b-bd97-5dc955913494',
    'Antonio Cisternino'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'f2a1a4c8-2c80-4d96-9c5d-e763797c708e',
    'Allen B. Downey, Chris Mayfield'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'f738a5c8-5e05-4ea3-8ee5-d02d803347aa',
    'Sam Newman'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'fac475c5-ebff-4dfb-817b-eef937bdbe85',
    'Cay S. Horstmann'
  );
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  ('fcbcc075-c2e8-471f-9985-eba5a177f67d', 'njnj');
INSERT INTO
  `authors` (`id`, `name`)
VALUES
  (
    'fff7ec99-b07f-4400-86e7-b01bab43b69b',
    'Patrick Viafore'
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
    '06adc570-e095-42e6-89ce-6f41fc29748c',
    'qqqq',
    NULL,
    322,
    444,
    '12-34-567',
    'fnjfnnjnjrnjvr',
    0,
    0,
    NULL,
    '2025-03-25 20:20:57'
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
    '4e516b0d-556a-4298-84ef-f1034654b456',
    'qqqq',
    NULL,
    3388,
    444,
    '12-34-567',
    'njdjndjhdjjdf',
    0,
    0,
    NULL,
    '2025-03-25 20:24:55'
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
    '78cec880-11f4-4b41-b8ce-3cf64fbd5357',
    'aaaaaaaa',
    NULL,
    6732673,
    444,
    '12-34-567',
    'vhnjvj',
    0,
    0,
    NULL,
    '2025-03-25 20:25:39'
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
    'bd2a90f3-df30-4476-b534-c476a3d4ccde',
    2011,
    444,
    '12-34-567',
    'A comprehensive introduction to algorithms and data structures, covering fundamental concepts with practical applications.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'a17e5ccd-feae-495c-a55a-3c89bd12f95b',
    2007,
    444,
    '12-34-567',
    'A practical guide to building dynamic web applications with ASP.NET, focusing on real-world scenarios and best practices.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '26af51be-5bd7-4299-b2c2-33eef1ee955f',
    2020,
    444,
    '12-34-567',
    'A guide to writing asynchronous applications in Rust, focusing on concurrency and parallelism.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '3f0db9f8-69b7-4317-b330-847735f73a27',
    2018,
    444,
    '12-34-567',
    'A comprehensive guide to using Amazon Web Services (AWS) for cloud-based infrastructure and application development.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '05403bf0-ed51-4320-bc62-47895fb8affe',
    2009,
    444,
    '12-34-567',
    'A fun, introductory guide to programming for beginners, using cats as a metaphor to explain complex concepts.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '85c7fca9-0e84-416a-ac1b-738591e61caa',
    2019,
    444,
    '12-34-567',
    'A deep dive into Agile principles and practices, focusing on the importance of discipline and simplicity.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '85c7fca9-0e84-416a-ac1b-738591e61caa',
    2008,
    444,
    '12-34-567',
    'A guide to writing clean, maintainable, and scalable code, emphasizing best practices in software development.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '85c7fca9-0e84-416a-ac1b-738591e61caa',
    2011,
    444,
    '12-34-567',
    'A guide to the professional attitudes and behaviors that software developers need to cultivate to succeed in their careers.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'd11c2d47-72a3-4f11-b616-4e6a50b560f9',
    2015,
    444,
    '12-34-567',
    'An engaging and humorous introduction to the Clojure programming language, aimed at both beginners and experienced developers.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '651ac371-14cd-4480-ba56-65c77538fa40',
    2009,
    444,
    '12-34-567',
    'A comprehensive guide to understanding the security and privacy concerns in cloud computing, and how to address them.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'b8408737-c415-4cc3-aeb9-5d1f8d8faa21',
    2003,
    444,
    '12-34-567',
    'An introduction to COBOL, focusing on its relevance and use in modern enterprise applications.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'a33491c1-3681-4a78-829f-c2f9ff9ec63f',
    2000,
    444,
    '12-34-567',
    'A guide to understanding pointers in C programming and how to manage memory effectively in software applications.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '914dfe29-9752-4205-a341-b543c08b54ed',
    2013,
    444,
    '12-34-567',
    'The definitive reference on C++, written by the creator of the language, covering all aspects of C++ programming.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '21d9a408-ecea-4b65-88c0-4f89e7158a8c',
    1999,
    444,
    '12-34-567',
    'A guide to designing software systems using C++, focusing on advanced techniques and principles of object-oriented design.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'cda21b96-1242-420a-b301-0782fd7f1e6a',
    2019,
    444,
    '12-34-567',
    'A comprehensive guide to mastering CSS, covering advanced techniques and best practices for modern web design.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'd4681cfb-793c-4029-8403-1500b089b633',
    'qqqq',
    NULL,
    3388,
    444,
    '12-34-567',
    'njdjndjhdjjdf',
    0,
    0,
    NULL,
    '2025-03-25 20:24:18'
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
    '2be95fee-08bf-481d-a0b8-319a38819eb9',
    2013,
    444,
    '12-34-567',
    'An introduction to database design, focusing on the fundamentals of relational databases and how to structure data effectively.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'bb55770f-119b-4270-b51f-ab36e9956daf',
    2015,
    444,
    '12-34-567',
    'An exploration of the DevOps movement and its impact on software architecture, offering practical advice and case studies.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '2316e958-f714-4ef7-be5f-4dfcc947ae49',
    2018,
    444,
    '12-34-567',
    'A practical guide to building dynamic web applications with Django, covering its core features and advanced techniques.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '3d0dac3e-5699-45d9-9979-ffa7174cfb06',
    2011,
    444,
    '12-34-567',
    'A comprehensive guide to the design of embedded systems, focusing on both hardware and software aspects.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'fc81e9dd-2b23-4b36-bfdd-f2a81a30a798',
    'mnnn',
    '3c338662-17e9-4226-b195-2444c5fa07bf',
    787886,
    444,
    '12-34-567',
    'bkvhhbjbvj',
    0,
    0,
    NULL,
    '2025-03-25 20:23:26'
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
    'f0c843db-8601-4a8b-bd97-5dc955913494',
    2013,
    444,
    '12-34-567',
    'A guide to mastering C# programming, focusing on functional programming, LINQ, and other advanced C# features.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '982a4d66-993c-4dc1-8576-26f154b6a730',
    2020,
    444,
    '12-34-567',
    'A beginner-friendly guide to building mobile applications with the Flutter framework, covering both Dart programming and UI design.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '847dc8fd-b609-4209-b84a-b4b1168d743c',
    2018,
    444,
    '12-34-567',
    'An introduction to functional programming principles, applying them to the Java programming language to improve code quality.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'd6084786-e88c-43f3-8730-5e567fea68bc',
    2014,
    444,
    '12-34-567',
    'A hands-on guide to building games with Unity 3D, using examples to demonstrate various game development techniques.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'bbf84c01-5194-49b0-aae1-e13022ad4c52',
    2013,
    444,
    '12-34-567',
    'A compact guide to Git, covering essential commands and workflows for effective version control.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'c360f23f-5380-4431-91f7-d5b09d122a9d',
    2019,
    444,
    '12-34-567',
    'A learner-friendly introduction to the Go programming language, using engaging visuals and examples.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'b20016ad-bd8b-41e9-9d4b-325073bf240e',
    2020,
    444,
    '12-34-567',
    'An accessible guide to understanding and implementing AI algorithms, with practical examples.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '475da840-68ad-44ab-90d7-fb9abdcc8321',
    2005,
    444,
    '12-34-567',
    'An interactive and engaging introduction to Java programming, part of the Head First series.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'ade870fc-c491-452a-8de3-055ef5133cb7',
    2019,
    444,
    '12-34-567',
    'A beginner-friendly guide to Kotlin programming, using the Head First series\' visual approach.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '973e3ca7-d497-41dc-bc87-d7b38e1199c4',
    2014,
    444,
    '12-34-567',
    'A learner-friendly guide to JavaScript, using the Head First series\' unique teaching methodology.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'c602aec7-4554-4782-b40c-ea0e66aae3c1',
    2017,
    444,
    '12-34-567',
    'A comprehensive guide to Kubernetes, explaining how to deploy, manage, and scale containerized applications.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '4fd0508b-8f3f-4fc7-b949-7d81e9a8d7fc',
    2017,
    444,
    '12-34-567',
    'An in-depth look at Apache Kafka, covering its architecture, use cases, and best practices.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'caf8dc2d-aac1-4008-9eb8-154131fc95f2',
    2017,
    444,
    '12-34-567',
    'A comprehensive guide to Kali Linux, focusing on penetration testing and security assessments.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '8ed228bb-d28e-41cb-932d-31b3bc600529',
    2010,
    444,
    '12-34-567',
    'An introduction to Kanban, providing strategies for improving processes and efficiency in technology businesses.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'e07e7344-cd83-462e-8944-64711f7ffd6e',
    2016,
    444,
    '12-34-567',
    'A practical guide to the Laravel PHP framework, covering its features and how to build applications with it.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '7bd1eddd-a186-4ca5-98bd-d782344c8008',
    2020,
    444,
    '12-34-567',
    'A guide to integrating Lean principles with DevOps practices for efficient service delivery.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'e06bc92c-005f-4118-9349-e3669d48575b',
    2018,
    444,
    '12-34-567',
    'A guide to structuring machine learning projects, offering insights into the practical aspects of building AI systems.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'f738a5c8-5e05-4ea3-8ee5-d02d803347aa',
    2015,
    444,
    '12-34-567',
    'An exploration of microservices architecture, discussing its benefits, challenges, and best practices.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '51e3447b-0227-467b-9a8e-8a9e8ecf39b9',
    2014,
    444,
    '12-34-567',
    'A deep dive into design patterns and best practices for building scalable Node.js applications.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '0d1556ad-bdb4-45ba-ab14-9cc8775c1a29',
    2007,
    444,
    '12-34-567',
    'A guide to developing physics engines for games, covering the mathematical and computational principles involved.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '724a14a5-2538-46d0-a1f4-ad6acb190a69',
    2010,
    444,
    '12-34-567',
    'An engaging introduction to Python programming, using the Head First series\' visual and interactive approach.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '6c80b6e7-bc02-49b5-b12e-8cb23409cca7',
    2017,
    444,
    '12-34-567',
    'An introduction to building web applications with React and Redux, focusing on functional programming concepts.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '0a894c99-78b6-43d9-8ccb-45337582dabe',
    2016,
    444,
    '12-34-567',
    'A practical guide to getting started with React, covering its core concepts and application development.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'e44d1634-08f7-4be8-97e9-4c57fc320454',
    2013,
    444,
    '12-34-567',
    'A comprehensive guide to designing RESTful web APIs, covering principles, patterns, and best practices.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'fff7ec99-b07f-4400-86e7-b01bab43b69b',
    2021,
    444,
    '12-34-567',
    'A guide to writing reliable and maintainable Python code, focusing on best practices and design patterns.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '992beec6-89d4-46f4-85b0-51dbbefd333e',
    2008,
    444,
    '12-34-567',
    'An authoritative guide to Ruby, written by the language\'s creator, Yukihiro Matsumoto.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '19d6c95f-1266-46d0-9e6f-fe324d873a03',
    2018,
    444,
    '12-34-567',
    'A practical guide to learning Rust by building real-world projects and applications.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'fac475c5-ebff-4dfb-817b-eef937bdbe85',
    2012,
    444,
    '12-34-567',
    'A quick-start guide to Scala for developers familiar with Java, covering its key features and syntax.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'a843723c-b55d-429a-a456-931a6dcbc680',
    2012,
    444,
    '12-34-567',
    'A thorough introduction to the Linux command line, covering shell scripting and command-line utilities.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '81ba90b5-2e2d-4df1-8c04-575ef26cca67',
    1996,
    444,
    '12-34-567',
    'A collection of best practices and patterns for Smalltalk programming, emphasizing simplicity and effectiveness.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '88a671ce-c28a-4762-b022-59522d223c05',
    2020,
    444,
    '12-34-567',
    'An in-depth guide to security engineering, focusing on building dependable and secure distributed systems.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'e9fed4e2-0273-424f-a7e6-20a27bacd0a5',
    2005,
    444,
    '12-34-567',
    'A collection of practical solutions to common SQL challenges, providing techniques for efficient database querying.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'f2a1a4c8-2c80-4d96-9c5d-e763797c708e',
    2012,
    444,
    '12-34-567',
    'An introduction to programming with Java, emphasizing problem-solving and computational thinking.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    '86883728-6cf3-477f-b441-8c25cd5d3ba6',
    2003,
    444,
    '12-34-567',
    'A guide to writing and running unit tests with JUnit, covering best practices and strategies for test-driven development.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
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
    'd55be147-34aa-40db-9d35-5a9f78b04711',
    2018,
    444,
    '12-34-567',
    'An introduction to building web applications with Vue.js, covering its core features and best practices.',
    0,
    0,
    NULL,
    '2025-03-25 20:19:34'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  ('06adc570-e095-42e6-89ce-6f41fc29748c', '[null]');
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    '4e516b0d-556a-4298-84ef-f1034654b456',
    '[\"499e2dae-bd3e-429d-a60d-9a702bfc5ec7\", \"1f4dffc1-bd45-43b9-ba40-76c29b4621fe\", \"d4be48ce-1574-43f9-8a8c-0d482ce1c084\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    '78cec880-11f4-4b41-b8ce-3cf64fbd5357',
    '[\"55d6d6b9-c64f-4c44-b66d-863629e1d3ff\", \"fcbcc075-c2e8-471f-9985-eba5a177f67d\", \"797be6d7-1f3d-4cdc-a25a-1d1cf0e091ad\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'algos',
    '[\"bd2a90f3-df30-4476-b534-c476a3d4ccde\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'aspnet',
    '[\"a17e5ccd-feae-495c-a55a-3c89bd12f95b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'asyncrust',
    '[\"26af51be-5bd7-4299-b2c2-33eef1ee955f\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'aws',
    '[\"3f0db9f8-69b7-4317-b330-847735f73a27\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cats',
    '[\"05403bf0-ed51-4320-bc62-47895fb8affe\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cleanagile',
    '[\"85c7fca9-0e84-416a-ac1b-738591e61caa\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cleanCode',
    '[\"85c7fca9-0e84-416a-ac1b-738591e61caa\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cleanCoder',
    '[\"85c7fca9-0e84-416a-ac1b-738591e61caa\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'clojure',
    '[\"d11c2d47-72a3-4f11-b616-4e6a50b560f9\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cloudsecurity',
    '[\"651ac371-14cd-4480-ba56-65c77538fa40\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cobol',
    '[\"b8408737-c415-4cc3-aeb9-5d1f8d8faa21\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cpointers',
    '[\"a33491c1-3681-4a78-829f-c2f9ff9ec63f\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cpp',
    '[\"914dfe29-9752-4205-a341-b543c08b54ed\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cppsoftdesign',
    '[\"21d9a408-ecea-4b65-88c0-4f89e7158a8c\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'cssindepth',
    '[\"cda21b96-1242-420a-b301-0782fd7f1e6a\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  ('d4681cfb-793c-4029-8403-1500b089b633', '[null]');
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'dbdesign',
    '[\"2be95fee-08bf-481d-a0b8-319a38819eb9\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'devopsOR',
    '[\"bb55770f-119b-4270-b51f-ab36e9956daf\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'djangoinaction',
    '[\"2316e958-f714-4ef7-be5f-4dfcc947ae49\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'embedded',
    '[\"3d0dac3e-5699-45d9-9979-ffa7174cfb06\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'fc81e9dd-2b23-4b36-bfdd-f2a81a30a798',
    '[\"3c338662-17e9-4226-b195-2444c5fa07bf\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'fluentc',
    '[\"f0c843db-8601-4a8b-bd97-5dc955913494\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'flutterdart',
    '[\"982a4d66-993c-4dc1-8576-26f154b6a730\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'fpjava',
    '[\"847dc8fd-b609-4209-b84a-b4b1168d743c\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'gamesunity',
    '[\"d6084786-e88c-43f3-8730-5e567fea68bc\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'gitpocket',
    '[\"bbf84c01-5194-49b0-aae1-e13022ad4c52\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'goHF',
    '[\"c360f23f-5380-4431-91f7-d5b09d122a9d\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'grokAI',
    '[\"b20016ad-bd8b-41e9-9d4b-325073bf240e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'javaHF',
    '[\"475da840-68ad-44ab-90d7-fb9abdcc8321\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'javakotlin',
    '[\"ade870fc-c491-452a-8de3-055ef5133cb7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'jsHF',
    '[\"973e3ca7-d497-41dc-bc87-d7b38e1199c4\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'k8s',
    '[\"c602aec7-4554-4782-b40c-ea0e66aae3c1\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'kafkaconnect',
    '[\"4fd0508b-8f3f-4fc7-b949-7d81e9a8d7fc\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'kalilinux',
    '[\"caf8dc2d-aac1-4008-9eb8-154131fc95f2\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'kanban',
    '[\"8ed228bb-d28e-41cb-932d-31b3bc600529\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'laravel',
    '[\"e07e7344-cd83-462e-8944-64711f7ffd6e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'leandevops',
    '[\"7bd1eddd-a186-4ca5-98bd-d782344c8008\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'machlearnr',
    '[\"e06bc92c-005f-4118-9349-e3669d48575b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'microservices',
    '[\"f738a5c8-5e05-4ea3-8ee5-d02d803347aa\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'nodeexpress',
    '[\"51e3447b-0227-467b-9a8e-8a9e8ecf39b9\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'phisicsgamedev',
    '[\"0d1556ad-bdb4-45ba-ab14-9cc8775c1a29\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'pythonHF',
    '[\"724a14a5-2538-46d0-a1f4-ad6acb190a69\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'react',
    '[\"6c80b6e7-bc02-49b5-b12e-8cb23409cca7\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'reactindepth',
    '[\"0a894c99-78b6-43d9-8ccb-45337582dabe\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'restful',
    '[\"e44d1634-08f7-4be8-97e9-4c57fc320454\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'robustpython',
    '[\"fff7ec99-b07f-4400-86e7-b01bab43b69b\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'ruby',
    '[\"992beec6-89d4-46f4-85b0-51dbbefd333e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'rust',
    '[\"19d6c95f-1266-46d0-9e6f-fe324d873a03\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'scala',
    '[\"fac475c5-ebff-4dfb-817b-eef937bdbe85\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'shell',
    '[\"a843723c-b55d-429a-a456-931a6dcbc680\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'smalltalk',
    '[\"81ba90b5-2e2d-4df1-8c04-575ef26cca67\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'softSecur',
    '[\"88a671ce-c28a-4762-b022-59522d223c05\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'sqlcook',
    '[\"e9fed4e2-0273-424f-a7e6-20a27bacd0a5\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'thinkjava',
    '[\"f2a1a4c8-2c80-4d96-9c5d-e763797c708e\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'unittesting',
    '[\"86883728-6cf3-477f-b441-8c25cd5d3ba6\"]'
  );
INSERT INTO
  `books_authors` (`book_id`, `authors_ids`)
VALUES
  (
    'vue',
    '[\"d55be147-34aa-40db-9d35-5a9f78b04711\"]'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
