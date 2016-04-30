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
    static let tapOnAddNewTodoBtn = #selector(MVPTodoListViewController.tapOnAddNewTodoBtn(_:))
}

class MVPTodoListViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!

    private var presenter: MVPTodoListPresenter!

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
        = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: .tapOnAddNewTodoBtn)

        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

extension MVPTodoListViewController: MVPTodoListView {
    func showTodoList() {

        self.tableview.dataSource = self.presenter as? UITableViewDataSource
        self.tableview.reloadData()
    }
}

extension MVPTodoListViewController: Injectable {
    typealias T = MVPTodoListPresenter

    func inject(dependencies: T) {

        self.presenter = dependencies
    }

    func assertDependencies() {

        assert(self.presenter != nil)
    }
}
