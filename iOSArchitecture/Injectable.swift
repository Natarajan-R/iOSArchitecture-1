//
//  Injectable.swift
//  iOSArchitecture
//
//  Created by jiakai lian on 25/04/2016.
//  Copyright © 2016 jiakai lian. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype T

    func inject(dependencies: T)

    func assertDependencies()
}