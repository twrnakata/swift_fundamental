//------------------------------------------
// Inheritance
//------------------------------------------

//------------------------------------------
// Defining a Base Class
//------------------------------------------


/*
    class Vehicle {
        var currentSpeed = 0.0
        var description: String {
            return "traveling at \(currentSpeed) miles per hour"
        }
        func makeNoise() {
            // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        }
    }

    let someVehicle = Vehicle()

    print("Vehicle: \(someVehicle.description)")
    // Vehicle: traveling at 0.0 miles per hour


*/


//------------------------------------------
// Subclassing
//------------------------------------------

/*
    class SomeSubclass: SomeSuperclass {
        // subclass definition goes here
    }

    class Bicycle: Vehicle {
        var hasBasket = false
    }

    let bicycle = Bicycle()
    bicycle.hasBasket = true

    bicycle.currentSpeed = 15.0
    print("Bicycle: \(bicycle.description)")
    // Bicycle: traveling at 15.0 miles per hour

    class Tandem: Bicycle {
        var currentNumberOfPassengers = 0
    }

    let tandem = Tandem()
    tandem.hasBasket = true
    tandem.currentNumberOfPassengers = 2
    tandem.currentSpeed = 22.0
    print("Tandem: \(tandem.description)")
    // Tandem: traveling at 22.0 miles per hour


*/




class Animal{
    var name = ""
    private var _eat = ""

    var eat: String{
        get { return self._eat}
        set { self._eat = newValue}
    }

    func eatTo() -> String{
        return "\(name) can eat \(eat)"
    }
}



class Dog: Animal{
    var bark = "Bark! Bark!"
    
    func canDo() -> String{
        return "Dog name \(self.name), \(self.eatTo()) and always make some noise like \(self.bark)"
    }
}

let sammual = Dog()
sammual.name = "Sammual"
sammual.eat = "Banana"
sammual.bark = "oh god, oh god"

print(sammual.canDo())
// Dog name Sammual, Sammual can eat Banana and always make some noise like oh god, oh god


class Puppy: Dog{
    var canWalk = false
}

let sammualJr = Puppy()
sammualJr.name = "The son of Sammual"
sammualJr.eat = "Ant"


print(sammualJr.canDo())
// Dog name The son of Sammual, The son of Sammual can eat Ant and always make some noise like Bark! Bark!

print("=============")





//------------------------------------------
// Overriding
//------------------------------------------

/*
ถ้าอยากจะ override ใส่ keyword override ไว้ข้างหน้า
และ subclass ใช้ super ในการเขาถึง methods, properties, subscripts

    An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.
    An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.
    An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.

*/

//------------------------------------------
// Overriding Methods
//------------------------------------------

class Watercraft{
    var name = ""
    var speed = 10
    var _haveCanvas: Bool = false

    // computed properties
    var haveCanvas: Bool{
        get{ return self._haveCanvas }
        set{ self._haveCanvas = newValue }
    }
    // computed properties
    var cost: Int{
        return 10
    }

    func setSpeed(_ speed: Int){
        self.speed = speed
    }
    func display() -> (){
        print("\(name) have speed: \(speed)")
    }
}

class Boat: Watercraft{

    override func setSpeed(_ speed: Int){
        self.speed = speed * 2
    }
    override func display(){
        print("this boat have speed: \(speed)")
    }
}

let someBoat = Boat()
someBoat.setSpeed(10)
someBoat.display() // this boat have speed: 20



//------------------------------------------
// Overriding Properties
//------------------------------------------

//------------------------------------------
// Overriding Property Getters and Setters
//------------------------------------------

class Player{
    // stored properties
    var rank = 1
    var name = ""

}

class HighLevelPlayer: Player{
    //  cannot override with a stored property
    // override var rank = 2  // *error*

}




class Sailboat: Boat{
    // override computed properties
    override var haveCanvas: Bool{
        get{
            if (super.haveCanvas == true){
                print("this boat have canvas")
                return super.haveCanvas
            }else{
                print("this boat have not canvas yet")
                return super.haveCanvas
            }
        }
        set{
            if newValue == true{
                print("set canvas to this boat")
                super.haveCanvas = newValue
            }else{
                print("remove canvas from this boat")
                super.haveCanvas = newValue
            }
        }
    }
    // override computed properties
    override var cost: Int{
        return 5000
    }
    
}


var mySailBoat = Sailboat()

// call computed properties
print(mySailBoat.haveCanvas) 
/*
this boat have not canvas yet
false
*/

mySailBoat.haveCanvas = true
// set canvas to this boat


print(mySailBoat.haveCanvas)
/*
this boat have canvas
true
*/

print(mySailBoat.cost) // 5000

print("=====")




class Sugar{
    var haveSugar = true
    
