//
//  ViewController.swift
//  Lucky💗List
//
//  Created by babykang on 15/4/24.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

var todos:[TodoModel] = []

/*func dateFromString(dateStr:String) -> NSDate?{
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    
    return date
}
*/

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    //uitableviewdelegate 进行删除之类的操作。
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       todos = [TodoModel(id: "1", title: "1. go shopping", date: dateFromString("2015-12-12")!),
                TodoModel(id: "2", title: "2. sleeping", date: dateFromString("2015-02-12")!),
                TodoModel(id: "3", title: "3. watch tv", date: dateFromString("2015-04-12")!),
                TodoModel(id: "3", title: "4. meet friend", date: dateFromString("2015-07-12")!)]
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todos.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell") as UITableViewCell
        
        var todo = todos[indexPath.row] as TodoModel
        var title = cell.viewWithTag(100) as UILabel
        var date = cell.viewWithTag(101) as UILabel
        
        title.text = todo.title
    
        //time
       let local = NSLocale.currentLocale()
       let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: local)
        
       let dateFormatter = NSDateFormatter()
         dateFormatter.dateFormat = dateFormat
          date.text = dateFormatter.stringFromDate(todo.date)
        
        return cell
    }
    
    //delete cell
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    //edit mode segue of close
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: true)
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        println("close")
        tableView.reloadData()
    }
    //用segue传值
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditTodo"{
            var vc = segue.destinationViewController as DetailViewController
            var indexPath = tableView.indexPathForSelectedRow()
            if let index = indexPath{
                vc.todo = todos[index.row]
            }
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

