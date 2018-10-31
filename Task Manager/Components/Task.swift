//
//  Task.swift
//  Task Manager
//
//  Created by Jamie Cummings on 10/30/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation
import RealmSwift

class Game: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var taskDescription: String = ""
    @objc dynamic var completebyDate: Date? = nil
    @objc dynamic var complete: Bool = true
    @objc dynamic var priortyLevel: String = ""
}

