// P25

func sumVector(values: [Int]) -> Int {
    var sum = 0
    for value in values {
        sum += value
    }
    return sum
}

// 1~10の配列
let values = Array(1...10)

let sum1 = sumVector(values: values)

// あくまで書籍上の例であって配列の総和はそれ用の関数がある
let sum2 = values.reduce(0, +)

print(sum1)
print(sum2)
