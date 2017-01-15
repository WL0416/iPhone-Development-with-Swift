//
//  DependentComponentPickerViewController.swift
//  Chapter_7_Pickers
//
//  Created by Wei Li on 14/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var dependentPicker: UIPickerView!
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String: [String]]!
    private var states: [String]!
    private var zips: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let bundle = NSBundle.mainBundle()
        let plistURL = bundle.URLForResource("statedictionary", withExtension: "plist")
        stateZips = NSDictionary(contentsOfURL: plistURL!) as! [String: [String]]
        
        let allStates = stateZips.keys
        states = allStates.sort()
        
        let selectedState = states[0]
        zips = stateZips[selectedState]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buttonPressed(sender: AnyObject) {
        let statesRow = dependentPicker.selectedRowInComponent(stateComponent)
        let zipRow = dependentPicker.selectedRowInComponent(zipComponent)
        
        let state = states[statesRow]
        let zip = zips[zipRow]
        let message = "You are selecting \(state) zip number \(zip)"
        
        let alert = UIAlertController(title: "Thank you", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Nice", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent {
            return states.count
        } else {
            return zips.count
        }
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == stateComponent {
            return states[row]
        } else {
            return zips[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependentPicker.reloadComponent(zipComponent)
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
}
