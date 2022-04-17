//------------------------------------------
// Advanced Operators
//------------------------------------------

//------------------------------------------
// Bitwise Operators
//------------------------------------------

//------------------------------------------
// Bitwise NOT Operator
//------------------------------------------

/*
    let initialBits: UInt8 = 0b00001111
    let invertedBits = ~initialBits  // equals 11110000

*/


let bitA: UInt8 = 0b00001001
let bitB: UInt8 = 0b11110110
print(bitA) // 9
print(bitB) // 246

let invertBitA =  ~bitA
print(String(bitA, radix: 2)) // 1001
print(String(invertBitA, radix: 2)) // 11110110
print(bitA) // 9
print(invertBitA) // 246


//------------------------------------------
// Bitwise AND Operator
//------------------------------------------

/*
    let firstSixBits: UInt8 = 0b11111100
    let lastSixBits: UInt8  = 0b00111111
    let middleFourBits = firstSixBits & lastSixBits  // equals 00111100

*/


// 1 and 1 = 1
// นอกนั้น จะ and กันแล้วได้ 0

/*
let bitA: UInt8 = 0b00001001
let bitB: UInt8 = 0b11110110
*/
let aANDb = bitA & bitB
print(String(aANDb, radix: 2)) // 0
print(aANDb) // 0 


let newA: UInt8 = 0b00101010
let newB: UInt8 = 0b00011100

print(String(newA & newB, radix: 2)) // 1000
print(newA & newB) // 8



print(0b00000100) // 4
print(0b11101111) // 239
print(0b00000100 & 0b11101111) // 4

// print(0b00000100) // 4
// print(0b00010000) // 16
print(0b00000100 & 0b11101111 | 16) // 20



//------------------------------------------
// Bitwise OR Operator
//------------------------------------------

/*
    let someBits: UInt8 = 0b10110010
    let moreBits: UInt8 = 0b01011110
    let combinedbits = someBits | moreBits  // equals 11111110

*/



// 1 or กับอะไรก็ได้ 1
// ex. 1 | 0 = 1


/*
let bitA: UInt8 = 0b00001001
let bitB: UInt8 = 0b11110110
*/

print("OR OPERATOR")
print(String(bitA | bitB, radix: 2)) // 11111111
print(bitA | bitB) // 255


/*
let newA: UInt8 = 0b00101010
let newB: UInt8 = 0b00011100
*/

print(String(newA | newB, radix: 2)) // 111110
print(newA | newB) // 62



//------------------------------------------
// Bitwise XOR Operator
//------------------------------------------

/*
    let firstBits: UInt8 = 0b00010100
    let otherBits: UInt8 = 0b00000101
    let outputBits = firstBits ^ otherBits  // equals 00010001

*/



// เหมือน 0 ต่าง 1
// 1 ^ 0 = 1
// 1 ^ 1 = 0


/*
let bitA: UInt8 = 0b00001001
let bitB: UInt8 = 0b11110110
*/

print("XOR OPERATOR")
print(String(bitA ^ bitB, radix: 2)) // 11111111
print(bitA ^ bitB) // 255


/*
let newA: UInt8 = 0b00101010
let newB: UInt8 = 0b00011100
*/

print(String(newA ^ newB, radix: 2)) // 110110
print(newA ^ newB) // 54



//------------------------------------------
// Bitwise Left and Right Shift Operators
//------------------------------------------


/*
    let shiftBits: UInt8 = 4   // 00000100 in binary
    shiftBits << 1             // 00001000
    shiftBits << 2             // 00010000
    shiftBits << 5             // 10000000
    shiftBits << 6             // 00000000
    shiftBits >> 2             // 00000001


    let pink: UInt32 = 0xCC6699
    let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
    let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
    let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153

*/




// เลื่อนบิทไปทางซ้าย
print("left shift")
print(String(newA, radix: 2)) // 101010
print(newA) // 42
var leftShiftNewA = newA << 1
print(String(leftShiftNewA, radix: 2)) // 1010100
print(leftShiftNewA) // 84

