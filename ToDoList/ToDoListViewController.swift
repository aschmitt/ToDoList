//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Andreas Schmitt on 10.04.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import UIKit

//var list = ["Test1" , "test 2"]

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataStorage: ToDo!
    
    init(storage: ToDo) {
        dataStorage = storage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStorage.toDoListArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataStorage.toDoListArray[indexPath.row].name
        return cell
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            dataStorage.toDoListArray.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
        tabBarController?.tabBar.items?[0].badgeValue = "\(dataStorage.count)"
    }

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTableView.accessibilityLabel = "ToDoTable"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

