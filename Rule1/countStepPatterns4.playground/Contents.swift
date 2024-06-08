// P8
func countStepPattern(rungCount: Int) -> Int {

    var stepPatternCounts = [0, 0, 1]
    
    for rungIndex in (0..<rungCount) {
        stepPatternCounts.append(
            stepPatternCounts[rungIndex] +
            stepPatternCounts[rungIndex + 1] +
            stepPatternCounts[rungIndex + 2]
        )
    }
    
    return stepPatternCounts.last!
}

//1~10まで
for v in (1...10) {
    let answer = countStepPattern(rungCount: v)
    print("「\(v)」段の階段を最大で2段飛ばしする時の上り方のパターンは「\(answer)」")
    print("======")
}
