//
//  ViewController.swift
//  CircularLayoutView
//
//  Created by ahmedk92 on 04/07/2018.
//  Copyright (c) 2018 ahmedk92. All rights reserved.
//

import UIKit
import CircularLayoutView

class ViewController: UIViewController {
    
    @IBOutlet private weak var circularLayoutView: CircularLayoutView!
    
    @IBAction private func startDemo() {
        
        circularLayoutView.shift = -60
        
        for subview in circularLayoutView.subviews {
            subview.removeFromSuperview()
        }
        
        for i in 1...12 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i), execute: {
                let button = UIButton.init(frame: .zero)
                button.setTitleColor(.blue, for: .normal)
                button.setTitle("\(i)", for: .normal)
                self.circularLayoutView.addSubview(button)
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

