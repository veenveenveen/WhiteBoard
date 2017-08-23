//
//  ViewController.swift
//  WhiteBoard
//
//  Created by 黄启明 on 2017/8/22.
//  Copyright © 2017年 Himin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var drawView: DrawView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawView = DrawView()
        drawView.backgroundColor = UIColor.white
        drawView.frame = view.bounds
        view.addSubview(drawView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

