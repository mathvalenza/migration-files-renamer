# migration-files-renamer
A sh script to rename migration files

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

But if a table is droped, all the other ones should be shift according to the new sequence. As the order matters to migration files execution, put a random file in the space available isn't a valid solution.

So, for example, **removing table B**, the new set of files will be:

``` sql
# wrong set
V_000001__create_table_A.sql
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
Note that all the files after `V_000002__create_table_B.sql` were renamed to reorganize the sequence.

## Run

- Easier way:
  Simply copy the content in `run.sh` and paste it on your terminal, in the directory which `.sql` files are placed.
  
