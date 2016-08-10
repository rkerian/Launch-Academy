Postgres is an implementation of a **Relational Database Management System** (RDBMS) which we will use to store information for the Web Applications which we will build. It supports the **Structured Query Language** (SQL), which is common language supported by many other implementations of RDBMSes. **SQL** allows us to perform CRUD actions on data.

## Creating a Database

In order to start working with a Postgres Database, we need to create one, first:

```no-highlight
$ createdb music_brain
```

## Creating a Table

![Image of a database table](https://s3.amazonaws.com/horizon-production/images/HC3qYMZ.png)

A table is a place for us to store data. It consists of **rows**, **columns**, and **cells** (the intersection of a row and column).

Before we can start inserting data into the table, we need to describe the **schema** of the table. The schema answers the following questions about our data: What is the name of the table? What are the names of the columns? What type of data is going to go in a column?

Let's create a `songs` table which will have the following columns:

```no-highlight
id
track_number
artist
album
title
year
length_in_seconds
created_at
updated_at
```

A row, also called a **record**, is an individual entry in our database. In this case, a song.

A column describes some characteristic of our data. Recording the title of each song seems like a good idea.

So, these are the columns we want to define. What datatypes should these columns be?

## Postgres Datatypes

[![Postgres Datatypes](https://s3.amazonaws.com/horizon-production/images/psql-datatypes.png)](http://www.postgresql.org/docs/9.4/static/datatype.html)

The current version of Postgres (v9.4 as of this writing), has many different datatypes. We must declare the datatypes for our columns before we can insert data into them. This concept is known as **static typing**.

## Relevant Postgres Datatypes

These are the datatypes we tend to use the most. You may have a need for other datatypes in the future, so it's good to know where to look up that information for future reference.

| Datatype | Description |
| --- | --- |
| boolean | logical Boolean (true/false) |
| varchar(n) | variable-length character string |
| date | calendar date (year, month, day) |
| integer | signed four-byte integer |
| real | single precision floating-point number |
| serial | autoincrementing four-byte integer |
| text | variable-length character string |
| timestamp | date and time |


## Defining our Table's Schema

Now that we know what datatypes Postgres supports, we can open up our database and create our table with the `CREATE TABLE` command.

```no-highligh
psql music_brain
```

```sql
CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  track_number INTEGER,
  artist VARCHAR(255),
  album VARCHAR(255),
  title VARCHAR(255) NOT NULL,
  year INTEGER,
  length_in_seconds INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
```

A few things to note, here.

The capitalization of SQL keywords is a convention. It helps us to differentiate between the table names, column names, and SQL keywords when syntax highlighting is not available.

The identification of a **primary key** in a table is equivalent to saying "this field is unique for all records in the table". In this case, we are using an autoincremented integer to be our **primary key**. Having a unique identifier for a row in our table is a useful convention. We can easily pass around the id, and look up the associated data when necessary.

The addition of a `NOT NULL` statement to our `title` column makes it so that this field is required. It doesn't make much sense to create a record in our `songs` table if the title of the song isn't present.

## Inserting data into our Table (Create)

The SQL insert statement will allow us to add rows to our database. Let there be data.

```sql
INSERT INTO songs(track_number, artist, album, title, year, length_in_seconds, created_at, updated_at)
VALUES
  (1, 'aphex twin', 'richard d. james album', '4', 1997, 216, NOW(), NOW()),
  (2, 'aphex twin', 'richard d. james album', 'cornish acid', 1997, 134, NOW(), NOW()),
  (3, 'aphex twin', 'richard d. james album', 'peek 824545201', 1997, 185, NOW(), NOW()),
  (4, 'aphex twin', 'richard d. james album', 'fingerbib', 1997, 228, NOW(), NOW()),
  (5, 'aphex twin', 'richard d. james album', 'corn mouth', 1997, 154, NOW(), NOW()),
  (6, 'aphex twin', 'richard d. james album', 'to cure a weakling child', 1997, 244, NOW(), NOW()),
  (7, 'aphex twin', 'richard d. james album', 'goon gumpas', 1997, 123, NOW(), NOW()),
  (8, 'aphex twin', 'richard d. james album', 'yellow tax', 1997, 183, NOW(), NOW()),
  (9, 'aphex twin', 'richard d. james album', 'girl/boy song', 1997, 288, NOW(), NOW()),
  (10, 'aphex twin', 'richard d. james album', 'untitled', 1997, 183, NOW(), NOW()),
  (11, 'aphex twin', 'richard d. james album', 'milkman', 1997, 249, NOW(), NOW()),
  (12, 'aphex twin', 'richard d. james album', 'inkeys', 1997, 84, NOW(), NOW()),
  (13, 'aphex twin', 'richard d. james album', 'girl/boy [e18 snore rush mix]', 1997, 118, NOW(), NOW()),
  (14, 'aphex twin', 'richard d. james album', 'beetles', 1997, 91, NOW(), NOW()),
  (15, 'aphex twin', 'richard d. james album', 'girl/boy [redruth mix]', 1997, 98, NOW(), NOW())
;
```

Note that we do not specify the `id` for our entries. We let the database do that for us. Also, if we are going to change a record, we should also update the `updated_at` field of the record so that we know the data changed.

## Retrieving data from our Table (Read)

We can now get all the records

```sql
SELECT * FROM songs;
```

Or, just one

```sql
SELECT * FROM songs WHERE id = 7;
```

## Modifying data in our Table (Update)

Our proper nouns are lacking proper capitalization. Let's fix that.

```sql
UPDATE songs
SET artist = 'Aphex Twin', updated_at = NOW()
WHERE artist = 'aphex twin';
```

We can check our work with a query.

```sql
SELECT * FROM songs;
```

## Removing data from our Table (Delete)

Perhaps there is a song we are not very fond of. Let's get rid of it.

```sql
DELETE FROM songs
WHERE id = 6;
```

Check that the deletion actually happened.

```sql
SELECT * FROM songs;
```

To exit from the `psql` prompt, use the quit command.

```no-highlight
\q
```

## Wrap Up

We have explored how to create a database, how to create a table in that database (define the schema), and how to perform CRUD actions (Create, Read, Update, Delete) on data in a Postgres database.
