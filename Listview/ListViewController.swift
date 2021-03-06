//
//  ListViewController.swift
//  Listview
//
//  Created by Dan Kwon on 4/24/16.
//  Copyright © 2016 fullstack360. All rights reserved.


import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    override func loadView() {
//        self.edgesForExtendedLayout = .None
//        let frame = UIScreen.mainScreen().bounds
//        let view = UIView(frame: frame)
//        view.backgroundColor = UIColor.orangeColor()
//
//        let scrollview = UIScrollView(frame: frame)
//        scrollview.backgroundColor = UIColor.yellowColor()
//        view.addSubview(scrollview)
//        
//        let width = frame.size.width-40
//        var y = CGFloat(100)
//        
//        for i in 0...30{
//            let btn = UIButton(frame: CGRect(x: 20, y: y, width: width, height: 44))
//            btn.backgroundColor = UIColor.greenColor()
//            scrollview.addSubview(btn)
//            y += 64
//        }
//        
//        scrollview.contentSize = CGSize(width: 0, height: y+64)
//        self.view = view
//    }
    
    var namesTable: UITableView!
    var namesArray: Array<String>!
    
    override func loadView() {
//        self.namesArray = ["donald trump", "hillary clinton", "bernie sanders", "ted cruz"]
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.orangeColor()
        
        self.namesTable = UITableView(frame: frame, style: .Plain)
        self.namesTable.dataSource = self
        self.namesTable.delegate = self
        view.addSubview(self.namesTable)
        
        self.view = view
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.namesArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellID"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            print("REUSE CELL")
            cell.textLabel?.text = self.namesArray[indexPath.row]
            return cell
        }

        print("CREATE NEW CELL")
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = self.namesArray[indexPath.row]
        return cell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
