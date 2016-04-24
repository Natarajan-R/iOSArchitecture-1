//
// Created by jiakai lian on 25/04/2016.
// Copyright (c) 2016 jiakai lian. All rights reserved.
//

import UIKit

protocol SegueHandlerType {
    typealias SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController,
SegueIdentifier.RawValue == String {

    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier,
                                    sender: AnyObject?) {

        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }

    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {

        guard let identifier = segue.identifier,
        segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid segue identifier \(segue.identifier).")
        }

        return segueIdentifier
    }
}