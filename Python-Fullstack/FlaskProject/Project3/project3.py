import sqlite3

klu = sqlite3.connect('pfsd2.db')
print('Opened database successfully')

# Create table if not exists
klu.execute('''CREATE TABLE IF NOT EXISTS sqliteexample 
(ID INTEGER, name TEXT, mark1 INTEGER)''')

# Insert single record
klu.execute("INSERT INTO sqliteexample VALUES (2400040454,'Harsha',1000)")

print('table created successfully.')

data1 = [(2400040454,'Harshavardhan',100),
        (2100031072,'Guta',44),
        (2100031231,'BALAJI',43),
        (2100031316,'KEERTHANA',10)
        ]

# Inserting Multiple data into the table
klu.executemany('INSERT INTO sqliteexample VALUES(?,?,?)', data1)
print("Inserted Multiple data Successfully")

# Display records
for row in klu.execute('SELECT * FROM sqliteexample'):
    print(row)

klu.commit()
klu.close()