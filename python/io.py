poet = '才下眉头,却上心头.\n情不知所起,一往而情深.\n春秋何时了,往事知多少.'
#input
file = open('poet.txt', 'w', encoding='utf-8')
#print(file.__class__)
file.write(poet)
file.close()

#ouput
file = open('poet.txt', encoding='utf-8')
while True:
    line = file.readline()
    if len(line) == 0:
        break
    print(line, end='')
file.close()

