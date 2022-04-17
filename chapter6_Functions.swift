//------------------------------------------
// Functions
//------------------------------------------

/*
func funcname(Parameters) -> returntype {
   Statement1
   Statement2
   ---
   Statement N
   return parameters
}
*/

//------------------------------------------
// Defining and Calling Functions
//------------------------------------------

func getSquare(number: Int) {
   print(number * number)
}
getSquare(number: 20) // 400


func student(name: String) -> String{
    return name
}
print(type(of:student)) // (String) -> String
print(student(name: "Eden")) // Eden

func student(name: Int) -> Int{
// func student(name: Int) -> String{
// cannot convert return expression of type 'Int' to return type 'String'
    return name
}
print(student(name: 15)) // 15
// print(student(name: 9 + "9")) // *error*
print(student(name: "a")) // a
print(student(name: "266")) // 266


func student(age: Int) -> Int{
    return age
}
print(student(name: 16)) // 16
print(student(age: 16)) // 16
// print(student(age: "16")) // *error*


func getAgeGiveFive(age: Int) -> Int{
    return 5
}
// (Int) -> Int
print(getAgeGiveFive) // (Function)
print(getAgeGiveFive(age: 90)) // 5


var getAge: Any = ()
print(type(of:getAge)) // ()
func getAgeGiveAge(age: Int) -> Int{
    return age
}
// (Int) -> Int
print(getAgeGiveAge) // (Function)
print(getAgeGiveAge(age: 90)) // 90

func getAgeGiveAge(age: String) -> String{
    return age
}
print(type(of:(getAgeGiveAge(age: "60")))) // String
print(getAgeGiveAge(age: "60")) // 90

getAge = getAgeGiveAge(age: 180)
print(type(of:getAge)) // Int
print(getAge) // 180

getAge = getAgeGiveAge(age: "120")
print(type(of:getAge)) // String
print(getAge) // 120



    // void function
func funcHelloWorld() {
    print("Hello World!")
}
funcHelloWorld() // Hello World!



func typeOf(_ data:Any){
    print(type(of:data))
}





    //  create array in function
// func myArrayFunc(inputArray:Array<Any>) -> Array<Any> {}
func returnArrayOneToFive() -> Array<Int> {
    let myArray = [1, 2, 3, 4, 5]
    return myArray
}
print(type(of:returnArrayOneToFive)) // () -> Array<Int>
print(returnArrayOneToFive()) // [1, 2, 3, 4, 5]

var arrayOneToFive = returnArrayOneToFive()
print(arrayOneToFive) // [1, 2, 3, 4, 5]

func arrayDoubleValue(inputArray data: Array<Int>) -> Array<Int>{
    guard !data.isEmpty else{
        print("Arrays is Empty")
        return data
    }
    var newArray = data
    for (index, _) in newArray.enumerated(){
        newArray[index] *= newArray[index]
    }
    return newArray
}
print(type(of:arrayDoubleValue)) // (Array<Int>) -> Array<Int>

arrayOneToFive = arrayDoubleValue(inputArray: arrayOneToFive)
print(arrayOneToFive) // [1, 4, 9, 16, 25]



func findPosition(of value: String, in array: [String]) -> Int?{
    for item in 0..<array.count{
        if array[item] == value{
            return item
        }
    }
    return nil
}

let arrayDataStatus = ["Happy", "unhappy", "Sad", "Angry", "Joy", "Love"]

if let indexOfStatus = findPosition(of: "Angry", in: arrayDataStatus){
    print(indexOfStatus) // 3
}




//------------------------------------------
// Function Parameters and Return Values
//------------------------------------------

    //------------------------------------------
    // Functions Without Parameters
    //------------------------------------------

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld()) // hello, world



// void return Array<(String, String)>
func returnArrayTuple()->[(String,String)]{
    let someArray = [("one", "two"), ("Hello", "there")]
    return someArray  
}
// Array<(String, String)>
print(returnArrayTuple())
// [("one", "two"), ("Hello", "there")]

var collectReturnArrayTuple = returnArrayTuple
typeOf(collectReturnArrayTuple)
// () -> Array<(String, String)>



    //------------------------------------------
    // Functions With Multiple Parameters
    //------------------------------------------

func getAgeGiveAge(age: Int, trueForIntFalseForString intOrString: Bool) -> Any {
    if intOrString{
        return getAgeGiveAge(age: age)
    }else{
        return getAgeGiveAge(age: String(age))
    }
}

getAge = getAgeGiveAge(age: 100, trueForIntFalseForString: true)
print(type(of:getAge)) // Int
print(getAge) // 100

getAge = getAgeGiveAge(age: 100, trueForIntFalseForString: false)
print(type(of:getAge)) // String
print(getAge) // 100



var someSong: [String: Any]? = [
                            "title": "Kimi no na wa",
                            "artist": "Radwimps",
                            "song": ["Sparkle", "Nandemonaiya"]
                            ]

func findKey(find key: String?, in dict:[String: Any]?) -> (Bool){
    guard let dict = dict else{
        return false
    }
    switch key{
        case let (target) where target != nil:
            for (key, _) in dict{
                if key == target{
                    return true
                }
            }
            fallthrough
        default:
            return false
    }
}

