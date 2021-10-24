//
//  SkillRecommendViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class SkillRecommendViewController: UIViewController {
    
    var selectedTags = [String]()
    
    @IBOutlet weak var recordEndButton: UIButton!
    @IBOutlet weak var recordLaterButton: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.layer.cornerRadius = 10
        view2.layer.cornerRadius = 10
        
        recordEndButton.layer.cornerRadius = recordEndButton.frame.height/2.0
        recordLaterButton.layer.cornerRadius = recordLaterButton.frame.height/2.0
    }
    
    @IBAction func recordLaterClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "나중에 알림", message: nil, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "5분 후", style: .default) { action in
        }
        let action2 = UIAlertAction(title: "10분 후", style: .default) { action in
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func skillClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SkillDetailViewController") as! SkillDetailViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func recordEndClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
