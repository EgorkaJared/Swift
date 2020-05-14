//
//  main.swift
//  L!_Nenastev_Bank
//
//  Created by Егор Ненастьев on 30.04.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

print("Данная программа вычисляет изменения на банковском в кладе за период")
func variable (name:String) -> Double
{
    print("Введите", name)
    let inPut: String? = readLine()
    while inPut == nil
    {
    print("Введены не коректные данные, положительное введите число. Введите",name)
    let _: String? = readLine()
    }
    var num:Double? = Double(inPut!)
    while ((num == nil) || (num! < 0))
    {
        print("Введены не коректные данные, положительное введите число. Введите",name)
        num = Double(readLine()!)
    }
    return(num!)
}

var sum:Double = variable(name: "сумму вклада")
let procent:Double = variable(name: "процент")
let time:Double = variable(name: "срок в месяцах")
let year:Double = time/12;

print("Вкалад, суммой",sum," на ",String(format:"%.2f",year),"лет, c годовой ставкой",procent,"%.")

for  i in stride(from: 0, to: year, by: 1.0)
{
   
    if (i+1 < year)
    {
        sum = sum + sum*procent/100
        print("После" ,(i+1),"-ого года,сумма процентов за период",String(format: "%.3f",sum*procent/100),"сумма вкалда на конец периода",String(format: "%.3f",sum))
    }
    else
    {
        if (year == i)
        {
            break
        }
        else
        {
        sum = sum + (year - i)*sum*procent/100
            print("Сумма процентов за крайний период",String(format: "%.3f",(year - i)*sum*procent/100),"размер вклада на конец периода",String(format: "%.3f",sum))
        }
        }
    }