print(type(of:findKey))
//(Optional<Dictionary<String, Any>>, Optional<String>) -> Bool

print(findKey(find: "Name", in: someSong)) // false
print(findKey(find: "title", in: someSong)) // true


func getDictValueUnwrap(get key: String?, in dict: Dictionary<String, Any>?) -> Any {
    guard let dict = dict,
        let key = key,
        findKey(find: key, in: dict)
        else{ return false}

    return dict[key]!
}
print(type(of:getDictValueUnwrap))
// (Optional<Dictionary<String, Any>>, Optional<String>) -> Any

print(getDictValueUnwrap(get: "title", in: someSong))

let getArtist = getDictValueUnwrap(get: "title", in: someSong)
print(type(of:getArtist)) // String
print(getArtist) // Radwimps




// (String, Array<String>) -> Optional<String>
func getValue(_ target: String, in array: [String]) -> String?{
    for item in array{
        if item == target{
            return target
        }
    }
    return nil
}

let fruits = ["Apple", "Orange", "Banana", "Mango"]

if let findApple = getValue("Apple", in: fruits){
    print(findApple) // Apple
}

func getValue(_ target: String, in dict: [String: String]?) -> String?{
    guard let dict = dict else{
        return nil
    }
    for (key, value) in dict{
        if target == value{
            return target
        }
    }
    return nil
}

let fruitsDictionary = [
    "🍎": "Apple",
    "🍑": "Peach",
    "🍓": "Strawberry"
]

if let findApple = getValue("Apple", in: fruitsDictionary){
    print(findApple) // Apple
}



var nameOfLindwurm = "Lind wurm"
print(nameOfLindwurm)

    // ลบตัวอักษร
func removeCharacters(in str: String, with toRemove: String) -> String{
    var output = ""
    let toRemove = Array(toRemove)

    for character in str {
        if toRemove.contains(character) {
            continue
        }
        output.append(character)
    }

    return output
}

print(removeCharacters(in: nameOfLindwurm, with: "Lin"))
// d wurm



//------------------------------------------
// Functions Without Return Values
//------------------------------------------

// void function
func calBoxVolumeVoid(width: Double, length: Double, height: Double){
    print(width * length * height)
}
calBoxVolumeVoid(width: 3, length: 3, height: 3) // 27.0


    // The return value of a function can be ignored when it’s called:



func showCalBoxVolAndReturn(width: Double, length: Double, height: Double) -> Double{
    print(width * length * height)
    return (width * length * height)
}

func showCalBoxVolWithoutReturn(width: Double, length: Double, height: Double){
    let _ = showCalBoxVolAndReturn(width: width, length: length, height: height)
}

showCalBoxVolAndReturn(width: 3, length: 3, height: 3) // 27.0
showCalBoxVolWithoutReturn(width: 3, length: 3, height: 3)

var getCalBoxNoValue = showCalBoxVolAndReturn 
// getCalBoxNoValue // *error*
print(getCalBoxNoValue) // (Function)
print(type(of:getCalBoxNoValue)) // (Double, Double, Double) -> Double

var getCalBox = showCalBoxVolAndReturn(width: 4, length: 4, height: 4) // 64.0
// getCalBox() // *error*
print(type(of:getCalBox)) // Double
print(getCalBox) // 64.0


func swapString(_ left: inout String, _ right: inout String){
    let temp = left
    left = right
    right = temp
}

var cat = "cat"
var dog = "dog"
print(cat) // cat
print(dog) // dog
swapString(&cat, &dog)
print(cat) // dog
print(dog) // cat



func printH(){ print("H")}
func printE(){ print("E")}
func printL(){ print("L")}
func printO(){ print("O")}

var arrayHello: [() -> Void] = []

func getHello(to array: inout [() -> Void]){
    array.append(printH)
    array.append(printE)
    array.append(printL)
    array.append(printL)
    array.append(printO)
}

func printHello(in array: [() -> Void]) {
    for item in array{
        item()
    }
}

getHello(to: &arrayHello)
printHello(in: arrayHello)
/*
H
E
L
L
O
*/





//------------------------------------------
// Functions with Multiple Return Values
//------------------------------------------


/*
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
*/

func calRent(rent: Double, water: Double, elec: Double, wifi: Double)
    -> (Double){
        let sum = (rent) + (water * 10) + (elec * 15) + (wifi)
        return sum
    }
var rent = calRent(rent: 1, water: 1, elec: 1, wifi: 1)
print(rent) // 27.0



func getUser() -> [String] {
    return ["Adam", "Beetle", "Cert", "Dawn"]
}

print(type(of:getUser)) // () -> Array<String>

let user = getUser()
print(user) //  ["Adam", "Beetle", "Cert", "Dawn"]
print(type(of:user)) // Array<String>



func returnMultipleValues() -> (String, Int, Double) {
    return ("This is String and ", 12, 3.14)
}
print(returnMultipleValues())
// ("This is String and ", 12, 3.1400000000000001)



