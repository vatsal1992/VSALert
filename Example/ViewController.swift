//
//  ViewController.swift
//  Example
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit
import VSAlert


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        var height:CGFloat = 35
        var position:CGFloat = 50
        
        let btn1 = UIButton(frame: CGRect(x: 50, y: position, width: 150, height: height))
        btn1.setTitle("Show simple alert", for: UIControl.State.normal)
        btn1.setTitleColor(.darkGray, for: .normal)
        btn1.addTarget(self, action: #selector(clickToShowSimpleAlert), for: .touchUpInside)
        self.view.addSubview(btn1)
        position = position + height
        
        let btn2 = UIButton(frame: CGRect(x: 50, y: position, width: 150, height: height))
        btn2.setTitle("Show 2 buttons", for: UIControl.State.normal)
        btn2.setTitleColor(.darkGray, for: .normal)
        btn2.addTarget(self, action: #selector(clickToShowTwoButtons), for: .touchUpInside)
        self.view.addSubview(btn2)
        
        position = position + height
        
        let btn3 = UIButton(frame: CGRect(x: 50, y: position, width: 150, height: height))
        btn3.setTitle("Show 3 buttons", for: UIControl.State.normal)
        btn3.setTitleColor(.darkGray, for: .normal)
        btn3.addTarget(self, action: #selector(clickToShowThreeButtons), for: .touchUpInside)
        self.view.addSubview(btn3)
    }

    
    @objc func clickToShowSimpleAlert() {
        var config = VSAlertConfiguration.config
        config.showActivity = true
        let alert = VSAlertController(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",configuration: config)
        
        var config1 = VSAlertActionConfiguration.config
        config1.backgroundColor = .red
        config1.forgroundColor = .white
        let action1 = VSAlertAction(title: "Action1", actionStyle: config1) { _ in
            print("Action1 tapped")
        }
        alert.addAction(action1)
        
        alert.present(on: self, completion: nil)
    }

    @objc func clickToShowTwoButtons() {
        let alert = VSAlertController(title: "Vatsal", message: "My surname is 'Shukla'.\nMy father's name 'Mukeshbhai shukla.\nMy brother's name 'Parth'.")
        var config1 = VSAlertActionConfiguration.config
        config1.backgroundColor = .red
        config1.forgroundColor = .white
        let action1 = VSAlertAction(title: "Action1", actionStyle: config1) { _ in
            print("Action1 tapped")
        }
        alert.addAction(action1)
        
        var config2 = VSAlertActionConfiguration.config
        config2.backgroundColor = .blue
        config2.forgroundColor = .white
        let action2 = VSAlertAction(title: "Action2", actionStyle: config2) { _ in
            print("Action2 tapped")
        }
        alert.addAction(action2)
        alert.present(on: self, completion: nil)
    }
    
    @objc func clickToShowThreeButtons() {
        var config = VSAlertConfiguration.config
        config.showActivity = false
        let alert = VSAlertController(title: "Vatsal Shukla", message: "My surname is 'Shukla'.\nMy father's name 'Mukeshbhai shukla.\nMy brother's name 'Parth'.",configuration: config)
        var config1 = VSAlertActionConfiguration.config
        config1.backgroundColor = .red
        config1.forgroundColor = .white
        let action1 = VSAlertAction(title: "Action1", actionStyle: config1) { _ in
            print("Action1 tapped")
        }
        alert.addAction(action1)
        
        var config2 = VSAlertActionConfiguration.config
        config2.backgroundColor = .blue
        config2.forgroundColor = .white
        let action2 = VSAlertAction(title: "Action2", actionStyle: config2) { _ in
            print("Action2 tapped")
        }
        alert.addAction(action2)
        
        var config3 = VSAlertActionConfiguration.config
        config3.backgroundColor = .blue
        config3.forgroundColor = .white
        let action3 = VSAlertAction(title: "Action3", actionStyle: config3) { _ in
            print("Action3 tapped")
        }
        alert.addAction(action3)
        
        alert.present(on: self, completion: nil)
    }
}

