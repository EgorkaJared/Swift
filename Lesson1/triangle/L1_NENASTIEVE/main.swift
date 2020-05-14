//
//  main.swift
//  L1_NENASTIEVE
//
//  Created by Егор Ненастьев on 27.04.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

func cathetus (name : String) -> Double
{
    print("Введите длину катета",name)
    let inPut: String? = readLine()
    while inPut == nil
    {
    print("Введены не коректные данные, положительное введите число. Введите длину катета",name)
    let _: String? = readLine()
    }
    var cathetus:Double? = Double(inPut!)
    while (cathetus == nil || cathetus! <= Double(0))
    {
    print("Введены не коректные данные, длина катета",name,"должна быть числом большн 0")
    cathetus = Double(readLine()!)
    }
    return(cathetus!)
}

let a: Double = cathetus(name: "a")
let b: Double = cathetus(name: "b")


print("катет а = ",a)
print("катет b = ",b)

let c: Double = sqrt(pow(a,2)+pow(b,2))//pow возведение в степень
let P: Double = b+a+c
let S: Double = a*b/2
let Гипотенуза: String = String(format: "%.2f", sqrt(pow(a,2)+pow(b,2)))//прикольно что на русском задаются переменные

print("Гипотенуза = ",Гипотенуза)
print("Периметр = ",String(format: "%.2f", P))// перевод числа в строку и округление
print("Площадь = ",String(format: "%.2f", S))




