import Experiment3
# from BasicPrograms.Example4 import next_calculation

# marks_list = [95,85,72,66,54,40]

while True:
    marks1 = int(input("Enter marks: "))
    grade = Experiment3.calculategrade(marks1)
    print("Marks: ", marks1, "Grade: ", grade)
    next_calculation = input("let do next calculation? (Yes/No): ")
    if next_calculation == "No":
        break
else:
    print("Thank you for using this program")
