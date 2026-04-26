'''
def a1():
    print('Hello')
    def a2():
        print('Good afternoon')
    a2()
a1()
'''
#22.12.25
class a1:
    print('Hello')
    def function1(self):
        a2 = 5 + 10
        print(a2)
    def __init__(self):
        print("How ru?")
obj = a1()
obj.function1()