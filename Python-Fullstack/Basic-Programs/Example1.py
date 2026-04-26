'''
a = [1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9]
b = { "apple" , "orange" , "banana" }
c = (2 , 3 , 4 , 5 , 6 , 7 , 8 , 9,"klu")
d = {110:"a", 111:"b", 112:"c"}
print(type(a))

fruits = ["apple", "orange", "banana"]
for fruit in fruits:
    print(fruit)

for i in range(1, 6):
    print(i)

count = 0
while count < 5:
    print(count)
    count += 1

for cls in range(1, 3):
    print("Class:", cls)
    for students in range(1, 4):
        print("Students Roll no:", students)

for roll in range(1, 10):
    if roll == 5:
        break
    print("Roll:", roll)


for roll in range(1, 6):
    if roll == 3:
        continue
    print("Roll:", roll)

a = int(input("enter the number:"))
for i in range(1, 11):
    print(a, "*", i, "=", a * i)
'''
import math
b = int(input("enter the number:"))
c = math.factorial(b)
d = math.pow(b,b)
e = math.sqrt(b)
f = math.ceil(b)
print(c)
print(d)
print(e)
print(f)