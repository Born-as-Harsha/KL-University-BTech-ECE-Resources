class student:
    def __init__(self,name,rollno,branch):
        self.name=name
        self.rollno=rollno
        self.branch=branch
    def display(self):
        print("Name of the student" , self.name)
        print("Roll number of the student" , self.rollno)
        print("Department of the student" , self.branch)

class Graduatestudent(student):
    def __init__(self,name,rollno,branch,club):
        super().__init__(name,rollno,branch)
        self.club=club

        def display(self):
            super().display()
            print("Club interseted" + self.club)

obj1 = Graduatestudent("Harsha",100,"ECE","Pulse")
obj1.display()