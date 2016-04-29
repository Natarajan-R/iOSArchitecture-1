//
//  MVPTodoListPresenter.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 24/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol MVPTodoListPresenter {

    init(view: MVPTodoListView, todoList: [MVPTodo])

    func showTodoList()

    func addNewTodoByTimeStamp(timeStamp: NSDate)

    func countTodoList() -> Int
    func todoItemTitleByRow(row: Int) -> String
}

class MVPTodoListPresenterImpl: MVPTodoListPresenter {
    weak var view: MVPTodoListView?
    var todoList: [MVPTodo]


    required init(view: MVPTodoListView, todoList: [MVPTodo]) {
        self.view = view
        self.todoList = todoList
    }

    func showTodoList() {

        self.view?.showTodoList()
    }

    func addNewTodoByTimeStamp(timeStamp: NSDate) {

        let todo = MVPTodo(timeStamp: timeStamp)

        self.todoList.append(todo)
        self.view?.showTodoList()
    }

    func countTodoList() -> Int {

        return self.todoList.count
    }

    func todoItemTitleByRow(row: Int) -> String {

        return self.todoList[row].timeStamp.description
    }


}