leftShiftNewA = leftShiftNewA << 2
print(String(leftShiftNewA, radix: 2)) // 1010000
print(leftShiftNewA) // 80


print(leftShiftNewA << 2 == 64) // true
print(leftShiftNewA & newA) // 



// เลื่อนบิทไปทางขวา
print("right shift")
print(String(newA, radix: 2)) // 101010
print(newA) // 42
var rightShiftNewA = newA >> 1
print(String(rightShiftNewA, radix: 2)) // 10101
print(rightShiftNewA) // 21



let fourUInt8: UInt8 = 4
print("<< 1:",fourUInt8 << 1)
print(">> 1:", fourUInt8 >> 1)
print("<< 4:",fourUInt8 << 4)
print(">> 4:", fourUInt8 >> 4)

/*
<< 1: 8
>> 1: 2
<< 4: 64
>> 4: 0
*/



let waitForLeftShift: UInt8 = 0b00101010
print(waitForLeftShift) // 42

print(waitForLeftShift << 1) // 84
print(waitForLeftShift << 2) // 168
// overflow
print(waitForLeftShift << 3) // 80
print(waitForLeftShift << 4) // 160



//------------------------------------------
// Shifting Behavior for Signed Integers
//------------------------------------------




var signedInteger: Int8 = 0b100_0000
print(signedInteger) // 64
print(signedInteger << 1) // -128

let unsignedIntger: UInt8 = 0b1000_0000
print(unsignedIntger) // 128
print(unsignedIntger << 1) // 0
print(unsignedIntger >> 2) // 32

let negativeSigned = Int8(bitPattern: unsignedIntger)
print(negativeSigned) // -128
print(negativeSigned << 1) // 0
print(negativeSigned >> 2) // -32




//------------------------------------------
// Overflow Operators
//------------------------------------------

/*

    Overflow addition (&+)
    Overflow subtraction (&-)
    Overflow multiplication (&*)


    var potentialOverflow = Int16.max
    // potentialOverflow equals 32767, which is the maximum value an Int16 can hold
    potentialOverflow += 1
    // this causes an error

*/

//------------------------------------------
// Value Overflow
//------------------------------------------


/*
    var unsignedOverflow = UInt8.max
    // unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
    unsignedOverflow = unsignedOverflow &+ 1
    // unsignedOverflow is now equal to 0

    var unsignedOverflow = UInt8.min
    // unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
    unsignedOverflow = unsignedOverflow &- 1
    // unsignedOverflow is now equal to 255

    var signedOverflow = Int8.min
    // signedOverflow equals -128, which is the minimum value an Int8 can hold
    signedOverflow = signedOverflow &- 1
    // signedOverflow is now equal to 127


*/




var maxUInt8 = UInt8.max
print(maxUInt8) // 255
// overflow
// var zero = maxUInt8 + 1

var zero = maxUInt8 &+ 1
print(zero == 0) // true

var minInt32 = Int32.min
print(minInt32) // 2147483648


print(minInt32 &- 1) // 2147483647
print(Int8.max - 100) // 27
print((Int8.max - 100) &* 2) // 54

let subInt8 = Int8(-127).subtractingReportingOverflow(2)   
print(subInt8) // (partialValue: 127, overflow: true)


//------------------------------------------
// Precedence and Associativity
//------------------------------------------

/*
    2 + 3 % 4 * 5
    // this equals 17
    2 + ((3 % 4) * 5)

(3 % 4) is 3, so this is equivalent to:

    2 + (3 * 5)

(3 * 5) is 15, so this is equivalent to:

    2 + 15

*/


print( 3 * 2 + 2 / 2 * 2) // 8
// (((3 * 2) + 2) / 2 ) * 2
// 3 * 2 = 6
// 6 + 2 = 8
// 8 / 2 = 4
// 4 * 2 = 8



//------------------------------------------
// Operator Methods
//------------------------------------------

