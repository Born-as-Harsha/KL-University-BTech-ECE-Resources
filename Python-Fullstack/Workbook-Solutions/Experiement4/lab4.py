
try:
    name = input("Enter student name: ")
    roll = int(input("Enter roll number: "))
    attendance = float(input("Enter attendance percentage: "))

    file = open("attendance.txt", "w")
    file.write(name + " " + str(roll) + " " + str(attendance))
    file.close()

    print("Data written successfully")

except ValueError:
    print("Invalid input")

try:
    file = open("attendance.txt", "r")
    data = file.read()
    file.close()

    print("Student Attendance Data:")
    print(data)

except FileNotFoundError:
    print("File not found")
