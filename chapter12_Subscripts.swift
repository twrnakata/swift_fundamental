//------------------------------------------
// Subscripts
//------------------------------------------


//------------------------------------------
// Subscript Syntax
//------------------------------------------

/*
    subscript(index: Int) -> Int {
        get {
            // Return an appropriate subscript value here.
        }
        set(newValue) {
            // Perform a suitable setting action here.
        }
    }

    struct TimesTable {
        let multiplier: Int
        subscript(index: Int) -> Int {
            return multiplier * index
        }
    }
    let threeTimesTable = TimesTable(multiplier: 3)
    print("six times three is \(threeTimesTable[6])")
    // Prints "six times three is 18"

*/

//------------------------------------------
// Subscript Usage
//------------------------------------------


/*
subscript จะมี parameter กี่ตัวก็ได้(overloading) และเป็น type อะไรก็ได้ return ค่าอะไรก็ได้
แต่ไม่สามารถใช้ inout parameter ได้ รวมถึงไม่สามารถกำหนดค่า default ให้กับ parameter ได้
*/


//------------------------------------------
// Subscript Options
//------------------------------------------

/*
    struct Matrix {
        let rows: Int, columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            grid = Array(repeating: 0.0, count: rows * columns)
        }
        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }

*/




enum Week: Int{
    case sunday = 0, monday, tuesday, wednesday, thursday, friday, saturday

    subscript(_ index: Int) -> Week {
        get{
            let index = Week(rawValue: index)!
            return index
        }
    }
    /*
    subscript(_ index: Int) -> String {
        switch self{
            case .sunday where self.rawValue == index:
                return "Sunday"
            default:
                return "other day"
        }
    }
    */

}

var myWeek = Week.sunday
print(myWeek[3])  // wenesday




struct WeekStruct{
    private var days = ["Sunday", "Monday", "Tuesday",
                        "Wednesday", "Thursday", "Friday", "Saturday"]

    subscript(index: Int) -> String{
        get{
            guard index < (days.count - 1), index >= 0 else { return "out of range"}
            return days[index]
    
        }
        set{
            if (index >= 0) &&  (index < days.count){
                days[index] = newValue

            }else{
                print("out of range insert at index[0]")
                days[0] = newValue
            }
        }
    }
}


var myWeekStruct = WeekStruct()
print(myWeekStruct[2]) // Tuesday
myWeekStruct[3] = "Newday"
print(myWeekStruct[3]) // Newday
myWeekStruct[9] = "someday" // out of range insert at index[0]
print(myWeekStruct[0]) // someday



struct ArraySubscript{
    var list: [String] = []
    subscript(index: Int) -> String{
        get{
            guard !list.isEmpty else { return "[No-Data]"}

            return list[index]
        }
        set{
            guard !list.isEmpty else { return }
            list[index] = newValue
        }
    }
    mutating func setArray(_ value: String...){
        list = value
    }
}


var myArraySubscript = ArraySubscript()
print(myArraySubscript) // ArraySubscript(list: [])
print(myArraySubscript[0]) // [No-Data]
myArraySubscript[0] = "1"
print(myArraySubscript[0]) // [No-Data]

myArraySubscript.setArray("1", "2", "3")
print(myArraySubscript[0]) // 1
print(myArraySubscript) // ArraySubscript(list: ["1", "2", "3"])


/*
struct SubscriptWithOptional{
    var list: [String]?  = ["1", "2", "3"]
    subscript(index: Int) -> String?{
        get{
            if let list = list{
                return list[index]
            }else{
                return nil
            }
        }
        set{
            if let newValue = newValue{
                list?[index] = newValue
            }
        }
    }
    mutating func setOptionalArray(_ value: String...){
        list = value
    }
}


var mySubOptional = SubscriptWithOptional()
print(mySubOptional) // SubscriptWithOptional(list: Optional(["1", "2", "3"]))
print(mySubOptional[0]) // Optional("1")
mySubOptional[0] = "A"
print(mySubOptional) // SubscriptWithOptional(list: Optional(["A", "2", "3"]))
print(mySubOptional[0]) // Optional("A")

mySubOptional.setOptionalArray("B", "C", "D", "E")
print(mySubOptional) // SubscriptWithOptional(list: Optional(["B", "C", "D", "E"]))
*/



