//
//  DependentComponentPickerViewController.swift
//  Chapter_7_Pickers
//
//  Created by Wei Li on 14/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String: [String]]!
    private var states: [String]!
    private var zips: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
