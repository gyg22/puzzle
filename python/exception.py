import time

#the customed exception is raised by raise
#class FileNotFound(FileNotFoundError):
#    def __init__(self)
#        FileNotFoundError.__init__(self)
file = None
try: 
    file = open('poet.txt')
    while True:
        line = file.readline()
        if len(line) == 0:
            break
        print(line, end='', flush = True)
        time.sleep(2)

except FileNotFoundError as excp: 
    print('file not found', excp)
except KeyboardInterrupt as excp:
   print('operation is cancelled', excp)
else:
    print('job is done')
finally:
    if file:
        file.close()
    print('file io is closed')
