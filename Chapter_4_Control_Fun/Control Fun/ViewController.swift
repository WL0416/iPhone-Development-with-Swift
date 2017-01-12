//
//  ViewController.swift
//  Control Fun
//
//  Created by Wei Li on 7/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    @IBOutlet weak var dosometingButton: UIButton!
    
    @IBAction func textFieldDoneEditing(sender: UITextField){
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UITextField) {
        numberField.resignFirstResponder()
        nameField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    
    @IBAction func sitchChanged(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            dosometingButton.hidden = true
        } else {
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            dosometingButton.hidden = false
        }
        
    }
    
    @IBAction func buttonPressed(sender: UIButton){
        let controller = UIAlertController(title: "Are You Sure?",message: nil,preferredStyle: .ActionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure!",style: .Destructive,handler: {
            action in
            let msg = self.nameField.text!.isEmpty ? "You can breathe easy, everything is OK." : "You can breathe easy, \(self.nameField.text),"+" everything went OK."
            let controller2 = UIAlertController(title: "Something was done",message: msg,preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Phew!",style: .Cancel,handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No way!",style: .Cancel,handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .Down
        }
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
    }
}

