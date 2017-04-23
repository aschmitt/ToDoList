//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Andreas Schmitt on 10.04.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var todoField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    var dataStorage: ToDo!
    
    init(storage: ToDo) {
        dataStorage = storage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addItem(_ sender: Any) {
        if let toDoText = todoField.text {
            if todoField.text != "" {
                //ToDo: Fix forece unwrap
                let item = ToDoItem(name: toDoText, description: descriptionField.text!)
                dataStorage.toDoListArray.append(item)
                todoField.text = ""
                todoField.placeholder = "New ToDo please"
                tabBarController?.tabBar.items?[0].badgeValue = "\(dataStorage.toDoListArray.count)"
            } else {
                let alert = UIAlertController(title: "Hey", message: "I need at least a ToDo...", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok!!", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.todoField.delegate = self;
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateToDoViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func dismissKeyboard() {
         view.endEditing(true)
    }
}

