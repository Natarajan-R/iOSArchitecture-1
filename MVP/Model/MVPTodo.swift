//
//  MVPTodo.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 24/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import Foundation

struct MVPTodo {
    let timeStamp: NSDate!

    init(timeStamp: NSDate) {
        self.timeStamp = timeStamp
    }
}

class MVPTodoList {
    private var list: [MVPTodo] = [MVPTodo]()

    func addNewTodoByTimeStamp(timeStamp: NSDate) {

        let newTodo = MVPTodo(timeStamp: timeStamp)
        list.append(newTodo)
    }

    func count() -> Int {
        return list.count
    }

    func todoAtIndex(index:Int) -> MVPTodo
    {
        return list[index]
    }
}
