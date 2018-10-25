# Bookmark Manager!

## User stories

```
As an internet user,
So I can see my favourite websites,
I would like to view a list of my bookmarks.

As an internet user,
So that I can keep my bookmarks up to date,
I would like to be able to add new bookmarks.

As an internet user,
So that I can get rid of bookmarks I don't use anymore,
I would like to be able to delete bookmarks.
```

## Setup instructions
- Connect to `psql`
For your bookmarks database:
- Create the database with `CREATE DATABASE bookmark_manager;`
- Connect to this database using `\c bookmark_manager;`
- Run the query in `./db/migrations/01_creating_bookmarks_table.sql`.
For the testing database:
- Create the database with `CREATE DATABASE bookmark_manager_test;`
- Connect to this database using `\c bookmark_manager_test;`
- Run the query in `./db/migrations/02_creating_test_bookmarks_table.sql`.