func whatDoesTheFoxSay(inString: String, inInt: Int, inDouble: Double)
                        -> (String, Int, Double){
    print ("String:\(inString), Int: \(inInt), Dobule:\(inDouble)")
    return (inString, inInt, inDouble)
}

whatDoesTheFoxSay(inString:"Bark!", inInt: 11111, inDouble: 9.9)
// String:Bark!, Int: 11111, Dobule:9.9




//------------------------------------------
// Optional Tuple Return Types
//------------------------------------------

/*
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }

    if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
        print("min is \(bounds.min) and max is \(bounds.max)")
    }
    // Prints "min is -6 and max is 109"
*/


let emiya: [String: Any] =  ["Name": "Emiya Shirou", "Age": 15, "Money": 1999.0]


func displayProfile(dict: [String: Any]?) -> (name: String, age: Int, money: Double)? {
    guard let dict = dict else{
        return nil
    }
    let name = getDictValueUnwrap(get: "Name", in: dict) as! String
    let age = getDictValueUnwrap(get: "Age", in: dict) as! Int
    let money = getDictValueUnwrap(get: "Money", in: dict) as! Double
    return (name, age, money)
}

print(type(of:emiya))
if let showEmiya = displayProfile(dict: emiya){
    print(showEmiya.name) // Emiya Shirou
    print(showEmiya.age) // 15
    print(showEmiya.money) // 1999.0
}



    // แบ่งชื่อและนามสกุล
func firstAndLastname(of input:String) -> (firstName: String, lastName: String)?{
    var fN = ""

    for character in input {
        if (character == " "){
            break
        }
        fN.append(character)
    }

    var lN = removeCharacters(in: input, with: " " + fN)
    return (fN, lN)
}

if let mrLindwurm = firstAndLastname(of: nameOfLindwurm){
    print("FirstName: ", mrLindwurm.firstName) // FirstName:  Lind
    print("LastName: ", mrLindwurm.lastName) // LastName:  wurm
}






//------------------------------------------
// Functions With an Implicit Return
//------------------------------------------

/* **************single expression, ************** */

/*
    func greeting(for person: String) -> String {
        "Hello, " + person + "!"
    }
    print(greeting(for: "Dave"))
    // Prints "Hello, Dave!"

    func anotherGreeting(for person: String) -> String {
        return "Hello, " + person + "!"
    }
    print(anotherGreeting(for: "Dave"))
    // Prints "Hello, Dave!"

*/


func toInt(_ myStr: String?) -> Int {
    if let myInt = myStr{
        return Int(myInt)!
    }else{
        return 0
    }
}

func plusString(plus: String, with: String) -> String {
    return String(toInt(plus) + toInt(with))
    // หรือ
    // String(toInt(plus) + toInt(with))
}

print(plusString(plus: "5", with: "2")) // 7

print(type(of:toInt("2"))) // Int
print(toInt("2")) // 2



func evenOrOdd(for num: Int) -> String{
    return (num % 2 == 0) ? "Even" : "Odd"
    // หรือ
    // (num % 2 == 0) ? "Even" : "Odd"
}
print(evenOrOdd(for: 15)) // Odd

func greatNumber(of left: Int,and right: Int) -> (Int){
    return (left > right) ? left : right
}
print(greatNumber(of: 60, and: 70)) // 70



//------------------------------------------
// Function Argument Labels and Parameter Names
//------------------------------------------

/*
    func someFuc(argument labels parametername: datatype)


    func someFunction(firstParameterName: Int, secondParameterName: Int) {
        // In the function body, firstParameterName and secondParameterName
        // refer to the argument values for the first and second parameters.
    }
    someFunction(firstParameterName: 1, secondParameterName: 2)

*/

func countDown(number: Int) {
    print(number)
    if (number != 0 ){
        countDown(number: number - 1)   
    }
}
print("Countdown:")
countDown(number:3)
/*
Countdown:
3
2
1
0
*/



//------------------------------------------
// Specifying Argument Labels
//------------------------------------------

/*
    func someFunction(argumentLabel parameterName: Int) {
        // In the function body, parameterName refers to the argument value
        // for that parameter.
    }


    func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    print(greet(person: "Bill", from: "Cupertino"))
    // Prints "Hello Bill!  Glad you could visit from Cupertino."


*/

func showSortDictionary(from dict: Dictionary<String, String>?){
    guard let dict = dict else{
        print("no data in dictionary")
        return
    }
    let key = [String](dict.keys).sorted()
    let value = [String](dict.values).sorted()
    print(key)
    print(value)
}

let grade = [
    "A": "Excellent",
    "B": "Good",
    "C": "Fair",
    "D": "Poor",
    "F": "Failed"
]

showSortDictionary(from: grade)
/*
["A", "B", "C", "D", "F"]
["Excellent", "Failed", "Fair", "Good", "Poor"]
*/




//------------------------------------------
// Omitting Argument Labels
//------------------------------------------

/*
    func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
        // In the function body, firstParameterName and secondParameterName
        // refer to the argument values for the first and second parameters.
    }
    someFunction(1, secondParameterName: 2)

*/

