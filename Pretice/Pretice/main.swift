//
//  main.swift
//  Pretice
//
//  Created by 薛乔木 on 16/1/23.
//  Copyright © 2016年 lanou.3g. All rights reserved.
//

import Foundation

print("Hello, World!")
//定义一个结构体
struct Book {
    var kind : String
    var number : Int
    func printProperty()->Void{
        
    }
}

//定义一个类
class Fruit {
    var name : String = "木瓜"
    func printProperty()->Void{
        print("name = \(name)")
    }
}

var fruit = Fruit()
print("fruit.name = \(fruit.name)")

/*
属性按功能来分，分为存储属性和计算属性 
按调用方法对象来分，分为属性和实例属性

*/

//定义一个机构体
struct Animal {
    //存储属性
    var name : String
    var height : Int = 100
    //计算属性
    var age : Int {
        //newValue 赋值时的那份值 计算属性的set方法中不能给当前否则会递归，但是你可以给其他属性赋值
        set{
            print("...\(newValue)")
            name = String(newValue)
        }
        get{
            return 10
        }
    }
}
var dog : Animal = Animal(name: "大黄", height: 888)
print(dog.name)
print(dog.height)
print(dog.age)
dog.age = 200


struct Car {
    var jeep :String
    var price : Int
    var cuntry : String{
        set{
            print("、\(newValue)")
//            cuntry = String(newValue)
        }
        get{
            return "吉普"
        }
    }
}

var car : Car = Car(jeep: "大众", price: 888)
print(car.cuntry)
print(car.price)
print(car.jeep)
car.cuntry = "德国"

//定义一个类，定义存储属性和计算属性
class Person {
    //定义属性
    var name : String = "放假"
    var age : Int = 88
    var niceName : String {
        set{
//        name = String(newValue)
            name = newValue;
}
        get{
            return "导服费"
        }
    }
    
}
var women : Person = Person()
print(women.name)
print(women.age)
print(women.niceName)

//只读属性
class Plane {
    
    var name : String = "波音"
    //只读属性
    var speed : Int {
        get {
            return 9999
        }
    }
    //只读属性，简单写法
    var voice : String {
        return "无声"
    }
}
var 飞机:Plane = Plane()
print(飞机.speed)
print(飞机.name)
print(飞机.voice)

//只读属性不能赋值


//延迟属性
class Bird {
//使用关键字lazy关键字，什么时候用什么时候创建
    lazy var name : String = "飞鸟"

}
var bird = Bird()
print(bird.name)

//属性观察器
class Zoombie {
    //存储属性
    var  name : String = "僵尸王"
    var bobay : String = "向日葵"{
    //值将要发生改变的时候调用
        willSet{
            print("\(newValue)")
            name = newValue;
        }
        //已经设置过的时候调用，出事化不调用
        //oldValue 设置过的旧值
        didSet{
            print("\(oldValue)")
        }
}
}

var zoombie = Zoombie()
print(zoombie.name)
print(zoombie.bobay)
zoombie.bobay = "变化了"

class Cloth {
    var color : String = "黑色"
    var price : Int = 888 {
        willSet{
            print("新值 ---：\(newValue)")
        }
        didSet{
            print("旧值 ： ————:\(oldValue)")
        }
    }
}
var cloth = Cloth()
print(cloth.color)
print(cloth.price)
cloth.price = 6666666


//结构体中的类属性
struct Teacher {
    
    var name : String = "治哥"
    static var height : Int {
        set{
            print("\(newValue)")
        }
        get{
            return 33
        }
    }
    //结构体中的雷属性static修饰，可以存储属性，也可以计算属性
    static var age : Int {
        set {
            print("ooo\(newValue)")
        }
        get{
            return 77
        }
    }
}
var teacher :Teacher = Teacher()
print(teacher.name)
print("\(Teacher.age)")
Teacher.age = 99
print("---|\(Teacher.height)")
Teacher.height = 80000

