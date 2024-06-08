// P3
func countSetBits(value: Int) -> Int {
    var value = value
    
    value = ((value & 0xaaaaaaaa) >> 1) + (value & 0x55555555)
    value = ((value & 0xcccccccc) >> 2) + (value & 0x33333333)
    value = ((value & 0xf0f0f0f0) >> 4) + (value & 0x0f0f0f0f)
    value = ((value & 0xff00ff00) >> 8) + (value & 0x00ff00ff)
    value = ((value & 0xffff0000) >> 16) + (value & 0x0000ffff)
    
    return value
}

//1~10まで
for v in (1...10) {
    let binary = String(v, radix: 2)
    let answer = countSetBits(value: v)
    print("「\(v)」を2進数で表すと「\(binary)」")
    print("「\(binary)」の1の数は「\(answer)」")
    print("======")
}
