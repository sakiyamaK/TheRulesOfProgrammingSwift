// P2

func countSetBits(value: Int) -> Int {
    var value = value
    var count = 0
    
    while value != 0 {
        count += 1
        value &= (value - 1)
    }
    return count
}

//1~10まで
for v in (1...10) {
    let binary = String(v, radix: 2)
    let answer = countSetBits(value: v)
    print("「\(v)」を2進数で表すと「\(binary)」")
    print("「\(binary)」の1の数は「\(answer)」")
    print("======")
}
