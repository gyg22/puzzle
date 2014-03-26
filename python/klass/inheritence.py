class SchoolMember:
    __total = 0

    def __init__(self, name):
        self.name = name
        SchoolMember.__total += 1

    def tell(self):
        print('my name is', self.name)
    
    @classmethod
    def how_many(self):
        print('currently, there are {0} schoolmembers'.format(self.__total))

class Teacher(SchoolMember):
    def __init__(self, name, salary):
        SchoolMember.__init__(self, name)
        self.salary = salary
    
    def tell(self):
        SchoolMember.tell(self)
        print('and my salary is', self.salary)

class Student(SchoolMember):
    def __init__(self, name, mark):
        SchoolMember.__init__(self, name)
        self.mark = mark

    def tell(self):
        SchoolMember.tell(self) 
        print('and my mark is', self.mark)

#teacher = Teacher('lorenzo', '5000')
#teacher.tell()
#student = Student('toby', 99)
#student.tell()
#SchoolMember.how_many()
