alist = [1, 1, 1, 1, 2, 1, 1]
alist2 = [0, 0, 0.55, 0]

def find_uniq(arr):
    for x in arr:
        if arr.count(x) == 1:
            return x

print(find_uniq(alist))