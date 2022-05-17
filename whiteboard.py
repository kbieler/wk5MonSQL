#All unique
#Write a program to determine if a string contains only unique characters.
#Return true if it does and false otherwise.
#Characters are case-sensitive, e.g. 'a' and 'A' are considered different characters.
example= ("abcdef")
#output= True
ex_2= ("++-")
#output= False
ex_3= ("  nAa")
#output= False

def all_unique(exp):
    if len(set(exp)) == len(exp):
        return True
    return False
        
print(all_unique(example))