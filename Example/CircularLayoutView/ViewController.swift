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
    private var timers: [Timer] = []
    
    @IBAction private func startDemo() {
        
        for timer in timers {
            timer.invalidate()
        }
        timers.removeAll()
        
        for subview in circularLayoutView.subviews {
            subview.removeFromSuperview()
        }
        
        circularLayoutView.shift = -60
        
        for i in 1...12 {
            timers.append(Timer.scheduledTimer(timeInterval: TimeInterval(i), target: self, selector: #selector(timerCallback), userInfo: i, repeats: false))
        }
    }
    
    @objc private func timerCallback(_ timer: Timer) {
        guard let i = timer.userInfo as? Int else { return }
        
        let button = UIButton.init(frame: .zero)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("\(i)", for: .normal)
        self.circularLayoutView.addSubview(button)
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

