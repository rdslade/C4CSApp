//
//  ViewController.swift
//  C4CS
//
//  Created by Ryan Slade on 11/27/18.
//  Copyright © 2018 Ryan Slade. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var timeUpdate: UIButton!
    @IBOutlet weak var prompt: UITextView!
    @IBOutlet weak var outputResponse: UITextView!
    @IBOutlet weak var nameLabel: UITextView!
    
    func updateAllElementColor(color:UIColor){
        self.view.backgroundColor = color;
        outputResponse.backgroundColor = color;
        prompt.backgroundColor = color;
        nameLabel.backgroundColor = color;
    }
    
    @objc func buttonClicked(_ sender: AnyObject?){
        update();
    }
    
    func update(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let day = calendar.component(.weekday, from: date)
        
        var dayOfWeek = "";
        switch(day){
        case 1:
            dayOfWeek = "Sunday";
        case 2:
            dayOfWeek = "Monday";
            break;
        case 3:
            dayOfWeek = "Tuesday";
            break;
        case 4:
            dayOfWeek = "Wednesday";
            break;
        case 5:
            dayOfWeek = "Thursday";
            break;
        case 6:
            dayOfWeek = "Friday";
            break;
        case 7:
            dayOfWeek = "Saturday";
            break;
        default:
            dayOfWeek = "Error";
        }
        
        timeUpdate.setTitle("Updated: \(dayOfWeek) @ \(hour):\(minutes)", for: .normal);
        
        if(day == 6 && hour >= 10 && hour <= 12){
            outputResponse.text = "YES! :)"
            updateAllElementColor(color: UIColor.green);
        }
        else{
            outputResponse.text = "No :("
            updateAllElementColor(color: UIColor.red);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        update()
        timeUpdate.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    }
    
    
}