/*
    struct Vector2D {
        var x = 0.0, y = 0.0
    }

    extension Vector2D {
        static func + (left: Vector2D, right: Vector2D) -> Vector2D {
            return Vector2D(x: left.x + right.x, y: left.y + right.y)
        }
    }

    let vector = Vector2D(x: 3.0, y: 1.0)
    let anotherVector = Vector2D(x: 2.0, y: 4.0)
    let combinedVector = vector + anotherVector
    // combinedVector is a Vector2D instance with values of (5.0, 5.0)

*/


//------------------------------------------
// Prefix and Postfix Operators
//------------------------------------------

/*
    extension Vector2D {
        static prefix func - (vector: Vector2D) -> Vector2D {
            return Vector2D(x: -vector.x, y: -vector.y)
        }
    }

    let positive = Vector2D(x: 3.0, y: 4.0)
    let negative = -positive
    // negative is a Vector2D instance with values of (-3.0, -4.0)
    let alsoPositive = -negative
    // alsoPositive is a Vector2D instance with values of (3.0, 4.0)

*/

struct Resolution{
    var width: Int = 720
    var height: Int = 480
    var word: String = ""
}


extension Resolution{
    static func + (first: Resolution, second: Resolution) -> Resolution{
        return Resolution(width: first.width + second.width,
        height: first.height + second.height,
        word: first.word + " " + second.word
        )
    }

    static func - (first: Resolution, second: Resolution) -> Resolution{
        return Resolution(width: first.width - second.width,
        height: first.height - second.height,
        word: second.word
        )
    }

    static prefix func - (video: Resolution) -> Resolution{
        return Resolution(width: video.width - 100,
        height: video.height - 100,
        word: video.word
        )
    }

    static postfix func ++ (video: Resolution) -> Resolution{
        return Resolution(width: video.width + 100,
        height: video.height + 100,
        word: video.word
        )
    }
    
}

var newResolution = Resolution()
var anotherResolution = Resolution(width: 100, height: 100, word: "Hello")

var sumOfResolution = newResolution + anotherResolution
print(sumOfResolution) // Resolution(width: 820, height: 580, word: " Hello")


sumOfResolution = anotherResolution - newResolution
print(sumOfResolution) // Resolution(width: -620, height: -380, word: "")

sumOfResolution = -sumOfResolution
print(sumOfResolution) // Resolution(width: -720, height: -480, word: "")

sumOfResolution = sumOfResolution++
sumOfResolution = sumOfResolution++

print(sumOfResolution) // Resolution(width: -520, height: -280, word: "")




//------------------------------------------
// Compound Assignment Operators
//------------------------------------------

/*
    extension Vector2D {
        static func += (left: inout Vector2D, right: Vector2D) {
            left = left + right
        }
    }

    var original = Vector2D(x: 1.0, y: 2.0)
    let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
    original += vectorToAdd
    // original now has values of (4.0, 6.0)

*/


extension Resolution{
    static func += (first: inout Resolution, second: Resolution){
        first = first + second
    }

    static func *= (first: inout Resolution, second: Resolution){
        first.width *= second.width
        first.height *= second.height
    }
}

sumOfResolution += sumOfResolution
print(sumOfResolution) // Resolution(width: -1040, height: -560, word: " ")

sumOfResolution.width = 2
sumOfResolution.height = 2
sumOfResolution *= Resolution()

print(sumOfResolution) // Resolution(width: 1440, height: 960, word: " ")



//------------------------------------------
// Equivalence Operators
//------------------------------------------

/*
    extension Vector2D: Equatable {
        static func == (left: Vector2D, right: Vector2D) -> Bool {
            return (left.x == right.x) && (left.y == right.y)
        }
    }


    let twoThree = Vector2D(x: 2.0, y: 3.0)
    let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
    if twoThree == anotherTwoThree {
        print("These two vectors are equivalent.")
    }
    // Prints "These two vectors are equivalent."

*/

extension Resolution: Equatable{
    static func == (first: Resolution, second: Resolution) -> Bool{
        let result = (first.width == second.width) && (first.height == second.height)
        print(result ? "equal" : "not equal")
        return result
    }

    static func != (first: Resolution, second: Resolution) -> Bool{
        let result = (first.width != second.width) && (first.height != second.height)
        print(result ? "yes. not equal" : "equal")
        return result
    }
}

