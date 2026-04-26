class Student:
    def __init__(self, name):
        self.name = name


class Sports:
    def __init__(self, sport):
        self.sport = sport


class SportsStudent(Student, Sports):
    def __init__(self, name, sport, age):
        Student.__init__(self, name)
        Sports.__init__(self, sport)
        self.age = age

    def display(self):
        print(f"Name: {self.name}, Age: {self.age}, Sport: {self.sport}")


if __name__ == "__main__":
    sports = SportsStudent("Bob", "Basketball", 22)
    sports.display()
