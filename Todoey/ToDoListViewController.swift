//
//  ViewController.swift
//  Todoey
//
//  Created by Linh Doan on 4/19/18.
//  Copyright © 2018 Linh Doan. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray = ["find mike", "buy egos", "Destroy demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

     //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //fill cells
        cell.textLabel?.text = itemArray[indexPath.row]
        
        //return cells
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
       
        //add a checkmark if tapped on cell Checkmark is an accessory in attributes inspector
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        //fade animation
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

