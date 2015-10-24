//
//  NewTodoViewController.swift
//  to do 2
//
//  Created by kosuge satoshi on 2015/10/21.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit

class NewTodoViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var todoField: UITextField!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var todofeld: UISegmentedControl!
    
    let todocollection = TodoCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "保存", style:UIBarButtonItemStyle.Plain , target:self , action: "save")
        
        
    descriptionView.layer.cornerRadius = 5
    descriptionView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).CGColor
    descriptionView.layer.borderWidth = 1
    let tapRecognizer = UITapGestureRecognizer(target: self, action: "tapGesture:" )
    self.view.addGestureRecognizer(tapRecognizer)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        todoField.resignFirstResponder()
        return true
    }
    
    func save(){
        if todoField.text!.isEmpty{
            let alertView = UIAlertController(title: "エラー", message: "todoが表示されていません", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: nil))
             self.presentViewController(alertView, animated: true, completion: nil)
        } else {
            let todo = Todo()
            todo.title = todoField.text!
            todo.descript = descriptionView.text
            todo.priority = TodoPrioty(rawValue: todofeld.selectedSegmentIndex)!
            self.todocollection.addTodoCollection(todo)
            print(self.todocollection.todos)
            self.dismissViewControllerAnimated(true, completion:nil )
           
    }
}
    func close(){
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapGesture(sender:UITapGestureRecognizer){
    todoField.resignFirstResponder()
    descriptionView.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