sumOfResolution == sumOfResolution // equal
sumOfResolution != sumOfResolution // equal






//------------------------------------------
// Custom Operators
//------------------------------------------

/*
    prefix operator +++

    extension Vector2D {
        static prefix func +++ (vector: inout Vector2D) -> Vector2D {
            vector += vector
            return vector
        }
    }

    var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
    let afterDoubling = +++toBeDoubled
    // toBeDoubled now has values of (2.0, 8.0)
    // afterDoubling also has values of (2.0, 8.0)

*/



postfix operator +*
postfix operator **
prefix operator *
postfix operator *

extension Resolution{
    static postfix func +* (video: inout Resolution){
        video.width = (video.width + video.width) * video.width
        video.height = (video.height + video.height) * video.height
    }

    static postfix func ** (video: inout Resolution){
        video.width = (video.width * video.width)
        video.height = (video.height * video.height)
    }

    static prefix func * (video: Resolution) -> Resolution{
        return video
    }
    
    static postfix func * (video: Resolution) -> Resolution{
        return Resolution(width: video.width, height: video.height, word: video.word.uppercased())
    }

}

print(sumOfResolution) // Resolution(width: 1440, height: 960, word: " ")
sumOfResolution+*
print(sumOfResolution) // Resolution(width: 4147200, height: 1843200, word: " ")

sumOfResolution.width = 2
sumOfResolution.height = 2
sumOfResolution**
print(sumOfResolution) // Resolution(width: 4, height: 4, word: " ")


sumOfResolution.word = "some text in video"
print(*sumOfResolution*) // Resolution(width: 4, height: 4, word: "SOME TEXT IN VIDEO")



//------------------------------------------
// Precedence for Custom Infix Operators
//------------------------------------------

/*
    infix operator +-: AdditionPrecedence
    extension Vector2D {
        static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
            return Vector2D(x: left.x + right.x, y: left.y - right.y)
        }
    }
    let firstVector = Vector2D(x: 1.0, y: 2.0)
    let secondVector = Vector2D(x: 3.0, y: 4.0)
    let plusMinusVector = firstVector +- secondVector
    // plusMinusVector is a Vector2D instance with values of (4.0, -2.0)

*/



import Foundation

infix operator ^^ : MultiplicationPrecedence
postfix operator %

extension Resolution{
    static func ^^ (video: Resolution, power: Double) -> Resolution{
        let newWidth = Int((pow(Double(video.width), power)))
        let newHeight = Int((pow(Double(video.height), power)))

        return Resolution(width: newWidth,
            height: newHeight,
            word: video.word
        )
    }

    static postfix func % (video: Resolution) -> Double{
        let result = Double(video.width) / 100 + Double(video.height) / 100
        print(result)
        return result
    }
}



print(sumOfResolution ^^ 2) // Resolution(width: 16, height: 16, word: " ")

sumOfResolution = sumOfResolution ^^ 2
print(sumOfResolution%) // 0.32




//------------------------------------------
// Result Builders
//------------------------------------------


