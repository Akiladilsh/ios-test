//
//  ToDoList Model.swift
//  Todo
//
//  Created by Akila Dilshan on 3/11/20.
//  Copyright © 2020 Abhishek Prajapati. All rights reserved.
//

import Foundation

struct ToDoListModel: Codable {
    
    let id: Int
    let text: String
    let done: Bool
}
