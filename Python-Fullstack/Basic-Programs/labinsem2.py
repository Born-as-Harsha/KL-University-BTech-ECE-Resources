import math
try:
    a = int(input("Enter a number: "))
    b = int(input("Enter another number: "))
    print("\nChoose an operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    choice = int(input("Enter your choice: "))
    if choice == 1:
        result = a + b
        print( result)
    elif choice == 2:
        result = a - b
        print(result)
    elif choice == 3:
        result = a * b
        print(result)
    elif choice == 4:
        result = a / b
        print(result)
    else:
        print("Invalid choice")
except ValueError:
    print("Error: Please enter valid numeric input.")
except ZeroDivisionError:
    print("Error: Division by zero is not allowed.")
