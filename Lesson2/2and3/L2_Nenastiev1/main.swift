//
//  main.swift
//  L2_Nenastiev(2/3)
//
//  Created by Егор Ненастьев on 30.04.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//
// Для меня это первое знакомство со свифтом, да и с прогромированием в целом(кроме основ  JS, не судите строго

import Foundation


print("Данная программа создает последовательный возрастающий массив до введеннго числа с шагом 1, затем перебираетего его и удаляет все числа кратные 2 и 3")

func variable (name:String) -> Int //функция проверки введеное положительное целое число
{
    print("Введите", name)
    var num:Int? = Int(readLine()!)
    while ((num == nil) || (num! <= 0))
    {
        print("Введены не коректные данные,",name)
        num = Int(readLine()!)
    }
    return(num!)
}

func check(a:Int, del:Int) -> Bool //функция проверки кратности
{
   
    if (a % del == 0)
    {
        return(true)
       // print("Число",a,"Делиться без остатка на",del)
    }
    else
    {
        return(false)
       // print("Число",a,"Не делиться без остатка на",del)
    }
    
}

func remove(arr:[Int]) // функция удаление кратных чисел из массива
{
    var mas:[Int] = arr
    print("Начальны массив")
    print(mas)
    for i in mas
    {
        var ch:Bool = check(a:i,del:2)
        if ch == true
        {
       // print(i)
            let k = mas.firstIndex(of:i)
                if k != nil
                {
                    mas.remove(at:k!)
                }
        }
     ch = check(a:i,del:3)
        if ch == true
        {
      // print(i)
            let k = mas.firstIndex(of:i)
                if k != nil
                {
                    mas.remove(at:k!)
                }
        }
    }
 print("Новый массив")
 print(mas)
}

//var a:Int = variable(name: "целое число")
//check(a:a,del:2)
//check(a:a,del:3)

var numbers = Array(1...variable(name: "Введите желаемую динну массива"))

remove(arr:numbers)

// нашел альтернативный вариант удаление по условию
var numbers2 = Array(1...variable(name: "Введите желаемую динну массива"))
print("Начальный масив")
print(numbers2)
numbers2.removeAll(where: {(($0 % 2 == 0)||($0 % 3 == 0)) })
print("Новый масив")
print(numbers2)

//а можно создать изначально массив без кратных 2 и3
var numbers3 = Array(1...variable(name: "Введите желаемую динну массива")).filter {(($0 % 2 != 0) && ($0 % 3 != 0))}
print(numbers3)
