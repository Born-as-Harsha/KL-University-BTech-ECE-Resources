import math

try:
    a = int(input("Enter a number: "))
    b = int(input("Enter another number: "))

    print("\nChoose an operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Square root")

    choice = int(input("Enter your choice: "))

    if choice == 1:
        result = a + b
        print("The sum of {} and {} is {}".format(a, b, result))

    elif choice == 2:
        result = a - b
        print("The difference of {} and {} is {}".format(a, b, result))

    elif choice == 3:
        result = a * b
        print("The product of {} and {} is {}".format(a, b, result))

    elif choice == 4:
        result = a / b
        print("The quotient of {} and {} is {}".format(a, b, result))

    elif choice == 5:
        result = math.sqrt(a)

        print("The square root of {} is {}".format(a, result))

    else:
        print("Invalid choice")

except ValueError:
    print("Error: Please enter valid numeric input.")

except ZeroDivisionError:
    print("Error: Division by zero is not allowed.")
