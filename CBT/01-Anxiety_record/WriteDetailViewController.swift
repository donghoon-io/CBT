//
//  WriteDetailViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit

class WriteDetailViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var recordEndButton: UIButton!
    
    var selectedTags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.text = "불안했던 상황에 대해 묘사해주세요"
        textView.textColor = UIColor.lightGray
        
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        recordEndButton.layer.cornerRadius = recordEndButton.frame.height/2.0

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "불안했던 상황에 대해 묘사해주세요"
            textView.textColor = UIColor.lightGray
        }
    }

    @IBAction func recordEndClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "적용해본 대처 방법이 있으신가요?", message: nil, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "아니오", style: .cancel) { action in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SkillRecommendViewController") as! SkillRecommendViewController
            vc.selectedTags = self.selectedTags
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let action2 = UIAlertAction(title: "네", style: .default) { action in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WhatSkillViewController") as! WhatSkillViewController
            vc.selectedTags = self.selectedTags
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        self.present(alert, animated: true, completion: nil)
    }
}