    var sugar: String{
        return "\((isSugar) ? "Yes" : "NO")"
    }
    var isSugar: Bool{
        get{ return haveSugar }
        set{ self.haveSugar = newValue }
    }
}

class Candy: Sugar{
    var shape = "Circle"
    var _types = "Chocolate"

    var types: String{
        return "\(self._types) Candy"
    }
}

class Brand{
    var name = "Noname"
}

 // error: multiple inheritance from classes 'Candy' and 'Brand'
// class SugarBear: Candy, Brand{}

class SugarBear: Candy{
    var name = "Sugar Bear"

    override var types: String{
        return super.types + "from \(name) and it \(sugar)"
    }
    override var sugar: String{
        if(super.isSugar){
            return "Full of Sugar"
        }else{
            return "Sugar free!"
        }
    }
}

var someCandy = SugarBear()
print(someCandy.sugar) // Full of Sugar
print(someCandy.types) // Chocolate Candyfrom Sugar Bear and it Full of Sugar


print("=====")




//------------------------------------------
// Overriding Property Observers
//------------------------------------------

class Jedi{
    var position = "Jedi"
    var name = ""
    var level = 1
    var health = 100

    var getDamage: String{
        return "\(name) has taken damage!"
    }
}

class JediMaster: Jedi{
    var masterLevel = 1

    override var position: String{
        didSet{
            print("Position has Change to \(position)")
        }
    }

    override var level: Int{
        didSet{
            if (level % 100 == 0){
                let oldLevel = masterLevel
                masterLevel += 1
                print("Master Level up to \(masterLevel) from \(oldLevel)")
            }else{
                print("level up to \(super.level) from \(oldValue)")
            }
        }
    }

    override var getDamage: String{
        return super.getDamage + " HP: \(self.health)"
    }
}

let yoda = JediMaster()
yoda.name = "Yoda"

yoda.position = "Padawan"
print(yoda.position)
/*
Position has Change to Padawan
Padawan
*/

yoda.level = 80 // level up to 80 from 1
print(yoda.masterLevel) // 1
print(yoda.level) // 80

print("---")
yoda.level = 100 // Master Level up to 2 from 1
print(yoda.masterLevel) // 2
print(yoda.level) // 100

yoda.health = 20
print(yoda.getDamage)
// Yoda has taken damage! HP: 20


//------------------------------------------
// Preventing Overrides
//------------------------------------------

/*
ถ้าไม่อยากให้ใครมา override ให้ใส่ final
(such as final var, final func, final class func, and final subscript).

แต่ถ้าอยากไม่ให้ class ถูก inherit ใช้ (final class)

*/


class Account{
    var username = ""
    private final var password = "123"
    private var money = 100
    var items: [String]?

    var id: String{
        get{ return username }
        set{ self.username = newValue }
    }

    func setPassword(_ pass: String){
        password = pass
    }

    final func viewPassowrd() -> String{
        return self.password
    }

    final subscript(value: Int) -> String?{
        get{
            if let item = items{
                return item[value]
            }
            return nil
        }
    }
}


let najAccount = Account()
najAccount.username = "najOnline"
najAccount.setPassword("naj1234")
print(najAccount.viewPassowrd()) // naj1234

najAccount.items = ["sword", "gun"]
print(najAccount[0]!) // sword


class UserTranscation: Account{
    var transcationNo = "001"
    override var id: String{
        get{
            print("get User: \(super.id) with tranNo. : \(transcationNo)")
            return super.id
        }
        set{
            super.id = newValue
        }
    }

    override func setPassword(_ pass: String){
        print("set password from subclass")
        super.setPassword(pass)
    }

    // override func viewPassowrd() -> String{ // error: instance method overrides a 'final' instance method
    //     return self.password // error: 'password' is inaccessible due to 'private' protection level
    // }

    // override subscript(index: Int) -> String{ // error: subscript overrides a 'final' subscript
    //     return items[index]
    // }
}

let najPayOnline = UserTranscation()
najPayOnline.id = "najBangkok"
print(najPayOnline.id)
/* 
get User: najBangkok with tranNo. : 001
najBangkok
*/

najPayOnline.setPassword("najShop11223") // set password from subclass

// print(najPayOnline.money) // *error* private 
// print(najPayOnline.password) // *error* private final

najPayOnline.items = ["Wallet", "Phone"]
print(najPayOnline.items!) // ["Wallet", "Phone"]
print(najPayOnline[0]) // Optional("Wallet")




final class UserAPIKey: Account{
    private var clientID = "Dd945HHS3hyk2$%"
    
    func getClientID() -> String{
        return self.clientID
    }
}

// class UserApplication: UserAPIKey{}
// error: inheritance from a final class 'UserAPIKey'




//------------------------------------------
// 
//------------------------------------------


