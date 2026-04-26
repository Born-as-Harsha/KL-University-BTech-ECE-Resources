'''
Number = int(input("Enter a number: "))
if Number > 0:
    print(f"{Number} is positive")
elif Number < 0:
    print(f"{Number} is negative")
else:
    print(f"{Number} is zero")

var1 = 1.245689
var2 = "abc"
var3 = True
var4 = 100
var5 = 'Present'
print("Value=",var1,"It is Datatype",type(var1))
print("Value=",var2,"It is Datatype",type(var2))
print("Value=",var3,"It is Datatype",type(var3))
print("Value=",var4,"It is Datatype",type(var4))
print("Value=",var5,"It is Datatype",type(var5))

# arithmetic operations
a = [1,2,3,4,5]
b = [6,7,8,9,10]
c = a + b
print(c)

d = {1,2,3,4,5}
e = {6,7,8,9,10}
f = d - e
print(f)
#caluculator

a = int(input("Enter first number: "))
b = int(input("Enter second number: "))

while True:
    print("\nChoose an operation:")
    print("1. a + b")
    print("2. a - b")
    print("3. a * b")
    print("4. a / b")
    print("5. a % b")
    print("6. a // b")
    print("7. b % a")
    print("8. b // a")
    print("9. Exit")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        print("Result:", a + b)

    elif choice == 2:
        print("Result:", a - b)

    elif choice == 3:
        print("Result:", a * b)

    elif choice == 4:
        if b != 0:
            print("Result:", a / b)
        else:
            print("Error: Division by zero")

    elif choice == 5:
        if b != 0:
            print("Result:", a % b)
        else:
            print("Error: Modulo by zero")

    elif choice == 6:
        if b != 0:
            print("Result:", a // b)
        else:
            print("Error: Floor division by zero")

    elif choice == 7:
        if a != 0:
            print("Result:", b % a)
        else:
            print("Error: Modulo by zero")

    elif choice == 8:
        if a != 0:
            print("Result:", b // a)
        else:
            print("Error: Floor division by zero")

    elif choice == 9:
        print("Exiting program")
        break

    else:
        print("Invalid choice, try again")
'''
