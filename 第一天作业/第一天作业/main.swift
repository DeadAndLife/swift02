//
//  main.swift
//  第一天作业
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 QingYun. All rights reserved.
//

import Foundation

print("Hello, World!")

//第一题
//if

func hireIf(person:[String:Int]){
    if let age = person["age"]{//有年龄信息
        if age >= 18 {//年满18
            if let workExperience = person["workExperience"]{
                print("年满18,且有工作经验,录取")
                print(workExperience)
            } else {
                print("没有工作经验,不好意思")
            }
        }else{
            print("年龄不够18")
        }
    } else {
        print("简历上没有年龄")
    }
}

//hireIf([:])
//hireIf(["age":17])
//hireIf(["age":18])
//hireIf(["age":19,"workExperience":1])
//

func hireGuard(person:[String:Int]){
    guard let age = person["age"] else {
        print("简历上没有年龄")
        return
    }
    
    guard age >= 18 else{
        print("年龄不够18")
        return
    }
    
    guard let workExperience = person["workExperience"] else{
        print("没有工作经验,不好意思")
        return
    }
    
    print("年满18,且有工作经验,录取")
}


hireGuard([:])
hireGuard(["age":17])
hireGuard(["age":18])
hireGuard(["age":19,"workExperience":1])

//