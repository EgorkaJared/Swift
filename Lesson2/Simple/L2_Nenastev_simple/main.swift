//
//  main.swift
//  L2_Nenastev_simple
//
//  Created by Егор Ненастьев on 02.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

print("Программа выводит, на экран задонное количество простых чисел")//не рекомендую вводить больше 500, придется ждать, не понимаю как ускорить

func variable (name:String) -> Int //функция проверки введеное положительное целое число
{
    print(name)
    //let inPut: String? = readLine()
    //while inPut == nil
    //{
    //print("Введены не коректные данные, положительное введите число. Введите",name)
    //let _: String? = readLine()
    //}
    var num:Int? = Int(readLine()!)
    while ((num == nil) || (num! <= 0))
    {
        print("Введены не коректные данные,",name)
        num = Int(readLine()!)
    }
    return(num!)
}


var masSimple = [2]
var i:Int = 0
var lastSimple:Int = 2
var lot:Int = variable(name:"Сколько простых числе вывести на экран?")
var masAll = Array(3...lot*lot)
    while masSimple.count<Int(lot)
    {
        if masAll.isEmpty == false
        {
            if  masSimple.last != nil
            {
                if masAll[i] % (masSimple.last)! != 0
                {
                    masAll.removeAll(where:{$0 % lastSimple == 0})
                    masSimple .append((masAll.first)!)
                    lastSimple = (masAll.first)!
                    i = i + 1
                    print(masSimple .count)//строчка добавлена чтобы видеть выполнение программы, а то иногда можно подумать что упала
                }
            }
        }
    }
print("Массив из",lot,"простых чисел")
print(masSimple)
