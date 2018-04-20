//
//  ViewController.swift
//  Todoey
//
//  Created by Linh Doan on 4/19/18.
//  Copyright © 2018 Linh Doan. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "ego"
        itemArray.append(newItem)
        
        let newItem3 = Item()
        newItem.title = "gggfg"
        itemArray.append(newItem)
     
        if let items = defaults.array(forKey: "ToDoListArray") as? [Items] {
            itemArray = items
        }
    }

     //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //ternary operator
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        //fill cells
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        //return cells
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
       
        //add a checkmark if tapped on cell Checkmark is an accessory in attributes inspector
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        //fade animation
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK - Add new Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user cklicks the add item button on UIAlert
            
            
            let newItem = Item()
            newItem = textfield.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textfield = alertTextField
            print(alertTextField.text)
        }
        //add an action to the alert
        alert.addAction(action)
        //present the alert
        present(alert, animated: true, completion: nil)
        
    }
    

}

