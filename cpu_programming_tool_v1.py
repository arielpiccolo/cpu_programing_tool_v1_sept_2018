import os

os.system('clear')
begin = input("1 to begin / 0 to quit:  ")
while True:
    if begin == 1:
        os.system('python3 process1.py')
    elif begin == 0:
        quit
else:
    print(" Invalid input please try again with 1 or 0")

    
