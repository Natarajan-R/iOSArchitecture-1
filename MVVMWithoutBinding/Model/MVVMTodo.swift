//
//  MVVMTodo.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 25/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import Foundation

struct MVVMTodo {
    let timeStamp: NSDate!

    init(timeStamp: NSDate) {
        self.timeStamp = timeStamp
    }
}

class MVVMTodoList {
    private var list: [MVVMTodo] = [MVVMTodo]()

    func addNewTodoByTimeStamp(timeStamp: NSDate) {

        let newTodo = MVVMTodo(timeStamp: timeStamp)
        list.append(newTodo)
    }

    func count() -> Int {
        return list.count
    }

    func todoAtIndex(index:Int) -> MVVMTodo
    {
        return list[index]
    }
}