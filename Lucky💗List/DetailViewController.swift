//
//  DetailViewController.swift
//  Lucky💗List
//
//  Created by babykang on 15/4/24.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    @IBAction func okTapped(sender: AnyObject) {
    
        
        /*在修改cell的内容是。segue会再次保存修改后的内容成为新的cell。
        下面的方法保证修改后，只是原来的cell内容改变，并修改成功，同时不会增加新的cell。*/
        
        if todo == nil{
        let uuid = NSUUID().UUIDString
        todo = TodoModel(id: uuid, title: todoItem.text, date: todoDate.date)
        todos.append(todo!)
        }else{
            todo?.title = todoItem.text
            todo?.date = todoDate.date
        }
    }

    
    var todo : TodoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self
        if todo == nil {
            navigationController?.title = "add new todo"
        }else{
            navigationController?.title = "modify todo"
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        todoItem.resignFirstResponder()
    }

}
