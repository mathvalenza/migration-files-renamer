# migration-files-renamer
Just a sh script to rename migration files

## The problem

Migration files are named like:

``` sql
# base set
V_000001__create_table_A.sql
V_000002__create_table_B.sql
V_000003__create_table_C.sql
...
V_000150__insert_table_C.sql
```

But if a file is deleted, all the other ones should be shifted according to the new sequence. As the order matters to migration files execution, put a random file in the available slot isn't a valid solution.

So, for example, **removing V_000002__create_table_B.sql file**, the new set of files will be:

``` sql
# wrong set
V_000001__create_table_A.sql
-- DELETED  FILE
V_000003__create_table_C.sql
...
V_000150__insert_table_C.sql
```

But it **should be**:

``` sql
# result set
V_000001__create_table_A.sql
V_000002__create_table_C.sql
...
V_000149__insert_table_C.sql
```

And that's what the script does :blush:
Note that all the files after `V_000002__create_table_B.sql` were renamed to fix the sequence.

## Run

- **Linux (easier way)**:

  Simply copy the content in `run.sh` and paste it on your terminal, in the directory which `.sql` files are placed.

- **Windows**

  Paste `run.sh` file in the directory which `.sql` files are placed, then double-click the file.
  
