//
//  ViewController.swift
//  Listview
//
//  Created by Dan Kwon on 4/24/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var imagesScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    var namesArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstSlide.backgroundColor = UIColor.blueColor()
        self.imagesScroll.addSubview(firstSlide)
        
        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondSlide.backgroundColor = UIColor.greenColor()
        self.imagesScroll.addSubview(secondSlide)
        
        self.imagesScroll.contentSize = CGSize(width: 400, height: 0)
        self.imagesScroll.delegate = self
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
//        print("scrollViewDidScroll: \(offset)")
        
        if (offset > 100){
            self.view.backgroundColor = UIColor.redColor()
        }
        else {
            self.view.backgroundColor = UIColor.lightGrayColor()
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

