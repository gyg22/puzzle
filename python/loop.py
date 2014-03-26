running = True
number = 23
while running:
    data = input('enter a number: ')
    if data == 'exit':
#continue means skiping the rest and running next evaluation
#break is used to end the loop or iterator
      break
    else:
        guess = int(data)
        if guess < 23:
            print('lower')
        elif guess > 23:
            print('higher')
        elif guess == 23:
            print('congratilation!')
            running = False
else: 
    print('guess is over')
