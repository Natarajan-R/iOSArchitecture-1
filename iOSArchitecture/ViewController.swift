//
//  ViewController.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 24/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, SegueHandlerType {

    enum SegueIdentifier: String {
        case MVC
        case MVP
        case MVVMWithoutBinding

    }

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        switch segueIdentifierForSegue(segue) {

            case .MVP:
            routeToMVP(segue.destinationViewController as! MVPTodoListViewController)
        case .MVVMWithoutBinding:
            routeToMVVMWithoutBinding(segue.destinationViewController as! MVVMTodoListViewController)

            default:
                return

        }
    }
}

private extension ViewController
{
    func routeToMVP(todoListViewController:MVPTodoListViewController) {
        let todoList = [MVPTodo]();
        let presenter: MVPTodoListPresentable = MVPTodoListPresenter(view: todoListViewController, todoList: todoList)
        
        todoListViewController.inject(presenter)
    }
    
    func routeToMVVMWithoutBinding(todoListViewController:MVVMTodoListViewController) {
        let todoList = [MVVMTodo]();
        let viewModel: MVVMTodoListViewModel = MVVMTodoListViewModelImpl(view: todoListViewController, todoList: todoList)
        
        todoListViewController.inject(viewModel)
    }
}

