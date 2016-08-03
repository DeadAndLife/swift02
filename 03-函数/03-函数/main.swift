//
//  main.swift
//  03-函数
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 QingYun. All rights reserved.
//

import Foundation

print("Hello, World!")

//C的函数
//int add(int x,int y){}

//swift函数
//func add(x:Int,y:Int) -> Int {}

//无参数无返回值
func sayHello(){
    print("hello!")
}

sayHello()
//swift命名空间:同一个项目下的文件属于同一命名空间,不同文件中的函数可以不用声明直接调用
testFunc()

//无参数有返回值
func getString() -> String {
    return "new string"
}

let str = getString()
print(str)

//无参数多返回值
func maxAndMin() -> (Int,Int) {
    let arr = [-3,11,-4,9]
    
    var max:Int = arr[0]
    var min:Int = arr[0]
    
//    for i in 0..<arr.count {
//        if
//    }
    
    for value in arr[1..<arr.count] {
        if value > max{
            max = value
        }
        if value < min {
            min = value
        }
    }
    
    return (max,min)//元组作为返回值
}

let (max,min) = maxAndMin()
print("最大值:\(max),最小值:\(min)")

//带参数的函数
//参数的外部名:调用时要用
//参数的局部名:函数定义内部使用
//默认第一个参数不需要外部名,后面的参数外部名和局部名相同
//类似OC风格: initWithName: andAge:
func add(x:Int,y:Int){
    print("\(x) + \(y) = \(x+y)")
}

add(3, y: 5)

func mul(x:Int,_ y:Int){ //_可以忽略外部名
    print("\(x) * \(y) = \(x*y)")
}
mul(3, 5)

func travel(from start:String,to stop:String){ //自定义外部名
    print("从\(start)到\(stop)旅行")
}

travel(from: "郑州", to: "三亚")


//参数默认值
//带默认值的参数一般写在最后一个
func eatForLunch(food:String = "面条"){
    print("中午吃\(food)")
}

eatForLunch()
eatForLunch("盖浇饭")

//可变参数:参数数量不确定,但是类型
//同时有默认值参数和可变参数时,可变参数写在最后
func eatLunchAtCompany(persons:String...) {
    //函数内部,可变参数按数组处理
    print("今天在公司吃饭的人有\(persons.count)个:")
    for person in persons {
        print(person)
    }
}

eatLunchAtCompany()
eatLunchAtCompany("隔壁老王","尤老师")

//常量参数和变量参数:
//默认函数参数都是常量参数,即在函数定义内部只能读不能写
func RMBFromDollor(money:Float) -> Float {
    let rmb = money * 6.48
    //money *= 6.48
    return rmb
}
let dollor:Float = 100
let rmb = RMBFromDollor(dollor)
print(rmb)

//变量参数:只是在函数内部可以改变,对外不可见
func RMBFromDollor1(var money:Float) -> Float {
    money *= 6.48
    return money
}
let rmb1 = RMBFromDollor1(dollor)
print(rmb1)
print(dollor)

//输入输出参数:inout,类似于C的函数参数传入变量的地址,修改对外可见

var a = 5
var b = 7
func swap(inout x:Int,inout y:Int){
    let temp = x
    x = y
    y = temp
}

swap(&a,&b)
print("a=\(a),b=\(b)")


//函数作为类型: (参数类型) -> 返回值类型
//1.定义变量:类似C的函数指针
var calcFunc:(Int,Int)->() // ->Void也行
calcFunc = add
calcFunc(5,6)
calcFunc = mul
calcFunc(5,6)

//2.作为参数类型:用于回调
func callback(calcFunc:(Int,Int)->Void) {
    calcFunc(8,9)
}

callback(add)

//3.作为返回值类型
func makeFunc(amount:Int) -> (Int)->Int { //外围函数
    
    //嵌套函数:写在别的函数定义内部的函数,默认只能在当前函数内调用
    func addBy(num:Int) -> Int{ //局部功能封装
        return num+amount
    }
    //addOne(5)
    
    return addBy //嵌套函数只有被外围函数返回,才可以在外面使用
}

let newFunc = makeFunc(1)

print(newFunc(6))

let newFunc2 = makeFunc(5)
print(newFunc2(6))

//addOne(5)