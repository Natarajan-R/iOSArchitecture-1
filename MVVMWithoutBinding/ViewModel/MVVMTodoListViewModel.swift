//
//  MVVMTodoListViewModel.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 25/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol MVVMTodoListViewModel {

    init(view: MVVMTodoListView, todoList: MVVMTodoList)

    func showTodoList()

    func addNewTodoByTimeStamp(timeStamp: NSDate)
}

class MVVMTodoListViewModelImpl: NSObject, MVVMTodoListViewModel {
    unowned let view: MVVMTodoListView
    var todoList: MVVMTodoList

    required init(view: MVVMTodoListView, todoList: MVVMTodoList) {
        self.view = view
        self.todoList = todoList
    }

    func showTodoList() {

        self.view.showTodoList()
    }

    func addNewTodoByTimeStamp(timeStamp: NSDate) {
        self.todoList.addNewTodoByTimeStamp(timeStamp)
        self.view.showTodoList()
    }
}

extension MVVMTodoListViewModelImpl:UITableViewDataSource
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
