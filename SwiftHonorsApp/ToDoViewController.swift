//
//  ToDoViewController.swift
//  SwiftHonorsApp
//
//  Created by John Calderaio on 10/17/16.
//  Copyright © 2016 John Calderaio. All rights reserved.
//

import UIKit

var toDoList = [String]()

class ToDoViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {

    
    //  These functions are for the addition of new items
    
    
    @IBAction func addItem(_ sender: AnyObject) {
        if item.text != nil {
            
            //  Add item to array
            toDoList.append(item.text!)
            
            //  Add item to user defaults
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            item.text = ""
           
            //  Reload the View
            loadView()
            
            
        
        }
    }
    
    
    @IBOutlet var item: UITextField!
    
    @IBOutlet var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //****  ADD IN EVERY APP FOR KERYBOARD!
        self.item.delegate = self
        
        // If a toDoList was stored from a previous session, this restores that session
        if UserDefaults.standard.object(forKey: "toDoList") != nil {
            toDoList = UserDefaults.standard.object(forKey: "toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //****  ADD IN EVERY APP FOR KERYBOARD!
    //Close the keyboard when touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //****  ADD IN EVERY APP FOR KERYBOARD!
    //********Add this function to close keyboard when user presses return
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }
    
    
    
    
    //  These functions are for the Table View
    
    
    //Returns the amount of rows to be in tableview. Std Tableview function
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count   //Returns the exact count of how many items are in the array
    }
    
    //Returns the exact row in repeat. Like ng-repeat
    open func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]   //Returns the index of our toDoList array
        return cell
    }
    
    //Swipe left to permanently delete item in table AND array
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        //print("before: \(toDoList.count)")
        //print(toDoList)
        if editingStyle == .delete {
            toDoList.remove(at: indexPath.row)
            
            //Delete item from array
            UserDefaults.standard.set(toDoList, forKey: "toDoList")
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
}
