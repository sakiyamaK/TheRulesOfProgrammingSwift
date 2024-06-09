// P26

func reduce(initialValue: Int, reduceFunction: ((Int, Int) -> Int), values: [Int]) -> Int {
    var reducedValue = initialValue
    for value in values {
        reducedValue = reduceFunction(reducedValue, value)
    }
    return reducedValue
}


// 1~10の配列
let values = Array(1...10)

let sum1 = reduce(initialValue: 0, reduceFunction: { resultValue, value in
    resultValue + value
}, values: values)

// あくまで書籍上の例であって配列の総和はそれ用の関数がある
let sum2 = values.reduce(0, +)

print(sum1)
print(sum2)
