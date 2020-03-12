//
//  ViewController.swift
//  assignment 2
//
//  Created by Half Life.
//  Copyright © 2020 Half Life Private Limited. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    //MARK:- Variables
    
    var itemArray:[ToDoListModel] = []
    var vm = TodoListVM()
    
    
    //MARK:- Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNevigation()
        getToDoList()
     
     
    }
    
    //MARK:- Functions
    
    func setupNevigation() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    // MARK: - Actions
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user clicks add item in alert box
//            self.itemArray.append(textField.text ?? "New Item")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Todo"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}



extension TodoListViewController {
    
    // MARK: - Tableview data source methods
    
    // returns number of items to display in table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // returns each cell in the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].text
        return cell
    }
    
    // MARK: - Tableview delegate methods
    
    // when user selects the cell in the table view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // add check mark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // deselect the cell. When we click there is a grey selected color which tells the cell is selected but it does not go away after selecting. This will make it go away.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension TodoListViewController {
    
    func getToDoList() {
        
        Utill.shared.showIndicator(vc: self)
        
        vm.getToDoList { (status, message, data) in
            if status {
                Utill.shared.hideIndicator(vc: self)
                for i in data! {
                    self.itemArray.append(i)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{
                Utill.shared.showAlert(vc: self, title: .Error, message: message)
            }
        }
    }
}
