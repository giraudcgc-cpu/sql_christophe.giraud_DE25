import duckdb
from constants import DB_PATH

username = input('Enter username:')
password = input('Enter password: ')

with duckdb.connect(str(DB_PATH)) as conn:
    result = conn.execute(
        "SELECT * FROM users WHERE username = ? AND password = ?", 
        parameters=(username, password)
        )

    if result.fetchall():
        print("You can eat all ice creams you want")
    else:
        print("Sorry dude")
    
    # a ' OR '1'='1' --
    # WHERE username = 'a ' OR '1'='1' -- AND password = ...
    # False or Tue -> True

    # this below delete the database: '; DROP TABLE users;--