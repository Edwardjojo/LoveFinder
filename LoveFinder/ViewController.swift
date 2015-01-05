//
//  ViewController.swift
//  LoveFinder
//
//  Created by Edwardjojo on 1/4/15.
//  Copyright (c) 2015 Edwardjojo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var DOB: UIDatePicker!
    @IBOutlet weak var hight: UISlider!
    @IBOutlet weak var hightLabel: UILabel!
    @IBOutlet weak var house: UISwitch!
    @IBOutlet weak var result: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func heightChanged(sender: AnyObject) {
        //var slider = sender as UISlider
        //hightLabel.text = "\(Int(slider.value))cm"
        hightLabel.text = "\(Int(hight.value))cm"
        
    }
    @IBAction func okTapped(sender: AnyObject) {
        let genderText = gender.selectedSegmentIndex==0 ? "Male":"Female"
        let geo = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let components = geo.components(NSCalendarUnit.YearCalendarUnit, fromDate: DOB.date, toDate: now, options: NSCalendarOptions(0))
        let age = components.year
        let hasHouseText = house.on == 0 ? "no house":"has house"
        result.text = "\(name.text), \(genderText), \(age),\(hightLabel.text!), \(hasHouseText)"
    }
    
    //textFieldDelegate
    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

