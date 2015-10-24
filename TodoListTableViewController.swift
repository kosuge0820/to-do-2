//
//  TodoListTableViewController.swift
//  to do 2
//
//  Created by kosuge satoshi on 2015/10/20.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    let todoCollection = TodoCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoCollection.fetchTodos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//          print(self.todoCollection.todos)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "新規作成", style: UIBarButtonItemStyle.Plain, target:self , action: "newTodo")
    self.tableView.reloadData()
        
    self.navigationItem.leftBarButtonItem = editButtonItem()
        
    }
    
    func newTodo(){
    self.performSegueWithIdentifier("presentNewTodoCotroller", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.todoCollection.todos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "reuseIdentifier")
        let todo = self.todoCollection.todos[indexPath.row]
        
        cell.textLabel?.text = todo.title
        cell.textLabel?.font = UIFont(name: "HirakakuProN-W3", size: 15)
        cell.detailTextLabel?.text = todo.descript
        let priorityIcon = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        priorityIcon.layer.cornerRadius = 6
        priorityIcon.backgroundColor = todo.priority.color()
        cell.accessoryView = priorityIcon
         return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.todoCollection.todos.removeAtIndex(indexPath.row)
            self.todoCollection.save()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Middle)
        } else if editingStyle == .Insert {
            
        }
    }
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = self.todoCollection.todos[sourceIndexPath.row]
        self.todoCollection.todos.removeAtIndex(sourceIndexPath.row)
        self.todoCollection.todos.insert(todo, atIndex: destinationIndexPath.row)
        self.todoCollection.save()
    }
}

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

*/
