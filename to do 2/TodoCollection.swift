//
//  TodoCollection.swift
//  to do 2
//
//  Created by kosuge satoshi on 2015/10/21.
//  Copyright © 2015年 kosuge satoshi. All rights reserved.
//

import UIKit

class TodoCollection: NSObject {
    static let sharedInstance = TodoCollection()
    var todos:[Todo] = []
    
    func fetchTodos(){
        let defauls = NSUserDefaults.standardUserDefaults()
        if let todoList = defauls.objectForKey("todoList") as? Array<Dictionary<String,AnyObject>>{
            for todoDic in todoList{
                let todo = TodoCollection.convertTodoModel(todoDic)
                self.todos.append(todo)
            }
        }
    }
    
    func addTodoCollection(todo:Todo){
        self.todos.append(todo)
        self.save()
    }
    
    func save(){
        var todoList: Array<Dictionary<String,AnyObject>> = []
        for todo in todos{
        var todoDic = TodoCollection.convertDictionary(todo)
            todoList.append(todoDic)
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(todoList, forKey: "todoList")
    }
    
    class func convertDictionary(todo:Todo)->Dictionary<String,AnyObject>{
        var dic = Dictionary<String,AnyObject>()
        dic["title"] = todo.title
        dic["descript"] = todo.descript
        dic["priority"] = todo.priority.rawValue
        return dic
    }
    
    class func convertTodoModel(attiributes: Dictionary<String,AnyObject>)-> Todo{
        let todo = Todo()
        todo.title = attiributes["title"] as! String
        todo.descript = attiributes["descript"] as! String
        todo.priority = TodoPrioty(rawValue: attiributes["priority"]as! Int)!
        return todo
    }
    
    }
    

