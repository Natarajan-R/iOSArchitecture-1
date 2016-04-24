//
//  MVPTodoListPresenter.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 24/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol MVPTodoListPresentable {

    init(view: MVPTodoListView, todoList: [MVPTodo])

    func showTodoList()
    func addNewTodoByTimeStamp(timeStamp:NSDate)
}

class MVPTodoListPresenter: MVPTodoListPresentable {
    unowned let view: MVPTodoListView
    var todoList: [MVPTodo]


    required init(view: MVPTodoListView, todoList: [MVPTodo]) {
        self.view = view
        self.todoList = todoList
    }
    
    func showTodoList() {
        self.view.showTodoList(self.todoList)
    }

    func addNewTodoByTimeStamp(timeStamp:NSDate) {
        let todo = MVPTodo(timeStamp:timeStamp)

        self.todoList.append(todo)
        self.view.showTodoList(self.todoList)
    }

}