func findMean(_ array: [Double]) -> (Double){
    guard !array.isEmpty else{
        return 0.0
    }
    var sum = 0.0
        print(type(of:sum))
    for (item) in array{
        sum += item
    }
    return (sum / Double(array.count))
}

let arrayDouble: [Double] = [6.9, 87.63, 150.0 ,100.6, 69.6, 10.9, 98.2]
print(findMean(arrayDouble)) // 74.8328571428572

func translateSymbol(_ data: String) -> (Int)?{
    var result: Int?
    switch data {
    case "1", "١", "一", "๑":
        result = 1
    case "2", "٢", "二", "๒":
        result = 2
    case "3", "٣", "三", "๓":
        result = 3
    case "4", "٤", "四", "๔":
        result = 4
    default:
        break
    }
    return result
}

if let someSymbol = translateSymbol("๓"){
    print(someSymbol) // 3
}



func intToString(_ data: Int) -> String{
    let toString = String(data)
    return toString
}

func stringToInt(_ data: String) -> Int{
    if let toInt = Int(data){
        return toInt
    }
    return 0
}

print(intToString(3)) // 3
print(type(of:intToString(3))) // String

print(stringToInt("5")) // 5
print(type(of:stringToInt("5"))) // Int






//------------------------------------------
// Default Parameter Values
//------------------------------------------

/*
    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // If you omit the second argument when calling this function, then
        // the value of parameterWithDefault is 12 inside the function body.
    }
    someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
    someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

*/

func convertStringToUnicode(of text: String = "None") -> [UInt32] {
    var unicodeScalarWord: [UInt32] = []
    for item in text.unicodeScalars{
        unicodeScalarWord.append((item.value))
    }
    return unicodeScalarWord
}
func showUnicodeInArrays(of array: [UInt32] = [0]){
        for item in array{
            print(UnicodeScalar(item)!, terminator:"") 
        }
    print("")
}

let stringForTranslate = convertStringToUnicode(of: "i can change to unicode")
print(stringForTranslate)
// [105, 32, 99, 97, 110, 32, 99, 104, 97, 110, 103, 101, 32, 116, 111, 32, 117, 110, 105, 99, 111, 100, 101]

showUnicodeInArrays(of: stringForTranslate)
// i can change to unicode



var EdenHazard: [String: Any] = [ 
    "Name": "Eden Hazard",
    "Item": [],
    "Level": 1,
    ]

func lvlUP(player: inout [String: Any], upTo: Int = 1){
    if let lvl = player["Level"] as? Int{
        player["Level"] = (lvl + upTo)
    }
}

print(EdenHazard) // ["Name": "Eden Hazard", "Level": 1, "Item": []]
lvlUP(player: &EdenHazard)
print(EdenHazard) // ["Name": "Eden Hazard", "Level": 2, "Item": []]



//------------------------------------------
// Variadic Parameters
//------------------------------------------

/*
สามารถรับค่ามาเป็น series ได้ซึ่งจะต้องเป็น type เดียวกัน
จากตัวอย่างข้างล่าง numbers จะถือว่าเป็น arrays ของ double
โดยแต่ละ function จะมี Variadic parameters ได้เพียงตัวเดียว
ข้อมูลที่ถูกส่งเข้าไปจะเป็น *******constant*******
และไม่สามารถทำ default value ได้

    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    arithmeticMean(1, 2, 3, 4, 5)
    // returns 3.0, which is the arithmetic mean of these five numbers
    arithmeticMean(3, 8.25, 18.75)
    // returns 10.0, which is the arithmetic mean of these three numbers

*/

func helloWithNames(names: String...) {
    guard names.count > 0 else{
        return
    }
    for name in names {
        print("Hello \(name)")
    }
}

helloWithNames(names: "Frank", "Lampard", "Eden")
/*
Hello Frank
Hello Lampard
Hello Eden
*/


func plusOneSeries(from variadic: Int...){
    var data = variadic
    print(type(of:data))
    for index in 0..<data.count{
        data[index] += 1
    }
    print(data)
}

func plusOneSeries(from variadic: [Int]...){
    var data = variadic
    // print(type(of:data)) // Array<Array<Int>>
    // print(data.count) // 2
    // print(data[0]) // [80, 81, 82]
    // print([data[0][0]]) // 80
    for (i) in 0..<data.count{
        for j in 0..<data[i].count{
            data[i][j] += 1
        }
    }
    print(data)
}

plusOneSeries(from: 1, 2, 3)
// [2, 3, 4]

var dataSetForPlusOne = [80, 81, 82]
var dataSetForPlusOne2 = [90, 91, 92]
plusOneSeries(from: dataSetForPlusOne, dataSetForPlusOne2)
// [[81, 82, 83], [91, 92, 93]]


func plusSeries(add: Int, to variadic: Int...){
    var variadic = variadic
    for index in 0..<variadic.count{
        variadic[index] += add
    }
    print(variadic)
}

plusSeries(add: 5, to: 150, 151, 152)
// [155, 156, 157]



