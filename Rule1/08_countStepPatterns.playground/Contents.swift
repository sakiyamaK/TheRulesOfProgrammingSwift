// P12
func countStepPatterns(rungCount: Int) -> Int {

    // 大きな数は扱えないためassertを入れている
    assert(rungCount <= 36)

    var stepPatternCounts: [Int] = [0, 0, 1]
    
    for rungIndex in (0..<rungCount) {
        stepPatternCounts.append(
            stepPatternCounts[rungIndex] +
            stepPatternCounts[rungIndex + 1] +
            stepPatternCounts[rungIndex + 2]
        )
    }
    
    return stepPatternCounts.last!
}


// 30~40まで
for v in (30...40) {
    let answer = countStepPatterns(rungCount: v)
    print("「\(v)」段の階段を最大で2段飛ばしする時の上り方のパターンは「\(answer)」")
    print("======")
}