/*
    protocol Drawable {
        func draw() -> String
    }
    struct Line: Drawable {
        var elements: [Drawable]
        func draw() -> String {
            return elements.map { $0.draw() }.joined(separator: "")
        }
    }
    struct Text: Drawable {
        var content: String
        init(_ content: String) { self.content = content }
        func draw() -> String { return content }
    }
    struct Space: Drawable {
        func draw() -> String { return " " }
    }
    struct Stars: Drawable {
        var length: Int
        func draw() -> String { return String(repeating: "*", count: length) }
    }
    struct AllCaps: Drawable {
        var content: Drawable
        func draw() -> String { return content.draw().uppercased() }
    }


    let name: String? = "Ravi Patel"
    let manualDrawing = Line(elements: [
        Stars(length: 3),
        Text("Hello"),
        Space(),
        AllCaps(content: Text((name ?? "World") + "!")),
        Stars(length: 2),
        ])
    print(manualDrawing.draw())
    // Prints "***Hello RAVI PATEL!**"


// สร้าง result builder 
    @resultBuilder
    struct DrawingBuilder {
        // อย่างน้อย type ที่สร้างขึ้นมาต้องมี buildBlock ***
        static func buildBlock(_ components: Drawable...) -> Drawable {
            return Line(elements: components)
        }

        // ถ้าอยากใช้ if else
        // จริงจะเข้า case first
        static func buildEither(first: Drawable) -> Drawable {
            return first
        }
        // เท็จจะเข้า case second
        static func buildEither(second: Drawable) -> Drawable {
            return second
        }
    }



    func draw(@DrawingBuilder content: () -> Drawable) -> Drawable {
        return content()
    }
    func caps(@DrawingBuilder content: () -> Drawable) -> Drawable {
        return AllCaps(content: content())
    }


    func makeGreeting(for name: String? = nil) -> Drawable {
        // สร้าง greeting เป็นผลลัพธ์ที่ได้จากการเรียก draw(เป็น drawingBuilder)
        let greeting = draw {
            Stars(length: 3)
            Text("Hello")
            Space()
            // caps ใช้ if else ได้จากการสร้าง buildEither ไว้รองรับ
            caps {
                if let name = name {
                    Text(name + "!")
                } else {
                    Text("World!")
                }
            }
            Stars(length: 2)
        }
        return greeting
    }
    let genericGreeting = makeGreeting()
    print(genericGreeting.draw())
    // Prints "***Hello WORLD!**"

    let personalGreeting = makeGreeting(for: "Ravi Patel")
    print(personalGreeting.draw())
    // Prints "***Hello RAVI PATEL!**"



// เวอร์ชั่นเต็มๆ ของตัว caps ข้างใน draw ที่ใช้ if else ที่จะทำเองโดยอัตโนมัติ
    let capsDrawing = caps {
        let partialDrawing: Drawable
        if let name = name {
            let text = Text(name + "!")
            // กรณี if จะเรียกตัว first
            partialDrawing = DrawingBuilder.buildEither(first: text)
        } else {
            let text = Text("World!")
            partialDrawing = DrawingBuilder.buildEither(second: text)
        }
        // เมื่อเสร็จแล้วจะ return
        return partialDrawing
    }


// ถ้าจะใช้ for ก็เพิ่ม buildArray เข้าไป
    extension DrawingBuilder {
        static func buildArray(_ components: [Drawable]) -> Drawable {
            return Line(elements: components)
        }
    }
    let manyStars = draw {
        Text("Stars:")
        for length in 1...3 {
            Space()
            Stars(length: length)
        }
    }
    // ผลลัพธ์จะได้
    // Stars: * ** ***
*/



func makeString() -> String{
    return "some string in function"
}


@resultBuilder
struct makeStringAsResultBuilder{
    static func buildBlock(_ textList: String...) -> String{
        return textList.joined(separator: " ")
    }
}


let textCreatedByResultBuilder = makeStringAsResultBuilder.buildBlock(
    "Hello", "This", " ", "is", "String"
)
print(textCreatedByResultBuilder) // Hello This   is String


@makeStringAsResultBuilder func makeStringFormBuilder() -> String{
    "let"
    "take"
    "some"
    "text"
    "in"
    "new"
    "function"
}

print(makeStringFormBuilder()) // let take some text in new function


func makeStringWithBuilderInFunction() -> String{
    let result = makeStringAsResultBuilder.buildBlock("congrats", "!")
    return result
}

print(makeStringWithBuilderInFunction()) // congrats !


func makeStringClosure(@makeStringAsResultBuilder _ result: () -> String) -> String{
    result()
}

let resultOfMakeStringClosure = makeStringClosure{
    "some"
    "string"
    "from"
    "closure"
}


print(resultOfMakeStringClosure) // some string from closure

@resultBuilder
struct makeStringAsResultBuilderWithCondition{
    static func buildBlock(_ textList: String...) -> String{
        return textList.joined(separator: " ")
    }
    static func buildEither(first text: String) -> String{
        return text
    }
    static func buildEither(second text: String) -> String{
        return text
    }
}


