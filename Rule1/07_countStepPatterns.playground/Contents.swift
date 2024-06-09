// P9~P11

// あんまり理解してないからバグってる
struct Ordinal: ExpressibleByIntegerLiteral {
    
    private(set) var values: [UInt32] = []
    init() { }
    init(integerLiteral value: UInt32) {
        values = [value]
    }
    init(_ value: UInt32) {
        values = [value]
    }
    
    static func + (lhs: Ordinal, rhs: Ordinal) -> Ordinal {
        let count = max(lhs.values.count, rhs.values.count)
        var result = Ordinal()
        var carry: UInt64 = 0
        
        for index in (0..<count) {
            let sum: UInt64 = carry + lhs.getValues(index: index) + rhs.getValues(index: index)
            let sum32: UInt32 = UInt32(sum)
            result.values.append(sum32)
            carry = sum >> 32
        }
        
        if carry > 0 {
            result.values.append(UInt32(carry))
        }
        
        return result
    }
    
    private func getValues(index: Int) -> UInt64 {
        guard index < values.count else { return 0 }
        return UInt64(values[index])
    }
}

func countStepPatterns(rungCount: Int) -> Ordinal {

    var stepPatternCounts: [Ordinal] = [0, 0, 1]
    
    for rungIndex in (0..<rungCount) {
        stepPatternCounts.append(
            stepPatternCounts[rungIndex] +
            stepPatternCounts[rungIndex + 1] +
            stepPatternCounts[rungIndex + 2]
        )
    }
    
    return stepPatternCounts.last!
}


// 巨大な数もいけ...ないから直す
for v in (100...105) {
    let answer = countStepPatterns(rungCount: v)
    print("「\(v)」段の階段を最大で2段飛ばしする時の上り方のパターンは「\(answer.values)」")
    print("======")
}
