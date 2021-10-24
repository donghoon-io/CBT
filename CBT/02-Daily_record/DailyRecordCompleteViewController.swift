//
//  DailyRecordCompleteViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class DailyRecordCompleteViewController: UIViewController {
    
    var selectedTags = [String]()
    
    @IBOutlet weak var recordCompleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recordCompleteButton.layer.cornerRadius = recordCompleteButton.frame.height/2.0
    }
    
    @IBAction func recordCompleteClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
