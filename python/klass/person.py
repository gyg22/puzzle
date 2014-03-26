class Person:

    total = 0    
    '''how to define private class var'''
    __version = '0.1'
    
    def __init__(self, name):
        self.name = name
        Person.total += 1
        '''how to define private instance var'''
        self.__secret = 'secret'

    def sayHi(self):
        print('one person named', self.name)
        print('i have', self.__secret)

    @classmethod 
    def how_many(self):
        print(self.__version)
        print('currently there are {0} people'.format(self.total))

#gyg = Person('gyg')
#gyg.sayHi()
#toby = Person('toby')
#toby.sayHi()
#Person.how_many()
