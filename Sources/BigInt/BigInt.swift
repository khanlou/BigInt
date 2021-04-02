import Foundation

enum Sign {
    case positive, negative

    mutating func flip() {
        if self == .positive {
            self = .negative
        } else {
            self = .positive
        }
    }
}

public struct BigInt: CustomStringConvertible {

    var words: [UInt8] = []

    var sign: Sign = .positive

    init(words: [UInt8], sign: Sign) {
        self.words = words
        self.sign = sign
    }

    private init(uint8: UInt8) {
        self.init(words: [uint8], sign: .positive)
    }

    public init(_ int: Int) {
        var parsing = int < 0 ? -int : int
        let max = Int(UInt8.max) + 1

        let sign = int < 0 ? Sign.negative : .positive

        var words: [UInt8] = []
        while parsing != 0 {
            let remainder = parsing % max
            words.append(UInt8(remainder))
            parsing /= max
        }

        self = BigInt(words: words, sign: sign)
    }

    public init?(_ string: String) {
        var accumulator = Self.init(uint8: 0)
        let ints = string.map({ UInt8(String($0)) })
        for int in ints {
            guard let unwrapped = int else {
                return nil
            }
            accumulator = (accumulator * BigInt(uint8: 10)) + BigInt(uint8: unwrapped)
        }
        self = accumulator
    }

    private mutating func normalizeTrailingZeros(_ n: Int) {
        while words.count < n {
            self.words.append(0)
        }
    }

    private mutating func cleanUpTrailingZeros() {
        while words.last == 0 { words.removeLast() }
    }

    public static func + (lhs: BigInt, rhs: BigInt) -> BigInt {
        var lhsCopy = lhs
        var rhsCopy = rhs

        let newSign: Sign

        switch (lhs.sign, rhs.sign) {
        case (.negative, .positive):
            lhsCopy.sign = .positive
            return rhs - lhs
        case (.positive, .negative):
            rhsCopy.sign = .positive
            return lhs - rhs
        case (.negative, .negative):
            newSign = .negative
        case (.positive, .positive):
            newSign = .positive
        }

        lhsCopy.normalizeTrailingZeros(rhsCopy.words.count)
        rhsCopy.normalizeTrailingZeros(lhsCopy.words.count)

        var newWords: [UInt8] = []
        newWords.reserveCapacity(max(rhsCopy.words.count, lhsCopy.words.count))

        var shouldCarry = false

        for (lhsWord, rhsWord) in zip(lhsCopy.words, rhsCopy.words) {
            var (newWord, didOverflow) = lhsWord.addingReportingOverflow(rhsWord)
            if shouldCarry {
                (newWord, didOverflow) = newWord.addingReportingOverflow(1)
                shouldCarry = false
            }
            if didOverflow {
                shouldCarry = true
            }
            newWords.append(newWord)
        }
        if shouldCarry {
            newWords.append(1)
        }

        return BigInt(words: newWords, sign: newSign)
    }

    public static func - (lhs: BigInt, rhs: BigInt) -> BigInt {

        var newWords: [UInt8] = []
        newWords.reserveCapacity(max(rhs.words.count, lhs.words.count))

        var shouldBorrow = false
        for (lhsWord, rhsWord) in zip(lhs.words, rhs.words) {

            var (newWord, didUnderflow) = lhsWord.subtractingReportingOverflow(rhsWord)
            if shouldBorrow {
                (newWord, didUnderflow) = newWord.subtractingReportingOverflow(1)
                shouldBorrow = false
            }

            if didUnderflow {
                shouldBorrow = true
            }
            newWords.append(newWord)

        }
        return BigInt(words: newWords, sign: .positive)
    }

    public static func * (lhs: BigInt, rhs: BigInt) -> BigInt {

        let newSign: Sign
        switch (lhs.sign, rhs.sign) {
        case (.positive, .positive), (.negative, .negative):
            newSign = .positive
        case (.negative, .positive), (.positive, .negative):
            newSign = .negative
        }

        var lhsCopy = lhs
        var rhsCopy = rhs

        let maxLength = max(rhsCopy.words.count, lhsCopy.words.count) + 1

        lhsCopy.normalizeTrailingZeros(maxLength)
        rhsCopy.normalizeTrailingZeros(maxLength)

        var result = BigInt(uint8: 0)
        result.sign = newSign

        for (place, lhsWord) in lhsCopy.words.enumerated() {
            var previousHigh: UInt8 = 0
            var runningSum: [UInt8] = .init(repeating: 0, count: place)
            for rhsWord in rhsCopy.words {
                let (high, low) = lhsWord.multipliedFullWidth(by: rhsWord)
                runningSum.append(low + previousHigh) // what if this overflows
                previousHigh = high
            }
            if previousHigh != 0 {
                runningSum.append(previousHigh)
            }
            result = result + BigInt(words: runningSum, sign: newSign)
        }

        result.cleanUpTrailingZeros()

        return result
    }

    // single word division only
    public static func / (dividend: BigInt, divisor: UInt8) -> BigInt {
        return dividend.divide(by: divisor).value
    }

    public func divide(by divisor: UInt8) -> (value: BigInt, remainder: UInt8) {
        var newWords: [UInt8] = []

        var previousRemainder: UInt8 = 0

        for dividendWord in self.words.reversed() {
            let (quotient, remainder) = divisor.dividingFullWidth((high: previousRemainder, dividendWord))
            previousRemainder = remainder
            newWords.append(quotient)
        }

        newWords = newWords.drop(while: { $0 == 0 }).reversed()

        return (BigInt(words: newWords, sign: self.sign), previousRemainder)
    }

    public var description: String {
        var string = ""
        var progress = self
        while true {
            let (newValue, remainder) = progress.divide(by: 10)
            progress = newValue
            string.append("\(remainder)")
            if newValue.words.allSatisfy({ $0 == 0 }) { break }
        }
        if sign == .negative {
            string += "-"
        }
        return String(string.reversed())
    }

}

extension BigInt: Equatable {
    public static func == (lhs: BigInt, rhs: BigInt) -> Bool {
        // normalize trailing first
        return lhs.words == rhs.words && lhs.sign == rhs.sign
    }
}

extension BigInt: Comparable {
    public static func < (lhs: BigInt, rhs: BigInt) -> Bool {
        var lhsCopy = lhs
        var rhsCopy = rhs
        switch (lhsCopy.sign, rhsCopy.sign) {
        case (.negative, .positive):
            return true
        case (.positive, .negative):
            return false
        case (.negative, .negative):
            lhsCopy.sign.flip()
            rhsCopy.sign.flip()
            return lhsCopy > rhsCopy
        case (.positive, .positive):

            for (lhsWord, rhsWord) in zip(lhsCopy.words, rhsCopy.words).reversed() {
                if lhsWord < rhsWord { return true }
                if lhsWord > rhsWord { return false }
            }

            //they are equal
            return false
        }
    }
}
