


def binary_search(Result, Tail_Table, low, high, target):
    while(high-low>1):
        middle = low + (high - low)//2
        if(Result[Tail_Table[middle]] >= target):
            high = middle
        else:
            low = middle
    return high
    


def lis(Result):
    
    l = len(Result)

    Tail_Table = [0 for i in range(l+1)]
    Recovery_Table = [-1 for i in range(l+1)]


    length = 1

    for i in range(1,l):

        if (Result[i] == Result[i-1]): continue

        if(Result[i] < Result[Tail_Table[0]]):
            Tail_Table[0] = i

        elif (Result[i] > Result[Tail_Table[length-1]]):
            Tail_Table[length] = i
            Recovery_Table[i] = Tail_Table[length-1]
            length += 1

        else:
            Temp = binary_search(Result, Tail_Table, -1, length-1, Result[i])
            Tail_Table[Temp] = i
            Recovery_Table[i] = Tail_Table[Temp-1]


    

    Temp = Tail_Table[length-1]
    Flip = []

    while(Temp >= 0):
        Flip.insert(0, Result[Temp])
        Temp = Recovery_Table[Temp]


    for e in Flip:
        print(e, end = " ")
