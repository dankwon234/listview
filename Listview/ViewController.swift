//
//  ViewController.swift
//  Listview
//
//  Created by Dan Kwon on 4/24/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    var namesArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addName(){
        
        let name = self.nameField.text
        if (name?.characters.count == 0){
            return // nothing entered, ignore
        }
        
        self.namesArray.append(name!)
        self.nameField.text = "" // clear text field
        print("addName: \(self.namesArray)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

