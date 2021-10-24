//
//  NewSkillViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class NewSkillViewController: UIViewController {
    
    var selectedTags = [String]()
    
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = addButton.frame.height/2.0
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangedEmotionExtentViewController") as! ChangedEmotionExtentViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