class SubscriptReturnAny{
    var list: [Any] = [
    "String", 126, ["a", "b"],
    (foods: "Burger", value: 120), ["key": "value"]
    ]
    
    subscript(index: Int) -> Any{
        return list[index]
    }
}

var mySubscriptReturnAny = SubscriptReturnAny()
print(mySubscriptReturnAny[0]) // String
print(mySubscriptReturnAny[2]) // ["a", "b"]
print(mySubscriptReturnAny[3]) // (foods: "Burger", value: 120)
print(mySubscriptReturnAny[4]) // ["key": "value"]



/*

class SubscriptReturnArray {
    var list = [
        [1, 2],
        [3, 4]
        ]
    
    subscript(index: Int) -> [Int]? {
        get {
            return (index >= list.startIndex && index < list.endIndex) ? list[index] : nil
        }
        set {
            guard let newValue = newValue else{ return }
            list[index] = newValue
            // list.insert(newValue, at: index)
        }
    }
}

var mySubscriptReturnArray = SubscriptReturnArray()

print(mySubscriptReturnArray[0]) // Optional([1, 2])
print(type(of:mySubscriptReturnArray[0])) // Optional<Array<Int>>
print(mySubscriptReturnArray[1]![1]) // 4
print(type(of:mySubscriptReturnArray[1]![1])) // Int

// แก้ไขค่า
print(mySubscriptReturnArray[0]!) // [1, 2]
mySubscriptReturnArray[0]![1] = 90
print(mySubscriptReturnArray[0]!) // [1, 90]
print(mySubscriptReturnArray[0]![1]) // 90

print("---")
print(mySubscriptReturnArray[1]!) // [3, 4]
print(mySubscriptReturnArray[1]![1]) // 4
// กำหนดค่าใหม่ให้มีเพียง 1 element
mySubscriptReturnArray[1] = [120, 121]
print(mySubscriptReturnArray[1]) // Optional([120, 121])
print(mySubscriptReturnArray[1]![1]) // 121


// ลองกำหนดค่าให้ตัวแปรที่มี element เพิ่มอีก 1 ช่อง
mySubscriptReturnArray[1]![1] = 999
print(mySubscriptReturnArray[1]![1]) // 999

// mySubscriptReturnArray[2] = [200, 201] // Index out of range

// แก้ไขตัวแปรใหม่ ให้เก็บ 3 element
mySubscriptReturnArray[1] = [120, 121, 123] 
print(mySubscriptReturnArray[1]) // [120, 121, 123] 

*/

print("---")




class SubscriptReturnArrayWithAppend{
    var list = [
        [0, 1],
        [2, 3]
        ]

    subscript(index: Int) -> [Int]{
        get{
            //  (index >= list.startIndex && index < list.endIndex) ? list[index] : nil
            if list.indices.contains(index){
                return list[index]
            }else{
                print("out of range: return first index")
                return list[0]
            }
        }set{
            if index >= list.startIndex && index < list.endIndex {
                list[index] = newValue
            }else{
                // list.insert(newValue, at: list.endIndex)
                list.append(newValue)
            }
        }
    }
}

var mySubcriptAppend = SubscriptReturnArrayWithAppend()

print(mySubcriptAppend[0])
mySubcriptAppend[2] = [100]
print(mySubcriptAppend[2]) // [100]
print(mySubcriptAppend[3])
/*
out of range: return first index
[0, 1]
*/
// print(mySubcriptAppend[2][1]) // error: Index out of range

print("==============")



class Subscript1DArrayReturnInt{
    var list = [1, 2, 3]{                
        didSet {
            print("success")
        }
    }

    subscript(index: Int) -> Int?{
        get{
            return (index >= list.startIndex && index < list.endIndex) ? list[index] : nil
        }
        set{
            guard (index >= list.startIndex && index < list.endIndex) else{ return }
            
            list[index] = newValue!
            
        }
    }
}


var my1DArray = Subscript1DArrayReturnInt()

// แสดงค่า
print(my1DArray[0]) // Optional(1)
print(my1DArray[-1]) // nil
print(my1DArray[99]) // nil

