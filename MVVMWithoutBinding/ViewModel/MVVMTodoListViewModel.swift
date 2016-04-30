//
//  MVVMTodoListViewModel.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 25/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol MVVMTodoListViewModel {

    init(todoList: MVVMTodoList)

    func countOfTodoList() -> Int

    func addNewTodoByTimeStamp(timeStamp: NSDate)

    func configureTableCell(tableViewCell: UITableViewCell, indexPath: NSIndexPath)
}

class MVVMTodoListViewModelImpl: NSObject, MVVMTodoListViewModel {
    var todoList: MVVMTodoList

    required init(todoList: MVVMTodoList) {
        self.todoList = todoList
    }

    func countOfTodoList() -> Int {

        return self.todoList.count()
    }

    func addNewTodoByTimeStamp(timeStamp: NSDate) {

        self.todoList.addNewTodoByTimeStamp(timeStamp)
    }

    func configureTableCell(tableViewCell: UITableViewCell, indexPath: NSIndexPath) {

        tableViewCell.textLabel?.text = self.todoList.todoAtIndex(indexPath.row).timeStamp.description
    }
}