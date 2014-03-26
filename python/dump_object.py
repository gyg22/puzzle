import pickle

shoplist = ['apple', 'mango', 'banana']

file = open('pickle.data', 'wb')
pickle.dump(shoplist, file)
file.close()
del shoplist

file = open('pickle.data', 'rb')
storedlist = pickle.load(file)
file.close()
print(storedlist, storedlist.__class__)

