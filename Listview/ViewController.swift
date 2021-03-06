//
//  ViewController.swift
//  Listview
//
//  Created by Dan Kwon on 4/24/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var imagesScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    var namesArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let action = #selector(ViewController.showListView(_:))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next",
                                                                 style: .Plain,
                                                                 target: self,
                                                                 action: action)
        
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.nameField.delegate = self
        
        
        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstSlide.backgroundColor = UIColor.blueColor()
        self.imagesScroll.addSubview(firstSlide)
        
        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondSlide.backgroundColor = UIColor.greenColor()
        self.imagesScroll.addSubview(secondSlide)

        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        thirdSlide.backgroundColor = UIColor.orangeColor()
        self.imagesScroll.addSubview(thirdSlide)

        self.imagesScroll.contentSize = CGSize(width: 600, height: 0)
        self.imagesScroll.delegate = self
    }
    
    func showListView(btn: UIBarButtonItem){
        print("showListView")
        
        let listView = ListViewController()
        listView.namesArray = self.namesArray
        self.navigationController?.pushViewController(listView, animated: true)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x

        if (offset < 100){
            self.pageControl.currentPage = 0
        }
        else if (offset < 300){ // second page
            self.pageControl.currentPage = 1
        }
        else { // last page
            self.pageControl.currentPage = 2
        }
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        print("scrollViewDidEndDecelerating: \(offset)")
        
        if (offset == 0){
            print("FIRST PAGE")
            self.pageControl.currentPage = 0
        }

        if (offset == 200){
            print("SECOND PAGE")
            self.pageControl.currentPage = 1
        }
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn: ")
        textField.resignFirstResponder()
        return true
    }
    

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        print("shouldChangeCharactersInRange: "+string)
        if (string == "a"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if (string == "e"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if (string == "i"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if (string == "o"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if (string == "u"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else {
            self.view.backgroundColor = UIColor.lightGrayColor()
        }
        
        return true

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
    }


}

