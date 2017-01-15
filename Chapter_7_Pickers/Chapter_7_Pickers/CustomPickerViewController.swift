//
//  CustomPickerViewController.swift
//  Chapter_7_Pickers
//
//  Created by Wei Li on 14/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    private var images: [UIImage!] = []
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    private var winSoundID: SystemSoundID = 0
    private var crunchSoundID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        images = [UIImage(named: "seven")!, UIImage(named: "bar")!, UIImage(named: "crown")!, UIImage(named: "cherry")!, UIImage(named: "lemon")!, UIImage(named: "apple")!]
        winLabel.text = " "
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showButton() {
        button.hidden = false
    }
    
    func playWinSound() {
        if winSoundID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource("win", withExtension: "wav")! as CFURLRef
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        winLabel.text = "WINNER!"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            self.showButton()
        }
    }
    
    @IBAction func spin(sender: AnyObject) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal {
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 3 {
                win = true
            }
        }
        
        if crunchSoundID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource("crunch", withExtension: "wav")! as CFURLRef
            AudioServicesCreateSystemSoundID(soundURL, &crunchSoundID)
        }
        AudioServicesPlaySystemSound(crunchSoundID)
        
        if win {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(0.5*Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                self.playWinSound()
            }
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(0.5*Double(NSEC_PER_SEC))), dispatch_get_main_queue()){
                self.showButton()
            }
        }
        
        button.hidden = true
        winLabel.text = " "
        
        //winLabel.text = win ? "WINNER!" : " "
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}
