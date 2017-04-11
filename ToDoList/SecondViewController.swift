//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Andreas Schmitt on 10.04.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        if let toDoText = input.text {
            if input.text != "" {
                list.append(toDoText)
                input.text = ""
                input.placeholder = "New ToDo please"
                tabBarController?.tabBar.items?[0].badgeValue = "\(list.count)"
            } else {
                let alert = UIAlertController(title: "Hey", message: "This is  one Alert", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Working!!", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.input.delegate = self;
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
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

