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
                let todoList = [MVPTodo]();
                let viewController: MVPTodoListViewController
                = segue.destinationViewController as! MVPTodoListViewController;
                let presenter: MVPTodoListPresentable = MVPTodoListPresenter(view: viewController, todoList: todoList)

                viewController.inject(presenter)

            default:
                return

        }
    }


}

