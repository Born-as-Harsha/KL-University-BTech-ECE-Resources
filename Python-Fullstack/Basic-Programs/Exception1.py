'''
while True:
    try:
        n = int(input("Please enter a number: "))
        m = int(input("Please enter a number: "))
        z = n/m
        break
    except Exception as e:
        print("Not a integer! Please again 123")
        print(e)
    except ValueError:
        print("Not a number! Please again 456")
    finally:
        print("You successfully entered an integer!")
'''
try:
    klu1 = open("file1.txt", "r+")
    try:
        klu1.write("This is HarshaVardhan From KlU.")
    finally:
        klu1.close()
except IOError:
    print("File not found.")
else:
    print("File found.")
    klu1.close()