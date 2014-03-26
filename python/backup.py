import os
import time
source = '/home/gyg/app/puzzle/ruby'
today_folder = '/home/gyg/app/puzzle' + os.sep + time.strftime('%Y-%m-%d')
if not os.path.exists(today_folder):
    os.mkdir(today_folder)
    print('successfully create folder {0}'.format(today_folder))
name = input('name the archive--> ')
if len(name) == 0:
    print('backup failed, could not name archive')
else:
    target = today_folder + os.sep + name.replace(' ', '-') + '.tar.gz' 
    command = 'tar -cf {0} {1}'.format(target, source)
    if os.system(command) == 0:
        print('successfully backup to', target)
    else:
        print('backup failed')
