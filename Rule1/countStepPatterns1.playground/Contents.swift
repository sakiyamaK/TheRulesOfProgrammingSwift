// P6
func countStepPatterns(rungCount: Int) -> Int {
    if rungCount < 0 {
        0
    } else if rungCount == 0 {
        1
    } else {
        countStepPatterns(rungCount: rungCount - 3) +
        countStepPatterns(rungCount: rungCount - 2) +
        countStepPatterns(rungCount: rungCount - 1)
    }
}

//1~10まで
for v in (1...10) {
    let answer = countStepPatterns(rungCount: v)
    print("「\(v)」段の階段を最大で2段飛ばしする時の上り方のパターンは「\(answer)」")
    print("======")
}
