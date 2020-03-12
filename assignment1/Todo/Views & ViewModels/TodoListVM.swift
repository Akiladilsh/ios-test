//
//  TodoListVM.swift
//  Todo
//
//  Created by Akila Dilshan on 3/11/20.
//  Copyright © 2020 Abhishek Prajapati. All rights reserved.
//

import UIKit


class TodoListVM {
    
    
    //MARK:- Get Request
    
    
    func getToDoList(completion: @escaping completionHandler) {
        
        guard let url = URL(string: baseUrl) else {
            print("Error: cannot create URL")
            return
        }
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(false,error?.localizedDescription ?? "",[])
                return
            }
            guard let data = data else {
                 completion(false,"Error: Did not receive data",[])
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                completion(false,"Error: Did not receive data",[])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([ToDoListModel].self, from: data)
                completion(true,"Successful recived data", response)
            }
            catch {
                completion(false,error.localizedDescription, [])
            }
            
        }.resume()
    }
    
}
