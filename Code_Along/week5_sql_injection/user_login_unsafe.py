import duckdb
from constants import DB_PATH

username = input('Enter username:')
password = input('Enter password: ')

with duckdb.connect(str(DB_PATH)) as conn:
    result = conn.execute(f"""
    SELECT *
    FROM users
    WHERE username = '{username}' AND
          password = '{password}'
    """)
# if the pass is ok, we will get a record -> truthy
# if pass is wrong -> e
# empty list is falsey, 


    if result.fetchall():
        print("You can eat all ice creams you want")
    else:
        print("Sorry dude")
    
    # a ' OR '1'='1' --
    # WHERE username = 'a ' OR '1'='1' -- AND password = ...
    # False or Tue -> True

    # this below delete the database: '; DROP TABLE users;--