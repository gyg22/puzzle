def keywordArg(a, b=1, c=2):
    print('a is', a, 'b is', b, 'c is', c)
#keyword argument
#keyword_arg(3)
#keyword_arg(1, c=3, b=2)

def collectArg(*nums, **dic):
#list, here is dictionary and tuple
    print(type(nums), type(dic))
    return dic
#collectArg(1, 2, 3, name='gyg', age=35)

#implicitly contains a return None statement at the end
def returnVal():
    pass

#val = returnVal()
#print(val)

#docString
def docStr():
    '''this is doc for #docStr,
     
    which help us to understand'''
    
#this is comment for #docStr
#print(docStr.__doc__)
