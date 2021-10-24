//
//  WhatSkillViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class WhatSkillViewController: UIViewController {
    
    var selectedTags = [String]()
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var recordLaterButton: UIButton!
    @IBOutlet weak var recordEndButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordLaterButton.layer.cornerRadius = recordLaterButton.frame.height/2.0
        recordEndButton.layer.cornerRadius = recordEndButton.frame.height/2.0
        
        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        view2.layer.borderColor = UIColor(red: 89/255.0, green: 90/255.0, blue: 219/255.0, alpha: 1.0).cgColor
        view2.layer.borderWidth = 2
        view3.layer.cornerRadius = 10
        view4.layer.cornerRadius = 10
    }
    
    @IBAction func recordSkillClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewSkillViewController") as! NewSkillViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func skillClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangedEmotionExtentViewController") as! ChangedEmotionExtentViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func recordEndClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