func sum(of numbers: [Int]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
func sum(of numbers: Int...) -> Int {
    return sum(of: numbers)
}


let someNumberTuple = [1, 2, 3, 4, 5]
print(someNumberTuple) // [1, 2, 3, 4, 5]
print(sum(of: someNumberTuple)) // 15


print(sum(of: 6, 7, 8, 9, 10)) // 40


func average(of numbers: [Int]) -> Int {
    return sum(of: numbers) / numbers.count
}
func average(of numbers: Int...) -> Int {
    return sum(of: numbers) / numbers.count
}


print(average(of: someNumberTuple)) // 3
print(average(of: 6, 7, 8, 9, 10)) // 8



//------------------------------------------
// In-Out Parameters
//------------------------------------------

    /*
    เวลาทำ In-Out ไม่สามารถกำหนดค่า default value ได้
    */


var cookies = [
    "Chocolate Chip Cookies": 31.6,
    "Butter Cookies": 61.0,
    "Cake Mix Cookies": 23.6,
    "Gingerbread Cookies": 99.99
    ]

func updateCookie(update old: String,for value:Double, in dict: inout [String: Double])
    {
    // guard var dict = dict, dict.keys.contains(old) else{
    //     return 
    // }
    // dict.updateValue(value, forKey: old)
    dict[old] = value
}
updateCookie(update: "Butter Cookies", for: 50.0, in: &cookies)

print(cookies)



var songs: [String: String] = [:]

func addName(_ name: String, to dict: inout [String:String]){
    dict["Name"] = name

}
addName("ハッピーエンド", to: &songs)
print(songs)
// ["Name": "ハッピーエンド"]


func removeCharacter(remove: String, in data: inout String){
    var output = ""
    for item in data{
        if remove.contains(item){
            continue
        }
        output.append(item)
    }    
    data = output
}

func removeCharacter(remove str: String..., in data: inout String){
    var output = ""
    var toRemove = [Character] ()
    for char in str{
        for alphabet in char{
            if toRemove.contains(alphabet){
                continue
            }
            toRemove.append(alphabet)
        }
    }

    for item in data{
        if toRemove.contains(item){
            continue
        }
    output.append(item)
    }   
    
    data = output
}

var AnakinSkyewalker = "Anakin Skywalker"
removeCharacter(remove: "A", in: &AnakinSkyewalker)
print(AnakinSkyewalker)
// nakin Skywalker

var LukeSkywalker = "Luke Skywalker"
removeCharacter(remove: "eww", "u", in: &LukeSkywalker)
print(LukeSkywalker)
// Lk Skyalkr


//------------------------------------------
// Function Types
//------------------------------------------

/*
function สามารถมองเป็น type  type นึงได้


    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

The type of both of these functions is (Int, Int) -> Int. 

    func printHelloWorld() {
        print("hello, world")
    }
() -> Void

*/

//------------------------------------------
// Using Function Types
//------------------------------------------


    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

var mathFunction: (Int, Int) -> Int = addTwoInts

    print("Result: \(mathFunction(2, 3))")
    // Prints "Result: 5"

    mathFunction = multiplyTwoInts
    print("Result: \(mathFunction(2, 3))")
    // Prints "Result: 6"



// สร้างฟังก์ชั่นที่ชื่อเหมือนกันสองตัวอาจทำให้เกิดความกำกวม ต้องใช้ label ที่แตกต่างกันเพื่อแยกฟังก์ชั่น


let studentScores = [50, 60, 70, 80, 90, 20, 10, 5, 6, 4, 8, 7]

func passAtFiftyFive(score: Int) -> Bool{
    return score >= 50
}

func passAtFiftyFive(digit: Int) -> Bool{
    return digit >= 50
}

var scoreGreaterFiftyFive = studentScores.filter(passAtFiftyFive(score:)) // [50, 60, 70, 80, 90]
scoreGreaterFiftyFive = studentScores.filter(passAtFiftyFive(digit:)) // [50, 60, 70, 80, 90]









func starWarsCharacterName(name caster: String) -> String{
    return caster
}

var starWars = starWarsCharacterName
print(starWarsCharacterName(name: "Anakin")) // Anakin
// print(starWarsCharacterName("Anakin")) // *error*
// print(starWars(name: "Obiwan")) // *error*
print(starWars("Obiwan")) // Obiwan

// var starWarsAssignValue = starWarsCharacterName("Eden") // *error*
var starWarsAssignValue = starWarsCharacterName(name: "Eden")
print(type(of:starWarsAssignValue)) // String
print(starWarsAssignValue) // Eden





/*
    // old function
    (inout String, inout String) -> ()

    func swapString(_ left: inout String, _ right: inout String){
        let temp = left
        left = right
        right = temp
    }
*/

var catDogUseFunc = swapString
catDogUseFunc(&cat, &dog)
print(type(of:catDogUseFunc)) // (inout String, inout String) -> ()
print(cat, dog) // dog cat


var catDogAssignFunc = swapString(&cat, &dog)
print(type(of:catDogAssignFunc)) // ()
print(cat, dog) // cat dog


catDogUseFunc(&cat, &dog)
print(cat, dog) // dog cat
// catDogAssignFunc(&cat, &dog) // *error* cannot call value of non-function type '()'






/*
    // old function
    // (Optional<Dictionary<String, Any>>) -> Optional<(name: String, age: Int, money: Double)>

    func displayProfile(dict: [String: Any]?) -> (name: String, age: Int, money: Double)? {
    guard let dict = dict else{
        return nil
    }
    let name = getDictValueUnwrap(get: "Name", in: dict) as! String
    let age = getDictValueUnwrap(get: "Age", in: dict) as! Int
    let money = getDictValueUnwrap(get: "Money", in: dict) as! Double
    return (name, age, money)
}
*/

var useFuncDisplayProfile = displayProfile
print(type(of:useFuncDisplayProfile))
// (Optional<Dictionary<String, Any>>) -> Optional<(name: String, age: Int, money: Double)>

// =========== เรียกใช้ function ปกติ ===========
if let showEmiya = displayProfile(dict: emiya){
    print(showEmiya)
}
// (name: "Emiya Shirou", age: 15, money: 1999.0)

// =========== เรียกใช้ตัวแปรที่เก็บ function ===========
if let showEmiya = useFuncDisplayProfile(emiya){
    print(showEmiya)
}
// (name: "Emiya Shirou", age: 15, money: 1999.0)


// *error* 
// =========== ยังไม่ได้ประกาศตัวแปร useFuncGetDisplayProfile ยังเอามา if let เลยไม่ได้ ===========
// if let showEmiya = useFuncGetDisplayProfile(dict: emiya){ 
//     print(showEmiya)
// }

// หลังประกาศตัวแปร จะมองเหมือนเป็นตัวแปรตัวหนึ่ง
var useFuncGetDisplayProfile = displayProfile(dict: emiya)
if let showEmiya = useFuncGetDisplayProfile{
    print(showEmiya)
}
// (name: "Emiya Shirou", age: 15, money: 1999.0)






// func translateSymbol(_ data: String) -> (Int)?{
let useFuncTranslateSymbol = translateSymbol
if let someSymbol = useFuncTranslateSymbol("๑"){
    print(someSymbol) // 1
}

let useFuncGetTranslateSymbol = translateSymbol("๒")
print(useFuncGetTranslateSymbol) // Optional(2)





// >>>>>>> func lvlUP(player: inout [String: Any], upTo: Int = 1) <<<<<<<
// (inout Dictionary<String, Any>, Int) -> ()

let useFunclvlUp = lvlUP
print(type(of:useFunclvlUp)) // (inout Dictionary<String, Any>, Int) -> ()

// =========== ต้องส่ง argument ไปให้ครบ ถึงแม้จะมีค่า default ===========
// useFunclvlUp(&EdenHazard) // *error*
useFunclvlUp(&EdenHazard, 1) // ใช้ let แต่ตัวแปรอ้างอิง reference จึงเปลี่ยนแปลงค่าได้
print(EdenHazard)
// ["Name": "Eden Hazard", "Level": 3, "Item": []]


let useFunnGetlvlUp = lvlUP(player: &EdenHazard)
print(type(of:useFunnGetlvlUp)) // ()

print(EdenHazard)
// ["Name": "Eden Hazard", "Level": 4, "Item": []]




/*
    // old function
    () -> ()

    func funcHelloWorld() {
    print("Hello World!")
}
*/

let useFuncHelloWorld = funcHelloWorld

// useFuncGetHellloWorld // *error*
print(type(of:useFuncHelloWorld)) // () -> ()
useFuncHelloWorld() // Hello World!

let useFuncGetHellloWorld = funcHelloWorld()
print(type(of:useFuncGetHellloWorld)) // ()
useFuncGetHellloWorld // *Nothing Happen*
// useFuncGetHellloWorld() // *error*





/*
    // old function
    (String) -> ()

    func helloWithNames(names: String...) {
        guard names.count > 0 else{
            return
        }
        for name in names {
            print("Hello \(name)")
        }
}
*/
let useFuncHelloWithNames = helloWithNames
typeOf(useFuncHelloWithNames) // (String) -> ()
useFuncHelloWithNames("Mana", "Malee", "Maima")
/*
Hello Mana
Hello Malee
Hello Maima
*/

/*
    **error** cannot call value of non-function type '()'
var useFuncGetHelloWithNames = helloWithNames()
useFuncGetHelloWithNames(names: "Willian", "Jack", "Mount")
*/

var useFuncGetHelloWithNames = helloWithNames(names: "Willian", "Jack", "Mount")
typeOf(useFuncGetHelloWithNames) // ()
/*
Hello Willian
Hello Jack
Hello Mount
*/



/*  // old function
    () -> Array<String>

    func getUser() -> [String] {
    return ["Adam", "Beetle", "Cert", "Dawn"]
    }
*/

let useFuncUserGet = getUser
print(type(of:useFuncUserGet)) // () -> Array<String>
useFuncUserGet() // *Nothing Happen*
print(useFuncUserGet) // (Function)

let useFuncGetUser = getUser()
print(type(of:useFuncGetUser)) // Array<String>
print(useFuncGetUser) // ["Adam", "Beetle", "Cert", "Dawn"]



/*
    // old function
    // (String, String) -> String


    func plusString(plus: String, with: String) -> String {
        return String(toInt(plus) + toInt(with))
        // หรือ
        // String(toInt(plus) + toInt(with))
    }
*/


let useFuncPlusString = plusString
print(type(of:useFuncPlusString)) // (String, String) -> String
print(useFuncPlusString("3", "5")) // 8

let useFuncGetPlusString = plusString(plus:"8", with:"8")
print(type(of:useFuncGetPlusString)) // String
print(useFuncGetPlusString) // 16



/*
    // function อยู่ด้านล่าง
        // (Double, Double, (Double, Double) -> Double) -> Double

            func calRate(cal: Double,rate: Double,
            to rateFunc: (Double, Double) -> Double) -> Double {


let useFuncCalRate = calRate
print(type(of:(useFuncCalRate))) // (Double, Double, (Double, Double) -> Double) -> Double
print(useFuncCalRate) // (Function)
print(useFuncCalRate(3, 3, elecRate)) // 9.0

let useFuncGetCalRate = calRate(cal: 6, rate: 6, to: elecRate)
print(type(of:useFuncGetCalRate)) // Double
print(useFuncGetCalRate) // 36.0

*/


/*
    // function อยู่ด้านล่าง
        // (String) -> (Double, Double) -> Double
        
        func chooseCalRate(select: String) -> (Double, Double) -> Double{



// ************** by pass function labels **************
let useFuncChooseCalRate = chooseCalRate
print(type(of:useFuncChooseCalRate)) // (String) -> (Double, Double) -> Double
print( (useFuncChooseCalRate("water")(5, 5)) ) // 25.0
let useWater = useFuncChooseCalRate("water")
print(useWater(2, 9)) // 18.0

// ************** by pass function labels **************
let useFuncGetChooseCalRate = chooseCalRate(select: "ELEC")
print(type(of:useFuncGetChooseCalRate)) // (Double, Double) -> Double
print(useFuncGetChooseCalRate(16, 2)) // 32.0


*/





/*
    // function อยู่ด้านล่าง
        (String) -> (Int, Int) -> Int
        
    func operate(symbol: String) -> (Int, Int) -> Int{


// ใช้งาน function
let useFuncOperate = operate
print(type(of:useFuncOperate)) // (String) -> (Int, Int) -> Int
print((useFuncOperate("+")(5, 5))) // 10

let plusUseFuncOperate = useFuncOperate("+")
print(plusUseFuncOperate(150, 150)) // 300


let useFuncGetOperate = operate(symbol: "*")
print(type(of:useFuncGetOperate)) // (Int, Int) -> Int
print(useFuncGetOperate(300, 150)) // 45000



*/





//------------------------------------------
// Function Types as Parameter Types
//------------------------------------------


var Mimi: [String: String] = [ 
    "Name": "Mimi",
    "Level": "1",
    "Atk" : "5",
    "HP" : "5",
    "Move": "3",
    "Exp": "0"
    ]

var monsterChicken: [String: String] = [ 
    "Name": "Chicken",
    "Level": "1",
    "Atk" : "1",
    "HP" : "5"
    ]


func getUserInfo(_ user: [String: String]) -> [String: String] {
    return user
}

func playerAttack(_ getUserFunction:
        (Dictionary<String, String>) -> Dictionary<String, String>,
        player user: inout [String: String], monster: inout [String: String]
        ){

    let move = Int(getUserInfo(user)["Move"]!)!
    var exp = "1"

    if var atk = Int(getUserInfo(user)["Atk"]!){
        if var monsterHp = Int(getUserInfo(monster)["HP"]!){
            for round in 1...move{
                print("Round", round)
                if monsterHp <= 0{
                    print(getUserInfo(monster)["Name"]!, "Dead")
                    user["Exp"] = plusString(plus: user["Exp"]!, with: "20")
                    break
                }else{
                    print("Player '\(getUserInfo(user)["Name"]!)' Attack (\(getUserInfo(monster)["Atk"]!)) to '\(getUserInfo(monster)["Name"]!)' ")
                    monsterHp -= atk
                }
            }
            monster["HP"] = intToString(monsterHp)
        }
    }
}

print(type(of:(getUserInfo)))
// (Optional<Dictionary<String, Any>>) -> Optional<Dictionary<String, Any>>


print(getUserInfo(Mimi))
// ["HP": "5", "Atk": "5", "Move": "3", "Name": "Mimi", "Exp": "0", "Level": "1"]

print(getUserInfo(monsterChicken))
//["HP": "5", "Atk": "1", "Name": "Chicken", "Level": "1"]


playerAttack(getUserInfo, player: &Mimi, monster: &monsterChicken)
/*
Round 1
Player 'Mimi' Attack (1) to 'Chicken' 
Round 2
Chicken Dead
*/


print(Mimi)
// ["HP": "5", "Atk": "5", "Move": "3", "Name": "Mimi", "Exp": "20", "Level": "1"]

print(monsterChicken)
// ["HP": "0", "Atk": "1", "Name": "Chicken", "Level": "1"]





// (Double, Double) -> Double
func waterRate(cal: Double = 0, from: Double = 15) -> Double{
    return (cal * from)
}

// (Double, Double) -> Double
func elecRate(cal: Double = 0, from: Double = 45) -> Double{
    return (cal * from)
}

// (Double, Double, (Double, Double) -> Double) -> Double
func calRate(cal: Double,rate: Double,
        to rateFunc: (Double, Double) -> Double) -> Double {
    let sum = rateFunc(cal, rate)
    // let sum = rateFunc(cal: cal,from: rate) // *error*
    return sum
        
}

print(waterRate(cal: 1)) // 15.0 >>> have default
print(elecRate(cal: 1)) // 45.0 >>> have default
print(calRate(cal: 10, rate: 2,to: waterRate)) // 20.0 <<< default value ไม่ถูกใช้งาน
print(calRate(cal: 10, rate: 3,to: elecRate)) // 30.0 <<< default value ไม่ถูกใช้งาน







//------------------------------------------
// Function Types as Return Types
//------------------------------------------

// ทำ function return เป็น function type

/*
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
    }

    var currentValue = 3
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    // moveNearerToZero now refers to the stepBackward() function
    print("Counting to zero:")
    // Counting to zero:
    while currentValue != 0 {
        print("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
    print("zero!")
    // 3...
    // 2...
    // 1...
    // zero!

*/


func sumAB(a: Int, b: Int) -> Int{ 
  return a + b 
} 
func sumABinFunction(plus a: Int, with b:Int, in mySum: (Int, Int) -> Int) -> Int{
    return mySum(a, b)
}

print(sumAB(a: 1, b: 2)) // 3
print(sumABinFunction(plus:3, with:3,in: sumAB)) // 6


// (String) -> (Double, Double) -> Double
func chooseCalRate(select: String) -> (Double, Double) -> Double{
    switch select{
        case "water", "Water", "WATER":
            return waterRate
        case "elec", "Elec", "ELEC":
            return elecRate
        default:
            return waterRate
    }
}

// ************** by pass function labels **************
let useFuncChooseCalRate = chooseCalRate
print(type(of:useFuncChooseCalRate)) // (String) -> (Double, Double) -> Double
print( (useFuncChooseCalRate("water")(5, 5)) ) // 25.0
let useWater = useFuncChooseCalRate("water")
print(useWater(2, 9)) // 18.0

// ************** by pass function labels **************
let useFuncGetChooseCalRate = chooseCalRate(select: "ELEC")
print(type(of:useFuncGetChooseCalRate)) // (Double, Double) -> Double
print(useFuncGetChooseCalRate(16, 2)) // 32.0






//------------------------------------------
// Nested Functions
//------------------------------------------

/*
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }
    var currentValue = -4
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    // moveNearerToZero now refers to the nested stepForward() function
    while currentValue != 0 {
        print("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
    print("zero!")
    // -4...
    // -3...
    // -2...
    // -1...
    // zero!

*/

func decreaseFunc(digit: Int) -> () -> Int{
    var digit = digit
    func minus() -> Int{
        digit = digit - 1
        return digit
    }
    return minus
}
let decreaseTwo = decreaseFunc(digit: 2)
// () -> Int

print(decreaseTwo()) // 1
print(decreaseTwo()) // 0
print(decreaseFunc(digit: 5)()) // 4
print(decreaseFunc(digit: 5)()) // 4



func operate(symbol: String) -> (Int, Int) -> Int{

    func add(plus: Int, with: Int) -> Int{
        return (plus + with)
    }

    func minus(sub: Int, with: Int) -> Int{
        return (sub - with)
    }

    func multiply(mul: Int, with: Int) -> Int{
        return (mul * with)
    }
    
    func divide(div: Int, with: Int) -> Int{
        return (div / with)
    }

    func modulo(mod: Int, with: Int) -> Int{
        return (mod % with)
    }

    switch symbol{
        case "-":
            return minus
        case "*":
            return multiply
        case "/":
            return divide
        case "%":
            return modulo
        default:
            return add
    }
}


// ใช้งาน function
let useFuncOperate = operate
print(type(of:useFuncOperate)) // (String) -> (Int, Int) -> Int
print((useFuncOperate("+")(5, 5))) // 10

let plusUseFuncOperate = useFuncOperate("+")
print(plusUseFuncOperate(150, 150)) // 300


let useFuncGetOperate = operate(symbol: "*")
print(type(of:useFuncGetOperate)) // (Int, Int) -> Int
print(useFuncGetOperate(300, 150)) // 45000



var life = 0
func getDamage(dmg: Bool){
    func increase(){
        life += 1
    }
    func decrease(){
        life -= 1
    }
    dmg ? decrease() : increase()
}

getDamage(dmg: true)
print(life) // -1


var Yoda: [String: Any] = ["Name": "Yoda", "HP": 10]

func getDamage(player: inout [String: Any],dmg: Bool){
    func increase(){
        player["HP"] = (player["HP"] as! Int + 1)
    }
    func decrease(){
        player["HP"] = (player["HP"] as! Int - 1)
    }
    dmg ? decrease() : increase()
}

getDamage(player: &Yoda, dmg: false)
print("\(Yoda["Name"]!) have hp:\(Yoda["HP"]!)") // Yoda have hp:11