// assign value
my1DArray[-1] = -1
my1DArray[0] = 700 // success
print(my1DArray[0]) // Optional(700)

my1DArray[99] = 99
my1DArray[1] = 101 // sccess
print(my1DArray[1]!) // 101

print("============")


struct Subscript2DArrayReturnInt{
    var list = [
        [0, 1],
        [1, 3],
        [4, 5]
    ]

    subscript(col: Int, row: Int) -> Int?{
        get{
            guard (col >= 0 && col < (list.count)),
            (row >= 0 && row < (list[col].count)) else { return nil }

            return list[col][row]
        }
        set(value){
            guard (col >= 0 && col < (list.count)),
            (row >= 0 && row < (list[col].count)) else { return }

            if let value = value{
                list[col][row] = value
            }
        }
    }
}


var mySubcript2D = Subscript2DArrayReturnInt()

print(mySubcript2D[0, 1]) // Optional(1)
print(mySubcript2D[2, 1]) // Optional(5)
print(mySubcript2D[2, 2]) // nil

// assign value
print(mySubcript2D[2, 0]) // Optional(4)
mySubcript2D[2, 0] = 99
print(mySubcript2D[2, 0]) // Optional(99)

// assign เกิน range
mySubcript2D[2, 3] = 66
print(mySubcript2D[2, 3]) // nil


print("=============")

/*

class FruitBasket {
    enum Fruit {
        case Coconut
        case Apple
        case Banana
    }
    
    var basket: [Fruit : Int] = [:]

    subscript(fruit: Fruit) -> Int?{
        get{
            return basket[fruit]
        }
        set(price){
            let price = price ?? 0
            guard price > 0 else { return }
            basket[fruit] = price
        }
    }
}

let priceOfFruitBasket = FruitBasket()
priceOfFruitBasket[.Apple] = 99
print(priceOfFruitBasket[.Apple]) // Optional(99)
print(priceOfFruitBasket[.Coconut]) // nil
priceOfFruitBasket[.Coconut] = -50
print(priceOfFruitBasket[.Coconut]) // nil



struct StructDictionaryWithSubscript{
    var dict: [String: String] = [:]

    subscript(key: String) -> String{
        get{
            if let description = self.dict[key]{
                return description
            }
            return "no data"
        }
        set{
            dict[key] = newValue
        }
    }
}


var someDict = StructDictionaryWithSubscript()
someDict["Mango"] = "The mango fruit is roughly oval in shape, with uneven sides."
print(someDict["Mango"])
// The mango fruit is roughly oval in shape, with uneven sides.
print(someDict["Mangos"]) // no data

someDict["Mangos"] = "Some desc"
print(someDict["Mangos"]) // some desc


print("======")


struct StructDictionaryReturnDictionary{
    var dict: [String: [String: Int]] = [:]

    subscript(key: String) -> [String: Int]{
        get{
            if let dict = dict[key]{
                return dict
            }
            return [:]
        }
        set{
            dict[key] = newValue
        }
    }
}


var myDictionary = StructDictionaryReturnDictionary()

myDictionary["Apple"] = ["one of the most widely cultivated tree fruits": 120]

print(myDictionary["Apples"]) // [:]
print(myDictionary["Apple"]) // ["one of the most widely cultivated tree fruits": 120]
print(myDictionary["Apple"]["one of the most widely cultivated tree fruits"]) // Optional(120)


*/



print("=============")


//------------------------------------------
// Type Subscripts
//------------------------------------------

/*
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        static subscript(n: Int) -> Planet {
            return Planet(rawValue: n)!
        }
    }
    let mars = Planet[4]
    print(mars)

*/


struct RGB {
  static var colors = ["🔴", "🟢", "🔵"]
  
  static subscript(index: Int) -> String {
    return colors[index]
  }
}


print(RGB[1]) // 🟢



struct Addtion{
    static subscript (a: Int, b: Int) -> Int{
        get{
            return a + b
        }
    }
}

print(Addtion[20, 50]) // 70


struct Factorial{
    static subscript(n: Int) -> Int{
            var result = 1
            if n > 0{
                for value in 1...n{
                    result *= value
                }
            }
            return result
    }
}


print(Factorial[5]) // 120



//------------------------------------------
// 
//------------------------------------------


