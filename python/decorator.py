class Flas:
    def test(self, f):
        def age():
              print(30)
        return age

app = Flas()
@app.test
def my_name():
    print('my name is gyg')

my_name()