@makeStringAsResultBuilderWithCondition func makeStringWithCondition(number: Int) -> String{
    "before"
    "take"
    "if else"
    "***"
    if(number == 1){
        "first"
    }else if(number == 2){
        "second"
    }else{
        "and else"
    }
}

print(makeStringWithCondition(number: 1)) // before take if else *** first
print(makeStringWithCondition(number: 2)) // before take if else *** second
print(makeStringWithCondition(number: 3)) // before take if else *** else


@resultBuilder
struct makeStringWithConditionAndLoop{
    static func buildBlock(_ textList: String...) -> String{
        return textList.joined(separator: " ")
    }
    static func buildEither(first text: String) -> String{
        return text
    }
    static func buildEither(second text: String) -> String{
        return text
    }
    static func buildArray(_ textGroup: [String]) -> String{
        return textGroup.joined(separator: " ")
    }
}


@makeStringWithConditionAndLoop func makeStringArray() -> String{
    for iterator in 0...5{
        "\(iterator)"
    }

}
print(makeStringArray()) // 0 1 2 3 4 5


extension makeStringWithConditionAndLoop{
    static func buildOptional(_ optionalString: String?) -> String{
        return optionalString ?? "[Unset]"
    }
}


func makeGreeting(for name: String) -> String{
    var result: String?

    if !(name.isEmpty){
        result = makeStringWithConditionAndLoop.buildBlock("Hello", name)
    }else{
        result = makeStringWithConditionAndLoop.buildOptional(result)
    }

    return result!

}

print(makeGreeting(for: "")) // [Unset]
print(makeGreeting(for: "Dragon")) // Hello Dragon


extension makeStringWithConditionAndLoop{
    // ต้องทำทั้ง string และ int
    static func buildExpression(_ expression: Int) -> String {
        return "\(expression)"
    }
    static func buildExpression(_ expression: String) -> String {
        return expression
    }
}

@makeStringWithConditionAndLoop var makeStringButInputInt: String{
    1
    2
}

print(makeStringButInputInt) // 1 2


extension makeStringWithConditionAndLoop{
    // ต้องทำทั้ง string และ int
    static func buildFinalResult(_ component: String) -> Int {
        return component.count
    }
    static func buildFinalResult(_ component: String) -> String {
        return component
    }
}

@makeStringWithConditionAndLoop var makeStringButReturnInt: Int{
    "GO Int"
    "GOGOGO"
}

print(makeStringButReturnInt) // 13




extension makeStringWithConditionAndLoop{
    static func buildSomething(_ component: [String]...) -> [String]{
        [component.flatMap( {$0}).joined()]
    }
}


func makeStringSomething(){
    let result = makeStringWithConditionAndLoop.buildSomething(["2", "1"], ["second", "first"])
    print(result)
}

makeStringSomething() // ["21secondfirst"]






struct Status{
    var name: String
    var value: Value

    enum Value{
        case bool(Bool)
        case int(Int)
    }

    init(_ name: String, _ value: Value){
        self.name = name
        self.value = value
    }

}

@resultBuilder
struct StatusWithResultBuilder{
    static func buildBlock(_ component: [Status]...) -> [Status]{
        Array(component.joined())
    }
    static func buildExpression(_ dataSet: (name: String, bool: Bool)) -> [Status]{
        [Status(dataSet.name, .bool(dataSet.bool))]
    }
    static func buildExpression(_ dataSet: (name: String, int: Int)) -> [Status]{
        [Status(dataSet.name, .int(dataSet.int))]
    }
    static func buildExpression(_ status: Status) -> [Status]{
        [status]
    }
    
}


@StatusWithResultBuilder
func makeStatus() -> [Status]{
    ("online", true)
    ("hp", 100)
}

var someStatus = makeStatus()
for item in someStatus{
    print(item)
}
/*
Status(name: "online", value: jdoodle.Status.Value.bool(true))
Status(name: "hp", value: jdoodle.Status.Value.int(100))
*/
