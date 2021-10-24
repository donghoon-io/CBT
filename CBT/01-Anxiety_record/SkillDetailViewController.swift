//
//  SkillDetailViewController.swift
//  CBT
//
//  Created by Donghoon Shin on 2021/10/24.
//

import UIKit
import WebKit

class SkillDetailViewController: UIViewController {
    
    var selectedTags = [String]()

    @IBOutlet weak var skillView: UIView!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var recordEndButton: UIButton!
    @IBOutlet weak var recordLaterButton: UIButton!
    
    var videoCode = "qkDjMJkLxIo"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        skillView.layer.cornerRadius = 10
        
        recordEndButton.layer.cornerRadius = recordEndButton.frame.height/2.0
        recordLaterButton.layer.cornerRadius = recordLaterButton.frame.height/2.0
        
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        webView.load(URLRequest(url: url!))
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
    @IBAction func startClicked(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangedEmotionExtentViewController") as! ChangedEmotionExtentViewController
        vc.selectedTags = self.selectedTags
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func recordEndClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
