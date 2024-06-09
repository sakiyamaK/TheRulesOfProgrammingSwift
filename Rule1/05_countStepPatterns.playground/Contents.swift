// P7
func countStepPatterns(memo: inout [Int: Int], rungCount: Int) -> Int {
    
    if rungCount < 0 {
        return 0
    } else if rungCount == 0 {
        return 1
    } else if let value = memo[rungCount] {
        return value
    } else {
        let stepPatternCount = countStepPatterns(memo: &memo, rungCount: rungCount - 3) +
        countStepPatterns(memo: &memo, rungCount: rungCount - 2) +
        countStepPatterns(memo: &memo, rungCount: rungCount - 1)
                
        memo[rungCount] = stepPatternCount
        
        return stepPatternCount
    }
}

func countStepPatterns(rungCount: Int) -> Int {
    var memo: [Int: Int] = [:]
    return countStepPatterns(memo: &memo, rungCount: rungCount)
}

//1~10まで
for v in (1...10) {
    let answer = countStepPatterns(rungCount: v)
    print("「\(v)」段の階段を最大で2段飛ばしする時の上り方のパターンは「\(answer)」")
    print("======")
}
