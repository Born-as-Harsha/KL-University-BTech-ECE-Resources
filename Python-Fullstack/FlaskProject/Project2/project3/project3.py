import sqlite3

# Connect to database
klu = sqlite3.connect('pfsd2.db')
print('Opened database successfully')

# Create table (fresh structure)
klu.execute('''DROP TABLE IF EXISTS sqliteexample''')

klu.execute('''CREATE TABLE sqliteexample 
(ID INTEGER, name TEXT, mark1 INTEGER)''')

print('Table created successfully.')

# Insert single record
klu.execute("INSERT INTO sqliteexample VALUES (2400040454,'Harsha',1000)")

data1 = [(2400040454,'Harshavardhan',100),
        (2100031072,'Guta',44),
        (2100031231,'BALAJI',43),
        (2100031316,'KEERTHANA',10)
        ]

# Insert multiple records
klu.executemany('INSERT INTO sqliteexample VALUES(?,?,?)', data1)
print("Inserted Multiple data Successfully")

# Create cursor
cur = klu.cursor()

# Display records
print("\nRecords in table:")
for row in cur.execute('SELECT * FROM sqliteexample'):
    print(row)

# Delete specific rows
klu.execute("DELETE FROM sqliteexample WHERE ID = 2100031316")
klu.execute("DELETE FROM sqliteexample WHERE ID = 2400040454")
print("\nDeleted specific rows")

# Display after deletion
print("\nAfter deleting rows:")
for row in cur.execute('SELECT * FROM sqliteexample'):
    print(row)

# Delete all records
cur.execute('DELETE FROM sqliteexample')
print('\nWe have deleted', cur.rowcount, 'records from the table.')

# Commit and close
klu.commit()
klu.close()

print("\nDone successfully")