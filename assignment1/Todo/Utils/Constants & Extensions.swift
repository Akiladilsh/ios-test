//
//  Constants.swift
//  Todo
//
//  Created by Akila Dilshan on 3/11/20.
//  Copyright © 2020 Abhishek Prajapati. All rights reserved.
//

import Foundation


//Handlers
typealias completionHandler = (_ status: Bool, _ message: String, _ data: [ToDoListModel]?) -> ()

//URL

let baseUrl = "https://halflife-todo-rest-api.herokuapp.com/api/todos"

//Localized Strings

extension String {
    
    static let okHandler = NSLocalizedString("Ok", comment: "")
    static let Error = NSLocalizedString("Error", comment: "")
    static let pleaseWait = NSLocalizedString("Please wait", comment: "")
    
}