//类中类的属性
class Carr {
    var name : String = "凯迪拉克"
    //类中的类属性class修饰，只能修饰计算属性，不能修饰存储属性
    var weihght : String = "100000000kg"
    class var color : String {
        set{
            print("\(newValue)")
        }
        get{
            return "紫色"
        }
    }
}
var carr = Carr()
print("name : \(carr.name)")
//类中的类属性调用，类名.属性名
print("color:\(Carr.color)")

/*
方法，根据调用对象的不同，分为实例方法和类方法

*/

//结构体的方法

struct Robot {
    var name : String!
    //实例方法，要想在实例方法中改变属性的名字，必须加mutaing关键字修饰，这个方法称为变异方法
    mutating func eatFood(){
        print("小黄人")
        name = "大黄蜂"
    }
    //类方法，结构体中用static修饰
    static func run(){
        print("kajdffd")
    }
}
var robot = Robot()
robot.eatFood()
//类方法由就结构体名调用
print(robot.name)
Robot.run()

//类中的方法//
//类中的方法用class

class man {
    func dafeiji(){
        print("手速")
        
    }
    class func cheerUp() {
        print("足浴")
    }
}
var 老王 = man()
老王.dafeiji()
man.cheerUp()

/*
继承
结构体中不能继承，只有类才可以继承，在类中，如果一个类没有父类。那么他就是基类（超类）继承基类的类时子类
*/
class 沙滩{
    var name : String = "毛啊"
    var weight : Int = 999
    //计算属性
    var age : Int{
        set{
print("\(newValue)")
}
get{
return 99
}
    }
    final func caiShatan(){
        print("晒太阳")
    }
}

class 海水:沙滩 {
    //新增一个属性
    var diret : String = "沙子"
    //实例方法，加一个final关键字代表着该方法不允许子类重写
    /*
    final 关键字的作用
    1.用在方法前面修饰，代表着该方法不允许子类重写，但是可以继承
    2.用在计算属性前面，代表属性不允许被子类重写
    3.用在类前面修饰，不允许被继承
    */
    //重写父类的计算属性，存储属性不可被子类重写，计算属性可以
    override var age : Int{
        set{
print("\(newValue)")
}
        get{
            return 88
        }
    }
}

var 叶子 = 海水()
叶子.name = "sdfk"
叶子.caiShatan()


class Monkey {
    /*
    定义类时，属性必须制定初始值
    1、指定一个默认值
    2.声明属性为可选类型
    3.创建构造方法，使用构造方法时，必须保证类中的每个属性都是有值的
    */
    var age : Int
    var name : String!
    var address : String?
    //构造方法
    init(Age : Int, name : String, address: String){
        age = Age;
        //若果参数名字和属性名相同，可以使用self.属性名 = 参数名赋值
        self.address = address;
        self.name = name;
    }
    func eat(){
        print("及贷款纠纷")
    }
}
var 情天大圣 = Monkey(Age: 878787, name: "猴哥", address: "东海")
print(情天大圣.age)
print(情天大圣.name)
情天大圣.eat()


//Swift内存管理
//Swift内存管理使用ARC机制，当对象不存在时候，就会调用deinit方法小灰空间，但是Swift中的引用机制不同OC，当有一个指针指向该空间的时候，为了避免内存泄露，，该内存空间不会被是释放，当没有指针指向的时候才会释放该空间

class HULUWA {
    var name : String!
    var color : String!
    //解析方法（相当于OC中dealloc）
    deinit{
        print("释放")
    }
}
var 大娃 : HULUWA? = HULUWA()//只有可选内容才可以为nil
var 二娃 : HULUWA? = 大娃
大娃 = nil
二娃 = nil

/*
函数 
函数声明 ： func 函数名 （参数1，参数2）->返回值类型{}

函数调用：函数名（参数。。。）
*/
func 寒素名 (number1 : Int ,number2 : Int)->Int{
    //函数体
    return 99999
}
//无参数无返回值的函数
func hasNotResultAndParameters()->Void{
    print("啊哈")
    
}
//函数调用
寒素名(2, number2: 9)
print("\(寒素名(2, number2: 9))")
var reslut = hasNotResultAndParameters()
print(reslut)


