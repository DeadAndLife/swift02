//
//  main.swift
//  02-枚举和结构体
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 QingYun. All rights reserved.
//

import Foundation

print("Hello, World!")

//枚举

//C OC的枚举
//enum weekday{Mon,Tue,Wed,...}
//NS_ENUM

//swift 枚举
//1. 每个枚举成员都有一个case
//enum Weekday {
//    case Mon
//    case Tue
//    case Wed
//    case Thu
//    case Fri
//    case Sat
//    case Sun
//}

//2. case 后面的枚举成员使用,隔开
enum Weekday{
    case Mon,Tue,Wed,Thu,Fri,Sat,Sun
}

//声明变量
var day = Weekday.Fri

var day1:Weekday
day1 = .Mon //如果类型确定,赋值时可以直接使用 .枚举成员

switch day {
case .Mon:
    print("周一")
case .Tue:
    print("周二")
case .Sat,.Sun://多模式匹配
    print("周末")
default://如果枚举的各个成员都使用case匹配过,那么default分支不需要
    print("其他")
    //break
}

//关联值:额外保存枚举成员的信息
enum Person{
    case Teacher
    case Student(Int) //Int就是关联值类型
}

let person = Person.Teacher
let student = Person.Student(160301)
let student1 = Person.Student(160310)

switch student1 {
case .Teacher:
    print("老师")
case .Student(let stuNo):
    print("学生,学号为:\(stuNo)")
}


//原始值: 枚举成员的预填充值
enum ControlCharacter:Character {//原始值类型Character
    case Tab = "\t"
    case Linefeed = "\n"
    case Return = "\r"
}

//原始值类型为Int的枚举,原始值默认为从0开始的整数
enum Direction:Int {
    case Up,Down,Left,Right
}
//原始值类型为String的枚举,原始值默认为枚举成员的名称
enum Season:String {
    case Spring,Summer,Autumn,Winter="win" //Spring的原始值是"Spring"
}

//有原始值的枚举类型会自动获得一个构造器,参数为rawValue

let dir = Direction.Up
let dir1 = Direction(rawValue: 2)
print(dir1!)

let season = Season(rawValue: "win")
print(season)

let returnChar = ControlCharacter(rawValue: "\r")
print(returnChar)




//结构体
//C OC的结构体
//struct student{
//    char name[10];
//    int age;
//}

//swift结构体
struct Student {
//    var name = "某某"
//    var age = 18
    var name:String = "moumou" //称为属性,一般不再叫做成员
    var age:Int = 18
}

let stu = Student() //使用默认构造器创建实例
print(stu.name)
print(stu.age)

//逐一成员构造器:参数中有所有的属性
let stu1 = Student(name: "zhangsan", age: 20)
print(stu1.name)
print(stu1.age)

//自定义构造器存在时,默认构造器和逐一成员构造器不可用
struct Point {
    var x:Int //变量属性
    let y:Int //常量属性:只有构造过程中才可以赋值
    
    init(){
        x = 0
        y = 0
    }
    init(x:Int){
        self.x = x
        y = 10
    }
}

var point = Point()
let point1 = Point(x: 5)
print(point1)

//访问属性
print(point.x)
//point.y = 20 //因为结构体是值类型,所以要想改变它的属性,其自身必须是var,且此属性也必须是变量
print(point.y)

//OC不支持直接设置类的结构体的属性的子属性
//let btnFrame = btn.frame
//btnFrame.origin.x = 10
//btn.frame = btnFrame

class Frame {
    var origin = Point()
}

let frame = Frame()
frame.origin.x = 2 //swift支持直接设置类的结构体属性的子属性


var p = point
p.x = 11
print("point:\(point.x)") //p的x修改并不会影响point.x,所以结构体是值类型

let frame1 = frame
frame1.origin.x = 222
print(frame.origin.x) //类是引用类型,frame1和frame指向同一块内存


//恒等运算符: === !== ,用于判断两个引用是不是引用的同一个实例
if frame === frame1 {
    print("frame和frame1引用同一个实例")
}

//if p === point {
//    
//}

//结构体和类的选择
//数据量小且不需要继承,考虑结构体,比如点/范围这些
//数据比较复杂,需要有继承关系时,需要使用类
