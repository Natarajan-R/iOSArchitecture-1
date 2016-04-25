//
//  MVPTodoListController.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 24/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol MVPTodoListView: class {
    func showTodoList()
}

private extension Selector {
//    static let tapOnAddNewTodoBtn = #selector(MVPTodoListViewController.tapOnAddNewTodoBtn(button: UIButton))
}

class MVPTodoListViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!

//    private var todoList:  [MVPTodo]!
    private var presenter: MVPTodoListPresentable!

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        assertDependencies()

        configureViews()
    }

    override func viewDidAppear(animated: Bool) {

        super.viewDidAppear(animated)

        self.presenter.showTodoList()
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapOnAddNewTodoBtn(button: UIButton) {

        self.presenter.addNewTodoByTimeStamp(NSDate())
    }

    func configureViews() {

        let rightBarButtonItem
        = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("tapOnAddNewTodoBtn:"))

        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

extension MVPTodoListViewController: MVPTodoListView {
    func showTodoList() {

//        self.todoList = todoList
        self.tableview.dataSource = self
        self.tableview.reloadData()
    }
}

extension MVPTodoListViewController: UITableViewDataSource {

    enum CellIdentifier: String {
        case TodoCell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        return self.todoList.count
        return self.presenter.countTodoList()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellIdentifer = CellIdentifier.TodoCell

        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer.rawValue)!
//        cell.textLabel?.text = self.todoList[indexPath.row].timeStamp.description
        cell.textLabel?.text = self.presenter.todoItemTitleByRow(indexPath.row)

        return cell
    }
}

extension MVPTodoListViewController: Injectable {
    typealias T = MVPTodoListPresentable

    func inject(dependencies: T) {

        self.presenter = dependencies
    }

    func assertDependencies() {

        assert(self.presenter != nil)
    }
}