//无参数有返回值的函数
func hasNotParameters()->NSString{
    return "你好"
}
//寒素调用
var Res = hasNotParameters()
print(Res)

//有参数无返回值的函数 如果没有返回值，->Void可以不写
func hasNotResult(number : Int ) ->Void{
    print("nunber = \(number)")
}
//函数调用
hasNotResult(10)
func haveluch(number2 :Int){
    print("number = \(number2)")
}
//有参数有返回值的函数
func hasResultAndParameters(number3 : Int)->Int{
    return number3
}

func add(numberOne : Int,numberTwo :Int){
    print(numberOne + numberTwo)
}
//函数注意事项，函数默认的let类型，若想进行改变加var关键字
func modifyFunction(var numbe : Int)->Void{
    
    numbe++
}
//函数若想改变实参，必须按使用inout（输入输出）关键字
var a = 5
var b = 6
//交换函数
func change(inout a : Int ,inout b : Int){
    let c = a
    a = b
    b = c
}

change(&a, b: &b)
print("a = \(a),b = \(b)")
//返回值是元组
func hasgroupResultFunation(value1 :String ,value2 : String) ->(String,String){
    return (value1 + "好帅",value2 + "好美")
}

var reslutq = hasgroupResultFunation("男人", value2: "女人")
print(reslutq)

//外部参数，在参数前加一个标签
func eatFoodFunction(FoodType foodType :String,foodPrice :Int,foodAddress : String)->Void{
    print("foodtype = \(foodType),foodprice = \(foodPrice)")
}
//函数调用
eatFoodFunction(FoodType:"牛肉面", foodPrice: 8, foodAddress: "莲花街")
print("\(eatFoodFunction)")
//函数类型
func addFunction(number11 : Int,number222 :Int)->Int{
    return number11 + number222
}
var 芒果 = addFunction
var resss = 芒果(11, number222: 99)
    print("ress = \(resss)")
var 相加函数 = addFunction
相加函数(1,number222:2)
//函数的高级使用
//函数作为参数

func 参数(funType:(Int , Int) ->Int)->Void{
    let RES = funType(5,6)
    print("RES = \(RES)")
}
//函数调用
参数(addFunction)

func stringFunction(value1 : String, value : String) ->String{
    return value1 + value
}

//函数作为返回值

func can() -> (String,String)->String{
    return stringFunction
    
}
var resFunction = can()
var UU = resFunction("NI","lol")
print(UU)

//函数嵌套
func containerFunction(number : Int) ->Void{
    //加法函数
    func 加法(var number1 : Int)->Void{
        number1++
        print("number1 = \(number1)")
    }
    //减法函数
    func 减法(var number1 :Int) ->Void{
        number1--
        print("number  = \(number1)")
    }
    number > 10 ? 减法(number) : 加法(number)
}

//函数调用
/*
1.枚举值的首字母一般大写
2.枚举值的声明格式：enum枚举名 ： 类型
3.与oc中不同，需要使用case



*/

enum PlayerStatus : Int {
    case MddiaPlayStatusPlaying
    case MdediaPlayStatusPause
    case MdediaPlayStatusStop
    case MediaPlayStatusError
}

//
var enumValue = PlayerStatus.MddiaPlayStatusPlaying.hashValue
print("**\(enumValue)")
enum FromWhere : String{
    case north = "北方"
    case south = "南方"
    case west = "西方"
    case east = "东方"
}
var enumValue2 = FromWhere.south.rawValue
print("000\(enumValue2)")

//结构体和类
/*
声明一个类要使用class关键字

*/

class Peson {
    var name : String = "狗蛋"
    func printName() ->Void{
        print("name = \(name)")
    }
}
//实例化一个类
var person1 = Peson()
print("person.name  = \(person1.name)")
//给属性赋值
person1.name = "就将计就计"
//实例方法
person1.printName()





