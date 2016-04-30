//
//  MVPTodoListPresenter.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 24/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol MVPTodoListPresenter {

    init(view: MVPTodoListView, todoList: MVPTodoList)

    func showTodoList()

    func addNewTodoByTimeStamp(timeStamp: NSDate)

    func countTodoList() -> Int
    func todoItemTitleByRow(row: Int) -> String
}

class MVPTodoListPresenterImpl: NSObject, MVPTodoListPresenter {
    weak var view: MVPTodoListView?
    let todoList: MVPTodoList


    required init(view: MVPTodoListView, todoList: MVPTodoList) {
        self.view = view
        self.todoList = todoList
    }

    func showTodoList() {

        self.view?.showTodoList()
    }

    func addNewTodoByTimeStamp(timeStamp: NSDate) {

        self.todoList.addNewTodoByTimeStamp(timeStamp)
        self.view?.showTodoList()
    }

    func countTodoList() -> Int {

        return self.todoList.count()
    }

    func todoItemTitleByRow(row: Int) -> String {

        return self.todoList.todoAtIndex(row).timeStamp.description
    }


}

extension MVPTodoListPresenterImpl:UITableViewDataSource
{
    enum CellIdentifier: String {
        case TodoCell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifer = CellIdentifier.TodoCell

        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer.rawValue)!
        cell.textLabel?.text = self.todoList.todoAtIndex(indexPath.row).timeStamp.description

        return cell
    }
}
