## Print all Permutations of a string with unique chars
## ex: "abcdef"
 
def permute(string):
    if len(string) == 1:
        return [string]
    elif len(string) == 2:
        return [string, string[::-1]]
    else:
        arr = []
        for char in string:   # char = a string= abc
            sub = string.replace(char, '') #bc
            arr += list(map(lambda i: char + i, permute(sub)))
        return arr
 
print(permute('a'))
print(permute('ab'))
print(permute('abc'))
print(permute('abcd'))
print(permute('abcde'))
print(permute('abcdefgh'))
