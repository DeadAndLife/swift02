
//
//  main.swift
//  01-字符串数组字典
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 QingYun. All rights reserved.
//

import Foundation

print("Hello, World!")

//swift区分两种数据类型:值类型和引用类型
//值类型:赋值时会生成副本,之后原变量和副本之间修改互不影响
//引用类型:赋值时不会生成副本,只是他们引用同一个实例,通过任意一个修改的都是同一块内存.
//类是引用类型.其他的Int/Float/Bool/String/Array/Dictionary/struct/enum等都是值类型

//swift和OC类型对比:
//1.
//OC的字符串NSString/NSMutableString 引用
//OC的数组NSArray/NSMutableArray 引用
//OC的字典NSDictionary/NSMutableDictionary 引用

//Swift字符串 String 数组 Array 字典 Dictionary 都是值类型

//2. swift数组和字典可以存放任何类型,不一定放对象


//String
let str = "string"
let str1:NSString = "string"
let str2 = str1.stringByAppendingString("123")

let mStr1:NSMutableString = "mstr"
mStr1.appendString("123")
print("mStr1:\(mStr1)")

//字面量: "xxx"
//空字符串:
let emptyStr = " "
let emptyStr1 = String()
print(emptyStr1)

//拼接:+ +=
let longStr = str + "hello"
var vStr = "123"
vStr += "456"

//可变性通过var和let区分,let只能赋值一次

//字符串插值 \()
let int = 5
let hello5 = "hello,\(int)"
print("hello,\(int)")

//判断相等: == !=
if str == str1 {
    print("str 和 str1相等")
}

//截取 : 
//1.纯swift截取
let index = longStr.startIndex.advancedBy(3)
let subStr1 = longStr.substringFromIndex(index)
print(longStr)
print(subStr1)

let index1 = longStr.endIndex.advancedBy(-3)
let subStr2 = longStr.substringToIndex(index1)
print(subStr2)

let range = Range(start: index, end: index1)
let subStr3 = longStr.substringWithRange(range)
print(subStr3)

//2.转换为NSString再截取
let subStr11 = (longStr as NSString).substringFromIndex(5)
print(subStr11)

let subStr33 = (longStr as NSString).substringWithRange(NSMakeRange(3, 5))
print(subStr33)

//前缀后缀
let file = "zidian.swift"
if file.hasSuffix("swift") {
    print("文件名后缀为swift")
}

//遍历
for char in "你好".characters {
    print(">>>>\(char)")
}



//数组Array
let ocArr:NSArray = ["123",NSObject(),12]
let ocMArr:NSMutableArray = NSMutableArray(array: ocArr)
ocMArr.addObject("555")
print(ocMArr)

//数组表示: Array<类型> ,简洁版: [类型]
let intArr = Array<Int>()
let intArr1 = [Int]()

//字面量构造
let intArr2 = [1,2,3,4,5]
let strArr = ["1","2"]

//带默认值的数组
let floatArr:[Float] = Array(count: 5, repeatedValue: 3.14)
print(floatArr)

//数组相加:必须同类型,相加就是拼接
let floatArr1:[Float] = [2.5,3.6]
var newArr = floatArr1 + floatArr
print(newArr)


//属性:count / isEmpty(count == 0)
print(newArr.count)

if newArr.isEmpty {
    print("数组为空")
}

//追加元素append +=
newArr.append(4.454)

newArr += [3.4,1.1]
print(newArr)

//下标操作:支持多下标
newArr[0] = 1.11
newArr[0...1] = [2.2,3.3]//下标个数和元素个数相等,对应修改
print(newArr)

newArr[0...3] = [1111,222] //下标多于元素,则修改并删除
print(newArr)

newArr[0...1] = [11,2,33,44,55] //下标少于元素,则修改并添加
print(newArr)

//插入和删除
newArr.insert(3333, atIndex: 0)
newArr.removeAtIndex(0)

//遍历
//只遍历元素
for float in newArr {
    print(">>>>\(float)")
}

//同时遍历索引和元素
for (index,value) in newArr.enumerate() {
    print("\(index)>>>>\(value)")
}

//字符串和数组相互转化
let names = ["zhangsan","lisi","wangwu"]
let namesStr = names.joinWithSeparator("-")
print(namesStr)

let arr = namesStr.componentsSeparatedByString("lisi")
print(arr)


//字典: Dictionary<key类型,value类型> 简洁版: [key类型:value类型]

//构造器创建
let dict = Dictionary<String,Int>()
let dict1 = [String:Int]()
let dict2 = [:]

//字面量创建
var person = ["name":"zhangsan","age":20]

print(person.count)


//下标访问
let age = person["age"]! //读,返回值是可选类型
print(age)

//写访问
person["age"] = 21 //键存在,则修改
print(person)

person["school"] = "青云" //键不存在,则添加
print(person)

person["school"] = nil //键存在时,置为nil,则删除
print(person)

//通过方法添加或者删除
person.updateValue("qingyun", forKey: "school")//键存在则修改,不存在则添加
if let removedValue = person.removeValueForKey("school") {
    print("\(removedValue) 被删除")
} else {
    print("你要删除的键值对不存在")
}

//遍历
for (key,value) in person {//遍历键值对
    print("\(key)>>>\(value)")
}

for key in person.keys {//单独遍历键或者值 (.values)
    print(key)
}


//keys/values构造数组
let keys = Array(person.keys)
print(keys)

let values = Array(person.values)
print(values)