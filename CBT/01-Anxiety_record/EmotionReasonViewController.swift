//
//  EmotionReasonViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class EmotionReasonViewController: UIViewController {
    
    @IBOutlet var backgroundColorView: [UIView]!
    @IBOutlet weak var recordMoreButton: UIButton!
    @IBOutlet weak var recordEndButton: UIButton!
    
    var selectedTags = [String]()
    
    var selectedReasons = [Int]()
    
    var clickedTag = 0
    
    let purple = UIColor(red: 89/255.0, green: 90/255.0, blue: 219/255.0, alpha: 0.5)
    let textPurple = UIColor(red: 67/255.0, green: 44/255.0, blue: 129/255.0, alpha: 1.0)
    let darkPurple = UIColor(red: 93/255.0, green: 95/255.0, blue: 239/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundColorView.forEach { each in
            each.layer.cornerRadius = each.frame.height/2.0
            let button = each.subviews.compactMap{$0 as? UIButton}[0]
            let imageView = each.subviews.compactMap{$0 as? UIImageView}[0]
            
            button.tag = backgroundColorView.firstIndex(of: each)!
            button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
            
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = textPurple
        }
        
        recordMoreButton.layer.cornerRadius = recordMoreButton.frame.height/2.0
        recordEndButton.layer.cornerRadius = recordEndButton.frame.height/2.0
    }
    
    @objc func pressed(sender: UIButton) {
        let pressedView = backgroundColorView[sender.tag]
        let imageView = pressedView.subviews.compactMap{$0 as? UIImageView}[0]
        if selectedReasons.contains(sender.tag) {
            pressedView.backgroundColor = purple
            imageView.tintColor = textPurple
            
            selectedReasons.removeAll { $0 == sender.tag }
        } else {
            pressedView.backgroundColor = darkPurple
            imageView.tintColor = .white
            
            selectedReasons.append(sender.tag)
        }
        
    }
    
    @IBAction func viewMoreClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WriteDetailViewController") as! WriteDetailViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func recordEndClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
