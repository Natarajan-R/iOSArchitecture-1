//
//  MVVMTodoListViewController.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 25/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

private extension Selector {
    static let tapOnAddNewTodoBtn = #selector(MVVMTodoListViewController.tapOnAddNewTodoBtn(_:))
}

class MVVMTodoListViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    private var viewModel: MVVMTodoListViewModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        assertDependencies()
        
        configureViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.viewModel!.showTodoList()
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapOnAddNewTodoBtn(button: UIButton) {
        
        self.viewModel!.addNewTodoByTimeStamp(NSDate())
    }
    
    func configureViews() {
        
        let rightBarButtonItem
            = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: .tapOnAddNewTodoBtn)
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

extension MVVMTodoListViewController: MVVMTodoListView {
    func showTodoList() {
        
        self.tableview.dataSource = self.viewModel as? UITableViewDataSource
        self.tableview.reloadData()
    }
}

extension MVVMTodoListViewController: Injectable {
    typealias T = MVVMTodoListViewModel
    
    func inject(dependencies: T) {
        
        self.viewModel = dependencies
    }
    
    func assertDependencies() {
        
        assert(self.viewModel != nil)
    }
}
