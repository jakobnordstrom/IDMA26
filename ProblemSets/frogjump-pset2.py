import sys

def construct_jumping_sequence (n):
    r = (n % 4)
    if (r == 1 or r == 2 or n <= 0):
        print ('No jumping sequence for length %d' % n)
    else:
        print ('Jumping sequence of length %d:' % n)
        jump_recursive (n)

def jump_recursive (n):
    if (n >= 4):
        jump_recursive (n - 4)
        print ('Jump length %d right' % (n - 3))
        print ('Jump length %d left ' % (n - 2))
        print ('Jump length %d left ' % (n - 1))
        print ('Jump length %d right' %  n) 
    elif (n == 3):
        print ('Jump length 1 right') 
        print ('Jump length 2 right') 
        print ('Jump length 3 left ') 

if __name__ == '__main__':
    n = int (sys.argv[1])
    construct_jumping_sequence (n)
